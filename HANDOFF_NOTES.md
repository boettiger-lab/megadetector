# Handoff Notes

## Project Status
- **Location**: `~/Documents/github/boettiger-lab/megadetector`
- **Current State**: Initial R package skeleton created.
    - `DESCRIPTION`: Configured with `reticulate` dependency.
    - `R/install.R`: Contains `install_megadetector()` helper.
    - `R/wrapper.R`: Contains `load_model()` and `detect_image()` wrappers.
    - `R/zzz.R`: configured for `delay_load`.
    - `tests/`: Basic `testthat` infrastructure.

## Immediate Goal
Verify the package installs and runs correctly inside a generic Docker container (`rocker/ml`) to ensure portability.

## Next Steps for New Session
1. **Open Workspace**: Open the folder `~/Documents/github/boettiger-lab/megadetector`.
2. **Run Verification**: Execute the following Docker command to test the package. This mounts the current folder, installs the package, and attempts to load the model.

```bash
docker run --rm \
  -v ~/Documents/github/boettiger-lab/megadetector:/payload \
  -w /payload \
  rocker/ml \
  Rscript -e "install.packages('reticulate'); devtools::install('.', dependencies=FALSE); library(megadetector); tryCatch({install_megadetector(method='auto'); model <- load_model('MDV5A'); print(model); print('SUCCESS')}, error=function(e) {print(e); quit(status=1)})"
```

## Known Risks / Things to Watch
- **Python Path**: `reticulate` inside Docker can sometimes have environment discovery issues. The `install_megadetector` function is set to `auto`, but you might need to enforce a specific virtualenv if `rocker/ml` behaves unexpectedly.
- **Import Structure**: The `R/wrapper.R` file assumes the Python package structure follows `megadetector.detection.run_detector`. If the installed `megadetector` package (v5+) has a different internal structure, the `load_model` function will fail and the path to the python function will need to be updated.
