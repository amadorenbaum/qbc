import PIL.Image

f = open('../../runtime/palette.js', 'w')
img = PIL.Image.open('colors.png')
img = img.convert('RGB')
w = 16
f.write('var PALETTE = {\n')
for j in range(16):
    for i in range(16):
        n = 16 * j + i
        r, g, b = img.getpixel((w * i, w * j))
        f.write('\t%s: "#%.2x%.2x%.2x",\n' % (n, r, g, b))
f.write('};\n')
f.close()
