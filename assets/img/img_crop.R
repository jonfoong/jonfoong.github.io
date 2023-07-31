library(cropcircles)
library(magick)

img <- image_read("assets/img/avatar.jpeg")

dat <- image_info(img)

crop_height <- 200
crop_width <- 200

h <- dat$height
w <- dat$width

geometry <- paste0(w-crop_width, "x", h-crop_height, "+", crop_width/2, "+", crop_height/2)

obj <- image_crop(img, geometry = geometry)

img <- circle_crop(obj,
                   to = "assets/img/cropped_avatar.png",
                   border_colour = "white",
                   border_size = 15)

# crop author img

img <- image_read("assets/img/author.jpg")

img <- image_scale(img, "660x990")

# now crop

image_crop(img, "420x300+115+210") |>
  circle_crop(
                   to = "assets/img/cropped_author.jpg",
                   border_colour = "black",
                   border_size = 10)
