#' Load MegaDetector Model
#'
#' Loads the MegaDetector model.
#'
#' @param model_file Path to the checkpoint file or a model identifier (e.g., "MDV5A", "MDV5B").
#'   If a reserved name like "MDV5A" is used, the package may download the weights automatically.
#' @return A loaded model object (Python object).
#' @export
load_model <- function(model_file = "MDV5A") {
  if (is.null(md)) stop("MegaDetector module not loaded.")

load_model <- function(model_file = "MDV5A") {
  if (is.null(md)) stop("MegaDetector module not loaded.")

  # run_detector might not be exposed in detection module, import explicitly
  rd <- tryCatch({
    reticulate::import("megadetector.detection.run_detector")
  }, error = function(e) {
    stop("Could not import megadetector.detection.run_detector: ", e$message)
  })

  return(rd$load_detector(model_file))
}
}

#' Detect Objects in Image
#'
#' Runs detection on a single image.
#'
#' @param model A loaded model object.
#' @param image_file Path to the image file.
#' @return A list containing detection results.
#' @export
detect_image <- function(model, image_file) {
  if (is.null(md)) stop("MegaDetector module not loaded.")
  
detect_image <- function(model, image_file) {
  if (is.null(md)) stop("MegaDetector module not loaded.")
  
  rd <- tryCatch({
    reticulate::import("megadetector.detection.run_detector")
  }, error = function(e) {
    stop("Could not import megadetector.detection.run_detector: ", e$message)
  })
  
  return(rd$run_detector_on_image(model, image_file))
}
}
