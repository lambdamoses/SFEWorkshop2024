# Bioc2024 SFE and Voyager workshop 

## Overview

### Description

Exploratory spatial data analysis (ESDA) can be a powerful approach to understanding single-cell genomics datasets, but it is not yet part of standard data analysis workflows. In particular, geospatial analyses, which have been developed and refined for decades, have yet to be fully adapted and applied to spatial single-cell analysis. We introduce the `Voyager` platform, which systematically brings the geospatial ESDA tradition to (spatial) -omics, with local, bivariate, and multivariate spatial methods not yet commonly applied to spatial -omics, united by a uniform user interface. Using `Voyager`, we showcase biological insights that can be derived with its methods, such as biologically relevant negative spatial autocorrelation. Underlying `Voyager` is the `SpatialFeatureExperiment` (SFE) data structure, which combines Simple Feature with `SingleCellExperiment` and `AnnData` to represent and operate on geometries bundled with gene expression data. Voyager has comprehensive tutorials demonstrating ESDA built on GitHub Actions to ensure reproducibility and scalability, using data from popular commercial technologies. Voyager is implemented in both R/Bioconductor and Python/PyPI, and features compatibility tests to ensure that both implementations return consistent results. 

This workshop focuses on new features of SFE and Voyager implemented in the past year. Earlier features are described in more details [this preprint](https://www.biorxiv.org/content/10.1101/2023.07.20.549945v1?ct=) and in the [2023 Voyager workshop](https://lambdamoses.github.io/VoyagerWorkshop/). The preprint will soon be updated to include the new functionalities prior to submission. The new features fall under these areas:

1. Expanded support for images. A new image class `BioFormatsImage` has been implemented to support OME-TIFF from Xenium and `ExtImage` class to support image processing with the `EBImage` package.
2. Support for transcript spot geometries. Coordinates from smFISH-based technologies are reformatted for faster reading next time, and is stored in the `rowGeometries` field of the SFE object. As simple features, geometric operations from `sf` can be applied. 
3. Support for images and transcript spots led to improved functions to read output from commercial technologies: Vizgen MERFISH, Xenium, CosMX. We're working on VisiumHD.
4. Expanded support for affine transformations. Affine transformation can be performed with a transformation matrix, and all images and geometries are transformed while remaining aligned.
5. New spatial operations on SFE objects: spatial aggregation (cell and transcript spot levels) and splitting by geometries.

### Pre-requisites

To understand the workshop material, you are expected to have:

* Intermediate knowledge of R syntax
* At least basic familiarity with Tidyverse and `ggplot2`
* Familiarity with `sf` is encouraged. Read [Geocomputing with R](https://r.geocompx.org/) for an intro to `sf` and geospatial data.
* It would be helpful to take a look at [last year's Voyager workshop](https://lambdamoses.github.io/VoyagerWorkshop/); this year I'm not covering the math behind ESDA, in order to focus on the new functionalities.

### Participation

This workshop consists of hands on demos, exercises, and Q&A.

### _R_ / _Bioconductor_ packages used

* [`Voyager`](https://pachterlab.github.io/voyager/)
* [`SpatialFeatureExperiment`](https://pachterlab.github.io/SpatialFeatureExperiment/)
* [`SFEData`](https://bioconductor.org/packages/release/data/experiment/html/SFEData.html)
* [`scater`](https://bioconductor.org/packages/release/bioc/html/scater.html)
* [`scran`](https://bioconductor.org/packages/release/bioc/html/scran.html)
* [`SingleCellExperiment`](https://bioconductor.org/packages/release/bioc/html/SingleCellExperiment.html)
* [`EBImage`](https://bioconductor.org/packages/release/bioc/html/EBImage.html)
* [`RBioFormats`](https://bioconductor.org/packages/release/bioc/html/RBioFormats.html)
* [`sparseMatrixStats`](https://bioconductor.org/packages/release/bioc/html/sparseMatrixStats.html)
* [`DelayedArray`](https://bioconductor.org/packages/release/bioc/html/DelayedArray.html)

### Time outline

Total: 90 minutes

| Activity                                  | Time |
|-------------------------------------------|------|
| Introduction and setup                    | 15m  |
| Read data into R as SFE                   | 15m  |
| Getting, setting, and plotting SFE fields | 15m  |
| Images in SFE                             | 15m  |
| Spatial operations of SFE                 | 10m  |
| Aggregate and ESDA at different scales    | 10m  |
| Split and ESDA across samples             | 10m  |

### Workshop goals and objectives

* Learn basics of SFE and Voyager ESDA
* Learn to work with images and transcript spots in SFE
* Discussion on ESDA ideas for different lengths scales and samples

#### What you will learn
* Use and operate on SFE objects
* Spatial data visualization
* Geometric operations
* Create spatial neighborhood graphs
* Run spatial analyses on different fields of SFE objects
* Visualize spatial analysis results

#### What you will _not_ learn
* Technologies to collect spatial transcriptomics data
* Data integration across multiple samples
* Spatial multi-omics

## To use the Docker image

This workshop can be run remotely on the [Bioconductor Workshop Galaxy](https://workshop.bioconductor.org/). Alternatively, it can be run
locally with the Docker image:

```sh
docker run -e PASSWORD=<choose_a_password_for_rstudio> -p 8787:8787 ghcr.io/lambdamoses/sfeworkshop2024
```

Once running, navigate to http://localhost:8787/ and then log in with `rstudio`:`yourchosenpassword`. 

The required packages of the appropriate version as of July 2024 have been pre-installed on the Workshop Galaxy and in the Docker image. Devel versions of SFE, Voyager, and Bioconductor as of July 2024 are used here.
