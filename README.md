# methXGB (pre-release version)
Interpretation of DNA methylation data from tumour samples using XGBoost models. The methXGB package contains a collection of trained models and wrapper functions that facilitate their use.

![badge status pre-release](https://img.shields.io/badge/status-pre--release-orange.svg)
![badge build not tested](https://img.shields.io/badge/build-not%20tested-lightgrey.svg)
![badge R 3.3.0](https://img.shields.io/badge/R%3E%3D-3.3.0-blue.svg)




## Package Installation

```r
library(devtools)
install_github("translational-genomics-laboratory/methXGB")
```

## Model overview

| Model family   | No. models | Model class        | Training dataset          | Data type (features)                     | Dependent variable (target) |
| -------------- | ---------- | ------------------ | ------------------------- | ---------------------------------------- | --------------------------- |
| immunescore    | 20         | XGBoost_reg:linear | TCGA various tumour types | M-values from 450k DNA methylation array | ESTIMATE.immunescore array  |
| tumour.purity  | 20         | XGBoost_reg:linear | TCGA various tumour types | M-values from 450k DNA methylation array | InfiniumPurify              |

## Function overview

* The function `inferMethXGB()` is used to infer biological parameters in DNA methylation data by using one of the trained XGBoost models included in the methXGB package. For example, the command `inferMethXGB(mval=my.data, model.family="tumour.purity",dataset="TCGA-BLCA")` is used to infer tumour purity  using DNA methylation data from bladder cancer samples in M-values format.
* The `idatParse()` functon extracts M-values from idat files (450k and EPIC platforms). It provides readily access to data in M-values format, but it is not a replacement for cumstom-built workflows.
* `getModelInfo()` returns the description of the models that are included in the methXGB package.

## Credits

Developed by Alberto León at the [PM-OICR Translational Genomics Laboratory](https://labs.oicr.on.ca/translational-genomics-laboratory)

[![link to OICR's main page](vignettes/OICR_logo.png)](https://oicr.on.ca)




