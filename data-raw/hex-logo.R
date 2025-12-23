# Script to generate the calvinball hex logo
# Requires: hexSticker, magick packages

library(hexSticker)
library(magick)

# Read the original image
img <- image_read("img/calvinball.webp")

# Create hex sticker
sticker(
  img,
  package = "calvinball",
  p_size = 20,
  p_color = "#2C3E50",
  p_family = "sans",
  p_fontface = "bold",
  p_y = 1.4,
  s_x = 1,
  s_y = 0.75,
  s_width = 0.6,
  s_height = 0.6,
  h_fill = "#FFD93D",
  h_color = "#E74C3C",
  h_size = 2,
  url = "github.com/jamesblair/calvinball",
  u_size = 4,
  u_color = "#2C3E50",
  filename = "man/figures/logo.png",
  dpi = 300
)

# Also save a smaller version for the README
sticker(
  img,
  package = "calvinball",
  p_size = 20,
  p_color = "#2C3E50",
  p_family = "sans",
  p_fontface = "bold",
  p_y = 1.4,
  s_x = 1,
  s_y = 0.75,
  s_width = 0.6,
  s_height = 0.6,
  h_fill = "#FFD93D",
  h_color = "#E74C3C",
  h_size = 2,
  filename = "man/figures/logo-small.png",
  dpi = 150
)

message("Hex logo created at man/figures/logo.png")
