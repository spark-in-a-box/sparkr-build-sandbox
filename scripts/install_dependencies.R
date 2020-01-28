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
# - pkgload
# - rlang
# We force installation of ellipsis, because there are some
# unstated version restrictions between it and testthat
install.packages(c("ellipsis", 'testthat'), repos='https://cloud.r-project.org/')

quit()
