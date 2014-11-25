import os
import base64
import struct
import math

from lang.utils import take_while_in, DIGIT

CONVERT_TO_MP3 = True

def pack2(n):
    return struct.pack('<H', n)

def pack4(n):
    return struct.pack('<I', n)

NOTES = ['c', 'c+', 'd', 'd+', 'e', 'f', 'f+', 'g', 'g+', 'a', 'a+', 'b']

def normalize_note(note):
    if note.endswith('+'):
        i = NOTES.index(note)
        return NOTES[(i + 1) % len(NOTES)]
    elif note.endswith('+'):
        i = NOTES.index(note)
        return NOTES[(i - 1) % len(NOTES)]
    else:
        return note

def frequency_for(octave, note):
    base = 55.0
    note_diff = NOTES.index(note) - NOTES.index('a') 
    return base * 2 ** (octave + float(note_diff) / 12)

def duration_for(tempo, duration):
    # tempo: quarter notes per minute
    return (4.0 / duration) * (60.0 / tempo)

def wav_to_mp3(wav_data):
    # XXX: hack :-)
    f = open('_tmp_.wav', 'w')
    f.write(wav_data)
    f.close()
    os.system('lame --preset standard _tmp_.wav _tmp_.mp3')
    f = open('_tmp_.mp3', 'r')
    mp3_data = f.read()
    f.close()
    return mp3_data

class SoundGenerator(object):

    def __init__(self, samples_per_second):
        self.samples_per_second = samples_per_second
        self.bytes_per_sample = 1
        self.channel = 1 # mono
        self.format = 1  # PCM

        self._compiled_sounds = []
        self._sound_table = {}

        self.tempo = 120             # quarter notes per minute
        self.octave = 4              # 0-6
        self.note_length = 4
        self.proportion = 7.0 / 8    # normal

    def urlencoded_audio(self, samples):
        raw = ''.join(map(chr, samples))
        wav = ''
        wav += 'WAVE'
        wav += 'fmt '
        wav += pack4(0x10)
        wav += pack2(self.format)
        wav += pack2(self.channel)
        wav += pack4(self.samples_per_second)
        wav += pack4(self.samples_per_second * self.bytes_per_sample)
        wav += pack2(self.bytes_per_sample)
        wav += pack2(8 * self.bytes_per_sample)
        wav += 'data'
        wav += pack4(len(raw) + 2)
        wav += raw
        riff = 'RIFF' + pack4(len(wav)) + wav
        if CONVERT_TO_MP3:
            fmt = 'mp3'
            data = wav_to_mp3(riff)
        else:
            fmt = 'wav'
            data = riff
        return 'data:audio/' + fmt + ';base64,' + base64.encodestring(data).replace('\n', '')

    def sine_sq_wave(self, dur_s, freq_hz):
        freq_hz = float(freq_hz)
        dur_samples = int(self.samples_per_second * dur_s)
        samples = []
        for i in range(dur_samples):
            s = abs(math.sin(float(i) * (freq_hz / self.samples_per_second) * 2 * math.pi))
            s = s * s
            samples.append(128 + int(127 * s))
        return samples

    def silence(self, dur_s):
        dur_samples = int(self.samples_per_second * dur_s)
        samples = []
        for i in range(dur_samples):
            samples.append(0)
        return samples

    def melody(self, string):
        string = string.lower()

        samples = []

        i = 0
        while i < len(string):
            if string[i] in 'cdefgabp':
                note = string[i]
                i += 1
                if note != 'p' and i < len(string) and string[i] in '+-':
                    note += string[i]
                    i += 1
                note = normalize_note(note)
                this_note_length = self.note_length
                if i < len(string) and string[i] in DIGIT:
                    i, this_note_length_string = take_while_in(string, i, DIGIT)
                    this_note_length = int(this_note_length_string)

                dur = duration_for(self.tempo, this_note_length)

                while i < len(string) and string[i] == '.':
                    dur = dur * 1.5
                    i += 1

                if note == 'p':
                    samples.extend(self.silence(dur))
                else:
                    samples.extend(self.sine_sq_wave(self.proportion * dur, frequency_for(self.octave, note)))
                    samples.extend(self.silence((1 - self.proportion) * dur))
            elif string[i] in 'l':
                i += 1
                if not (i < len(string) and string[i] in DIGIT):
                    raise Exception('PLAY: L(ength) expected a number: "%s"' % (string,))
                i, note_length_string = take_while_in(string, i, DIGIT)
                self.note_length = int(note_length_string)
            elif string[i] in 'o':
                i += 1
                if not (i < len(string) and string[i] in DIGIT):
                    raise Exception('PLAY: O(ctave) expected a number: "%s"' % (string,))
                i, octave_string = take_while_in(string, i, DIGIT)
                self.octave = int(octave_string)
            elif string[i] == '<':
                i += 1
                self.octave = (octave - 1) % 6
            elif string[i] == '>':
                i += 1
                self.octave = (octave + 1) % 6
            elif string[i] in 'm':
                i += 1
                if not (i < len(string) and string[i] in 'snlbf'):
                    raise Exception('PLAY: M(ode) expected a letter: S(taccato)/N(ormal)/L(ong)/F(oreground)/B(ackground)"' % (string,))
                mode = string[i]
                if mode == 's':
                    self.proportion = 3.0 / 4
                elif mode == 'n':
                    self.proportion = 7.0 / 8
                elif mode == 'l':
                    self.proportion = 1.0

                if mode in 'bf':
                    print 'Warning: foreground/background mode for PLAY not implemented'

                i += 1
            elif string[i] == ' ':
                i += 1
            else:
                raise Exception('Unknown directives for PLAY: "%s"' % (string,))
        return samples

    def compile_sound(self, sound):
        if sound in self._sound_table:
            return self._sound_table[sound]
        else:
            if isinstance(sound, tuple):
                (dur_s, freq_hz) = sound
                sound_samples = self.sine_sq_wave(dur_s, freq_hz)
            else:
                sound_samples = self.melody(sound)
            sound_id = len(self._compiled_sounds)
            self._compiled_sounds.append((sound_id, self._sound_definition(sound_samples)))
            self._sound_table[sound] = sound_id
            return sound_id

    def sounds(self):
        return self._compiled_sounds

    def _sound_definition(self, samples):
        return 'new Audio("' + self.urlencoded_audio(samples) + '")'

