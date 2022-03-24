from PIL import Image

filename = "1"
ext = ".png"
new_res = (16,16)

image = Image.open(filename+ext)
image_r = image.resize(new_res)
image_r.save(filename+'_2'+ext)
