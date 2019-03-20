transformMethData<-function(meth.data,from=NULL,to=NULL){
  meth.data<-apply(meth.data,2,function(x) {x[!is.finite(x)]<-NA;return (x)}) #formats different types of missing values (-Inf and other)
  if(from=="M" & to=="beta"){
    meth.data<-apply(meth.data,2,function(x) 2^x/(2^x+1))
  }
  
  if(from=="beta" & to=="M"){
    meth.data<-apply(meth.data,2,function(x) log2(x/(1-x)))
  }
  return(data.frame(meth.data))
}