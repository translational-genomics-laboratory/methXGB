## Installation

```r
library(devtools)
install_github("translational-genomics-laboratory/methXGB")
```

## Overview

| Model family   | No. models | Model class        | Training dataset          | Data type (features)                     | Dependent variable (target) |
| -------------- | ---------- | ------------------ | ------------------------- | ---------------------------------------- | --------------------------- |
| immunescore    | 20         | XGBoost_reg:linear | TCGA various tumour types | M-values from 450k DNA methylation array | ESTIMATE.immunescore array  |
| tumour.purity  | 20         | XGBoost_reg:linear | TCGA various tumour types | M-values from 450k DNA methylation array | InfiniumPurify              |
