library(magick)

# standardized gemoetry

w <- 760
h <- 428

ratio <- w/h

# read img

img <- image_read("assets/img/blog/originals/rgcp.jpg")

dat <- image_info(img)

# determine border dimensions

new_h <- dat$width/ratio

b_w <- 0
b_h <- (new_h - dat$height)/2

b_scale <- 1

img <- image_border(img, "white", sprintf("%fx%f", b_w*b_scale, b_h*b_scale))

# now resize but larger

new_scale <- 1

img <- image_scale(img, sprintf("%fx%f", w*new_scale, h*new_scale))

# write to file

image_write(img, "assets/img/blog/rgcp.jpg", format = "jpg")
