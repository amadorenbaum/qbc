import sys
import PIL.Image

screen_types = [
  (0, 80, 24, 8, 16),
  (1, 40, 25, 16, 16),
  (2, 80, 25, 8, 16),
  (7, 40, 25, 16, 16),
  (8, 80, 25, 8, 16),
  (9, 80, 25, 8, 14),
  (10, 80, 25, 8, 14),
  (11, 80, 30, 8, 16),
  (12, 80, 30, 8, 16),
  (13, 40, 25, 16, 16),
]

class Screen(object):
    def __init__(self, num, wc, hc, wp, hp):
        self.num, self.wc, self.hc, self.wp, self.hp = num, wc, hc, wp, hp
        self.w = self.wc * self.wp
        self.h = self.hc * self.hp

def character(screen, screen_img, asc):
  out = PIL.Image.new('RGB', (screen.wp, screen.hp))
  jc0 = asc // screen.wc
  ic0 = asc % screen.wc
  i0 = ic0 * screen.wp
  j0 = jc0 * screen.hp
  for i in range(screen.wp):
    for j in range(screen.hp):
      p = screen_img.getpixel((i0 + i, j0 + j))
      out.putpixel((i, j), (0, 0, 0) if p in [0] else (255, 255, 255))
  return out

def coordinates(char_img):
  w, h = char_img.size
  filas = []
  for j in range(h):
    subseq = []
    anterior = True
    for i in range(w):
      p = char_img.getpixel((i, j))
      actual = (p == (255, 255, 255))
      if actual:
        subseq.append(i)
      else:
        filas.append((j, subseq))
        subseq = []
      anterior = actual
    filas.append((j, subseq))
  coords = []
  for j, subseq in filas:
    if len(subseq) == 0: continue
    coords.append('[%u,%u,%u]' % (subseq[0], j, subseq[-1] - subseq[0] + 1))
  return '[%s]' % (','.join(coords),)

for screen_type in screen_types:
    screen = Screen(*screen_type)

    img = PIL.Image.open('screen%u.png' % (screen.num,))
     
    f = open('../../runtime/fonts/screen%u.js' % (screen.num,), 'w')
    f.write('var SCREEN%u_DATA = [\n' % (screen.num,));
    for asc in range(256):
        char_img = character(screen, img, asc)
        f.write(coordinates(char_img))
        if asc != 255:
            f.write(',')
        f.write('\n')
    f.write('];\n');
    f.close()
    print 'screen ', screen.num, ' ok!'

