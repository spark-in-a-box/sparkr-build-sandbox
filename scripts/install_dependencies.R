# Dependencies installed from snapshot repository.
# These installs are safe.
install.packages(c('e1071', 'praise'))

# Installed from mainstream repository.
# That's risky, as things can break, but we want to use latest release.
# For earlier versions it upgrades the following
# - processx
# - callr
# - prettyunits
# - withr
# - pkgbuild
# - ellipsis
# - pkgload
# - rlang
install.packages('testthat', repos='https://cloud.r-project.org/')

quit()
