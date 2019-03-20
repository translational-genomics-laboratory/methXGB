getModelInfo<-function(model.family=NULL,dataset=NULL){
  #system.file("extdata", "2012.csv", package = "testdat")
  f.full.names<-list.files(system.file(package = 'methXGB'), recursive = T, full.names = TRUE)
  f.full.names<-f.full.names[grepl("extdata/",f.full.names)]
  f<-list.files(system.file(package = 'methXGB'), recursive = T, full.names = FALSE)
  f<-f[grepl("extdata",f)]
  f.chunks<-colsplit(f,"/",c("a","b","c","d"))
  f<-f.chunks[f.chunks$a=="extdata",]$b

  
  
  #f<-list.files("methXGB/data/trained_model")
  f<-f[grepl("model_table_",f)]
  table<-NULL
  if(is.null(model.family)){
    for(f.curr in f){
      table<-rbind(table,read.table(f.full.names[grepl(f.curr,f.full.names)],header=TRUE,sep="\t",stringsAsFactors = FALSE))
    }
    table.summary<-NULL
    for(family in unique(table$model.family)){
      row<-data.frame(model.family=family,num.models=sum(table$model.family==family), model.class=unique(table[table$model.family==family,'model.class']))
      table.summary<-rbind(table.summary,row)
    }
    table<-table.summary
  }
  if(!is.null(model.family)){
    if(!is.element(paste0("model_table_",model.family,".txt"), f)){
      message("getModelInfo: \"",model.family,"\" is not a valid model.family")
    }else{
      f.full.path<-f.full.names[grepl(paste0("model_table_",model.family,".txt"),f.full.names)]
      table<-read.table(f.full.path,header=TRUE,sep="\t",stringsAsFactors = FALSE)
      if(is.null(dataset)){
        row.names(table)<-c(1:nrow(table)) #forces consecutive row numbers from 1, when printed in vignette
      }else{
        table<-t(table[table$dataset==dataset,])
        if(ncol(table)==0){
          message("getModelInfo: model with dataset=\"",dataset,"\" and model.family=\"",model.family,"\" does not exist")
          table<-NULL
        }
      }
    }
  }
  return (table)
}