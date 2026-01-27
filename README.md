# megadetector

An R wrapper for the Python [MegaDetector](https://pypi.org/project/megadetector/) package, facilitating object detection in camera trap images.

## Installation

You can install the package from source:

```r
devtools::install(".")
```

After installing the R package, you must install the underlying Python dependency:

```r
library(megadetector)
install_megadetector()
```

## Usage

```r
library(megadetector)

# Load the model (downloads MDV5A by default if needed)
model <- load_model("MDV5A")

# Detect objects in an image
# image_path <- "path/to/image.jpg"
# results <- detect_image(model, image_path)
```
