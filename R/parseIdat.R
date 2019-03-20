parseIdat<-function(folder.idat,array.type="450k",score.type="M"){
  f<-list.files(folder.idat)
  num.idat<-sum(grepl(".idat",f))
  if(num.idat<2){
    message("parseIdat: folder ",folder.idat," does not contain idat files")
  }else{
    targets <-read.metharray.sheet(folder.idat)  #minfi searches for samplesheet files and maps idat files
    
    if(is.null(targets)){
      message("parseIdat: SampleSheet file not found in folder '",folder.idat,"', building SampleSheet file.")
      buildSampleSheet(folder.idat)
      targets <-read.metharray.sheet(folder.idat)
    }
    if (anyDuplicated(targets$Basename)) {
      message("ERROR: duplicate array_pos found!")
    }
    print(paste0("loading ", nrow(targets), " idats..."))
    chunks <- unlist(strsplit(targets$Basename[1], "/"))
    path.data.study <- ""
    for (c in 1:length(chunks) - 1) {
      if (nchar(path.data.study) > 0) {
        path.data.study <- paste0(path.data.study, "/")
      }
      path.data.study <- paste0(path.data.study, chunks[c])
    }
    RGSet <-read.metharray.exp(path.data.study, targets, force = TRUE)
    print(paste0("normalizing illumina..."))
    MSet.illumina <- preprocessIllumina(RGSet, bg.correct = TRUE)
    mval <- getM(MSet.illumina)
    save(mval,file=paste0(folder.idat,"/M_values.RData"))
  }
}
