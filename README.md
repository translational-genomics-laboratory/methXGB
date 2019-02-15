# methXGB (pre-release version)
Interpretation of DNA methylation data from tumour samples using XGBoost models. The methXGB package contains a collection of trained models and wrapper functions that facilitate their use.


<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="116" height="20"><linearGradient id="b" x2="0" y2="100%"><stop offset="0" stop-color="#bbb" stop-opacity=".1"/><stop offset="1" stop-opacity=".1"/></linearGradient><clipPath id="a"><rect width="116" height="20" rx="3" fill="#fff"/></clipPath><g clip-path="url(#a)"><path fill="#555" d="M0 0h43v20H0z"/><path fill="#fe7d37" d="M43 0h73v20H43z"/><path fill="url(#b)" d="M0 0h116v20H0z"/></g><g fill="#fff" text-anchor="middle" font-family="DejaVu Sans,Verdana,Geneva,sans-serif" font-size="110"> <text x="225" y="150" fill="#010101" fill-opacity=".3" transform="scale(.1)" textLength="330">status</text><text x="225" y="140" transform="scale(.1)" textLength="330">status</text><text x="785" y="150" fill="#010101" fill-opacity=".3" transform="scale(.1)" textLength="630">pre-release</text><text x="785" y="140" transform="scale(.1)" textLength="630">pre-release</text></g> </svg>

<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="104" height="20"><linearGradient id="b" x2="0" y2="100%"><stop offset="0" stop-color="#bbb" stop-opacity=".1"/><stop offset="1" stop-opacity=".1"/></linearGradient><clipPath id="a"><rect width="104" height="20" rx="3" fill="#fff"/></clipPath><g clip-path="url(#a)"><path fill="#555" d="M0 0h37v20H0z"/><path fill="#9f9f9f" d="M37 0h67v20H37z"/><path fill="url(#b)" d="M0 0h104v20H0z"/></g><g fill="#fff" text-anchor="middle" font-family="DejaVu Sans,Verdana,Geneva,sans-serif" font-size="110"> <text x="195" y="150" fill="#010101" fill-opacity=".3" transform="scale(.1)" textLength="270">build</text><text x="195" y="140" transform="scale(.1)" textLength="270">build</text><text x="695" y="150" fill="#010101" fill-opacity=".3" transform="scale(.1)" textLength="570">not tested</text><text x="695" y="140" transform="scale(.1)" textLength="570">not tested</text></g> </svg>

<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="74" height="20"><linearGradient id="b" x2="0" y2="100%"><stop offset="0" stop-color="#bbb" stop-opacity=".1"/><stop offset="1" stop-opacity=".1"/></linearGradient><clipPath id="a"><rect width="74" height="20" rx="3" fill="#fff"/></clipPath><g clip-path="url(#a)"><path fill="#555" d="M0 0h35v20H0z"/><path fill="#007ec6" d="M35 0h39v20H35z"/><path fill="url(#b)" d="M0 0h74v20H0z"/></g><g fill="#fff" text-anchor="middle" font-family="DejaVu Sans,Verdana,Geneva,sans-serif" font-size="110"> <text x="185" y="150" fill="#010101" fill-opacity=".3" transform="scale(.1)" textLength="250">R&gt;=</text><text x="185" y="140" transform="scale(.1)" textLength="250">R&gt;=</text><text x="535" y="150" fill="#010101" fill-opacity=".3" transform="scale(.1)" textLength="290">3.3.0</text><text x="535" y="140" transform="scale(.1)" textLength="290">3.3.0</text></g> </svg>



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




