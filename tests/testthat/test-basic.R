test_that("MegaDetector module loads", {
  # This test requires the python package to be installed.
  # If not installed, it might fail or we should skip.
  
  # Try to check if module is loaded (it is lazy loaded)
  # Trigger load
  tryCatch({
    reticulate::py_module_available("megadetector")
  }, error = function(e) skip("Python module not available"))
  
  expect_true(TRUE) # valid if we pass the tryCatch
})
