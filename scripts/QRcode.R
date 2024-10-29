# Install required packages if not already installed
if (!require("qrcode")) {
  install.packages("qrcode")
}
if (!require("rsvg")) {
  install.packages("rsvg")
}

library(qrcode)
library(rsvg)

# Function to generate QR code and convert to JPEG
generate_qr <- function(url, filename = "qr_code", size = 10) {
  # Generate SVG QR code
  qr <- qr_code(url)
  
  # Create filenames for both formats
  svg_filename <- paste0(filename, ".svg")
  jpg_filename <- paste0(filename, ".jpg")
  
  # Save to SVG file
  generate_svg(qr, 
               filename = svg_filename,
               size = size,
               show = FALSE)
  
  # Convert SVG to JPEG
  rsvg_convert(svg_filename, jpg_filename, width = size * 100)
  
  # Print success message
  cat("QR code has been generated as", svg_filename, "and", jpg_filename, "\n")
}

# Generate QR code for your website
url <- "https://black-jl.github.io/vita/"
generate_qr(url)