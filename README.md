# methXGB (pre-release version)
Interpretation of DNA methylation data from tumour samples using XGBoost models. The methXGB package contains a collection of trained models and wrapper functions that facilitate their use.

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
