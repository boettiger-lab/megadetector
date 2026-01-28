test_that("MegaDetector loads and detects objects", {
  skip_if_not_installed("reticulate")
  
  # Ensure python dependency is present (install in temp path if feasible, or skip)
  if (!reticulate::py_module_available("megadetector")) {
    skip("MegaDetector python package not available")
  }
  
  # Load model (mocks download if needed or uses cache)
  model <- load_model()
  expect_true(!is.null(model))
  
  # Use bundled image
  img_path <- system.file("img", "Caltech_Animal.jpg", package = "megadetector")
  expect_true(file.exists(img_path))
  
  # Run detection
  detections <- detect_image(model, img_path)
  expect_true(is.list(detections))
  
  # Check classification
  # Animal image should be classified as animal
  class_label <- get_classification(detections)
  expect_equal(class_label, "animal")
  
  # Check confidence score logic
  if (length(detections) > 0) {
    expect_true(detections[[1]]$conf > 0.5)
  }
})
