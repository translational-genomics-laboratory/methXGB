inferMethXGB<-function(mval=NULL,model.family=NULL,dataset=NULL){
  df<-NULL
  file.xgb <- paste0("xgb_",model.family,"_",dataset)
  if(exists(file.xgb)){
  message("inferMethXGB: loading ", file.xgb)
  xgb<-get(file.xgb)
  mval.sub<-mval[rownames(mval) %in% xgb$feature_names,]
  mval.sub<-fillMissingFeatures(df.mval=mval.sub,model.features=xgb$feature_names)
  mval.sub<-mval.sub[order(row.names(mval.sub)),]
  mval.sub<-mval.sub[match(rownames(mval.sub),xgb$feature_names),]
  percent.missing.values<-apply(mval.sub,2,function(x) sum(!is.finite(x))*100/xgb$nfeatures)
  mval.sub<-apply(mval.sub,2,function(x) {x[!is.finite(x)]<-NA;return (x)}) #formats different types of missing values (-Inf and other)
  message("inferMethXGB: inferring ",model.family," in ",ncol(mval)," samples")
  pred<-predict(xgb,t(mval.sub))
  df<-data.frame(sample=colnames(mval.sub),score=pred,percent.missing.values)
  row.names(df)<-1:nrow(df)
  colnames(df)[2]<-model.family
  }else{
    message("inferMethXGB: model with dataset=\"",dataset,"\" and model.family=\"",model.family,"\" does not exist")
  }
  return(df)
}


fillMissingFeatures<-function(df.mval=NULL,model.features=NULL){
  features.missing<-model.features[!model.features %in% row.names(df.mval)]
  if(length(features.missing)>0){
    message("inferMethXGB: model features found in the supplied data: ",length(features.missing),"%, filling with NAs ")
    df.fill<-data.frame(matrix(rep(NA,length(features.missing)*ncol(df.mval)),nrow=length(features.missing),ncol=ncol(df.mval)))
    colnames(df.fill)<-colnames(df.mval)
    row.names(df.fill)<-features.missing
    df.mval<-rbind(df.mval,df.fill)
  }else{
    message("inferMethXGB: model features found in the supplied data: 100%")
  }
  return(df.mval)
}
  
  








#TODO: fill-up missing probes with zeroes, and report this process
#TODO: report % missing values??





