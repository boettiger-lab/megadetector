#' Install MegaDetector Python Package
#'
#' Installs the megadetector python package and its dependencies.
#'
#' @param method Installation method ("auto", "virtualenv", "conda").
#' @param conda Path to conda executable (or "auto").
#' @param version Version of the package to install.
#' @param ... Additional arguments passed to \code{reticulate::py_install}.
#'
#' @export
install_megadetector <- function(method = "auto", conda = "auto", version = "default", pip = TRUE, ...) {
  package <- "megadetector"
  if (version != "default") {
    package <- paste0("megadetector==", version)
  }
  reticulate::py_install(package, method = method, conda = conda, pip = pip, ...)
}
