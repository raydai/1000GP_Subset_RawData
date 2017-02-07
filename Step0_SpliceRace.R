#This file can use for get sample ID and haplotype location ID.
#To get screen haplotype and legend, please continue to work on step2 and step3


#Subset 1000GP by race
SampleRawData=read.table('1000GP_Phase3.sample', header = TRUE)
CHR22.legned=read.table('1000GP_Phase3_chr22.legend', header = TRUE)
#CHR22.hap=read.table('1000GP_Phase3_chr22.hap', header = FALSE)

SubsetGroup<-function(race){
      #Subset sample file
      raceID=which(SampleRawData$GROUP==race)
      RACE_Sample <- SampleRawData[raceID,]
      outputfile_sample <- paste("1000GP_CHR22_",race,".sample", sep="")
      write.table(RACE_Sample, file = outputfile_sample, row.names = FALSE,col.names = TRUE,quote = FALSE)

      #export haplotype colume_order
      RaceHapOrder<-raceID
      x<-RaceHapOrder*2
      y<-RaceHapOrder*2-1
      RaceHapOrder<-sort(append(x,y))
      outputfile_IDorder <- paste("1000GP_CHR22_",race,".IDorder", sep="")
      write(RaceHapOrder, file = outputfile_IDorder,sep=",",append = TRUE,ncolumns = length(RaceHapOrder))
      
      # #Subset hap file
      # CHR22.temp.hap<-matrix()
      # for (i in raceID1){
      #   CHR22.temp.hap<-cbind(CHR22.temp.hap,CHR22.hap[,(2*i-1):(2*i)])
      # }
      # CHR22.temp.hap<-CHR22.temp.hap[,-1]
      # outputfile_hap <- paste("1000GP_CHR22_",race,".hap", sep="")
      # write.table(CHR22.temp.hap, file = outputfile_hap, row.names = FALSE,col.names = FALSE)
      # 
      # #Subset legend
      # temp.CHR22.legend<-CHR22.legned[,c("id","position","a0","a1","TYPE",race)]
      # temp.CHR22.legend<-temp.CHR22.legend[which(temp.CHR22.legend$TYPE=="Biallelic_SNP"),]
      # 
      # rf1 <- race
      # rr1 <- '>'
      # rv1 <- 0   #Here subset the raceMAF > 0
      # temp.CHR22.legend<-subset(temp.CHR22.legend, do.call(rr1, list( get(rf1), rv1 ) ) )
      # temp.CHR22.legend<-temp.CHR22.legend[,c("id","position","a0","a1",race)]
      # outputfile_legend <- paste("1000GP_CHR22_",race,".legend", sep="");
      # write.table(temp.CHR22.legend, file = outputfile_legend, row.names = FALSE,col.names = TRUE, quote=FALSE)
}

#Subset by group
SubsetGroup("AMR")
SubsetGroup("SAS")
SubsetGroup("EAS")
SubsetGroup("EUR")
SubsetGroup("AFR")


# Define a function that can subset the group by population
SubsetPop<-function(race){
  #Subset sample file
  raceID=which(SampleRawData$POP==race)
  RACE_Sample <- SampleRawData[raceID,]
  outputfile_sample <- paste("1000GP_CHR22_",race,".sample", sep="")
  write.table(RACE_Sample, file = outputfile_sample, row.names = FALSE,col.names = TRUE,quote = FALSE)
  
  #export haplotype colume_order
  RaceHapOrder<-raceID
  x<-RaceHapOrder*2
  y<-RaceHapOrder*2-1
  RaceHapOrder<-sort(append(x,y))
  outputfile_IDorder <- paste("1000GP_CHR22_",race,".IDorder", sep="")
  write(RaceHapOrder, file = outputfile_IDorder,sep=",",append = TRUE,ncolumns = length(RaceHapOrder))
  # 
  # #Subset hap file
  # CHR22.temp.hap<-matrix()
  # for (i in raceID1){
  #   CHR22.temp.hap<-cbind(CHR22.temp.hap,CHR22.hap[,(2*i-1):(2*i)])
  # }
  # CHR22.temp.hap<-CHR22.temp.hap[,-1]
  # outputfile_hap <- paste("1000GP_CHR22_",race,".hap", sep="")
  # write.table(CHR22.temp.hap, file = outputfile_hap, row.names = FALSE,col.names = FALSE)
  # 
  # #Subset legend
  # temp.CHR22.legend<-CHR22.legned[,c("id","position","a0","a1","TYPE",race)]
  # temp.CHR22.legend<-temp.CHR22.legend[which(temp.CHR22.legend$TYPE=="Biallelic_SNP"),]
  # 
  # rf1 <- race
  # rr1 <- '>'
  # rv1 <- 0   #Here subset the raceMAF > 0
  # temp.CHR22.legend<-subset(temp.CHR22.legend, do.call(rr1, list( get(rf1), rv1 ) ) )
  # temp.CHR22.legend<-temp.CHR22.legend[,c("id","position","a0","a1",race)]
  # outputfile_legend <- paste("1000GP_CHR22_",race,".legend", sep="");
  # write.table(temp.CHR22.legend, file = outputfile_legend, row.names = FALSE,col.names = TRUE, quote=FALSE)
}

#EAS (East Asains)
SubsetPop("CDX")
SubsetPop("CHB")
SubsetPop("CHS")
SubsetPop("JPT")
SubsetPop("KHV")
#EUR (Europeans)
SubsetPop("CEU")
SubsetPop("IBS")
SubsetPop("FIN")
SubsetPop("GBR")
SubsetPop("TSI")
#AFR (Africans)
SubsetPop("ACB")
SubsetPop("ESN")  #Here we do not consider ASE pop, since its smaple size is only 68 obs.
SubsetPop("GWD")
SubsetPop("LWK")
SubsetPop("MSL")
SubsetPop("YRI")

