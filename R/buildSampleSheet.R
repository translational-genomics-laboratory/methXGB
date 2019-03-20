#internal function
buildSampleSheet<-function(folder.idat){
  files<-list.files(folder.idat)
  files<-files[grepl(".idat",files)]
  files<-gsub('.{9}$', '', files) #removes last characters: GSM1469004_5806361056_R06C02.Grn.idat to GSM1469004_5806361056_R06C02
  no.chunks<-length(unlist(strsplit(files[1],"_"))) 
  chunks<-colsplit(files,"_",c("a","b","c")) 
  sample.name<-files[!duplicated(chunks$a)]
  chunks<-colsplit(sample.name,"_",c("a","b","c"))
  if(no.chunks==2){ #5806361013_R03C01
    slide<-chunks$a
    array<-chunks$b
  }
  if(no.chunks==3){ #GSM1469019_5806361013_R03C01
    slide<-paste0(chunks$a,"_",chunks$b)
    array<-chunks$c
  }
  sample.well<-rep("A1",length(names))
  sample.plate<-rep("unknown",length(names))
  sample.type<-rep("unknown",length(names))
  sample.group<-rep("unknown",length(names))
  sample.sheet<-data.frame(Sample_Name=sample.name,Sample_Well=sample.well,Sample_Plate=sample.plate,Sample_Type=sample.type,Sample_Group=sample.group,Slide=slide,Array=array)
  write.csv(sample.sheet,paste0(folder.idat,"/SampleSheet.csv"),quote=F,row.names=F)
}