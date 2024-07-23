FROM bioconductor/bioconductor_docker:devel

WORKDIR /home/rstudio

COPY --chown=rstudio:rstudio . /home/rstudio/

RUN Rscript -e "options(repos = c(CRAN = 'https://cran.r-project.org')); BiocManager::install(version = 'devel'); devtools::install_github('pachterlab/SpatialFeatureExperiment', ref='devel'); devtools::install_github('pachterlab/voyager', ref='devel')"

RUN Rscript -e "options(repos = c(CRAN = 'https://cran.r-project.org')); devtools::install('.', dependencies=TRUE, repos = BiocManager::repositories())"
