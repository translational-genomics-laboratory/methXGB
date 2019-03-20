downloadIdat<-function(geo.accession,clean.folder=TRUE){
  if(!dir.exists(paste0("idat_",geo.accession))){dir.create(paste0("idat_",geo.accession))}
  if(!file.exists(paste0("idat_",geo.accession,"/",geo.accession,"_RAW.tar"))){
    message("downloading GEO file ",geo.accession,"_RAW.tar")
    getGEOSuppFiles(geo.accession,baseDir=paste0("idat_",geo.accession),makeDirectory = FALSE)
  }else{
    message("downloadIdat: File ",geo.accession,"_RAW.tar found locally, download skipped")
  }
  file.raw<-paste0("idat_",geo.accession,"/",geo.accession,"_RAW.tar")
  if(file.exists(file.raw)){
    message("extracting...",file.raw)
    untar(file.raw,exdir = paste0("idat_",geo.accession,"/"))
    files.idat<-list.files(paste0("idat_",geo.accession,"/"))
    files.idat<-files.idat[grepl("Grn.idat.gz",files.idat) | grepl("Red.idat.gz",files.idat)]
    for(file in files.idat){
      message("gunzip...",file)
      gunzip(paste0("idat_",geo.accession,"/",file))
    }
    if(clean.folder){
      files.other<-list.files(paste0("idat_",geo.accession,"/"))
      files.other<-files.other[!grepl("Grn.idat",files.other) & !grepl("Red.idat",files.other)]
      for(file in files.other){
        file.remove(paste0("idat_",geo.accession,"/",file))
      }
    }
  }
  buildSampleSheet(paste0("idat_",geo.accession))
}
