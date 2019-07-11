##==============================================================================##
##     Comparison of mTPI BOIN on %selection and # Patients treated         	  ##
##==============================================================================##
setwd("/Users/practicum/simulation/R code result")
size<-factor(c(15,18,20,30,36), levels=c(15,18,20,30,36))
prob<-factor(c(0.1,0.2,0.3), levels=c(0.1,0.2,0.3))
scenario<-factor(c(1:6), levels=c(1:6))
doselevels<-factor(c("dose1","dose2","dose3","dose4","dose5","dose6")
			, levels=c("dose1","dose2","dose3","dose4","dose5","dose6"))
dose_i<-c(0.03,0.06,0.1,0.13,0.16,0.19 #p=0.1 scenario1
        ,0.03,0.06,0.09,0.1,0.13,0.16  #p=0.1 scenario2
        ,0.01,0.02,0.03,0.04,0.05,0.06 #p=0.1 scenario3
        ,0.23,0.36,0.49,0.62,0.75,0.88 #p=0.1 scenario4
        ,0.01,0.02,0.03,0.04,0.05,0.46 #p=0.1 scenario5
        ,0.02,0.3,0.39,0.48,0.57,0.66  #p=0.1 scenario6
        
        ,0.07,0.14,0.2,0.27,0.34,0.41  #p=0.2 scenario1
        ,0.05,0.1,0.15,0.2,0.25,0.3    #p=0.2 scenario2
        ,0.03,0.06,0.09,0.12,0.15,0.18 #p=0.2 scenario3
        ,0.31,0.42,0.53,0.64,0.75,0.86 #p=0.2 scenario4
        ,0.03,0.06,0.09,0.12,0.15,0.52 #p=0.2 scenario5
        ,0.04,0.38,0.46,0.54,0.62,0.7  #p=0.2 scenario6
        
        ,0.1,0.2,0.3,0.4,0.5,0.6       #p=0.3 scenario1
        ,0.08,0.16,0.24,0.3,0.38,0.46  #p=0.3 scenario2
        ,0.04,0.08,0.12,0.16,0.2,0.24  #p=0.3 scenario3
        ,0.4,0.5,0.6,0.7,0.8,0.9       #p=0.3 scenario4
        ,0.04,0.08,0.12,0.16,0.2,0.58  #p=0.3 scenario5
        ,0.06,0.46,0.53,0.6,0.67,0.74  #p=0.3 scenario6
        )
dose<-rep(dose_i,5)

## Dose plot
dim(dose_i)<-c(6,18)
dose_i<-t(dose_i)
pdf(file = "dose scenarios.pdf", width = 9, height = 4)
par(mfrow=c(1,3))
  for (pT in 1:3) {
    data_0<-dose_i[((pT-1)*6+1):(pT*6),]
    plot(x=NULL, xlim = c(1,6), ylim = c(0,1), axes = FALSE
         , xlab = "Dose Levels", ylab = "Toxicity (probability)"
         , main = paste("pT=",pT*0.1,sep = "")
         , cex.main = 1.2)
    axis(side = 2, at=seq(0,1, by=0.2))
    axis(side = 1, at=c(1:6))
    for (j in 1:6) {
      data<-data.frame(dose=c(data_0[j,]),i=c(1:6))
      lines(y=data$dose, x=data$i, lty=2, col = j+1)
      points(y=data$dose, x=data$i, pch=4, col = j+1)
    } 
    abline(h=pT*0.1, lty=1, col="grey20", cex=0.5)
    if (pT==1) legend(x=1,y=1, legend=paste("scenario",c(1:6),sep = "")
                      , col = 2:7, lty = 2, pch = 4, cex = 1, bty="n")
  }
dev.off()

## BOIN
b.select.1<-read.table("BOIN N=15SELECTION.txt", dec = ".", sep = ",")
b.select.2<-read.table("BOIN N=18SELECTION.txt", dec = ".", sep = ",")
b.select.3<-read.table("BOIN N=20SELECTION.txt", dec = ".", sep = ",")
b.select.4<-read.table("BOIN N=30SELECTION.txt", dec = ".", sep = ",")
b.select.5<-read.table("BOIN N=36SELECTION.txt", dec = ".", sep = ",")
b.selection<-c(unlist(b.select.1, use.names = FALSE)
               , unlist(b.select.2, use.names = FALSE)
               , unlist(b.select.3, use.names = FALSE)
               , unlist(b.select.4, use.names = FALSE)
               , unlist(b.select.5, use.names = FALSE)
              )

b.pts.1<-read.table("BOIN N=15 PTS.txt", dec = ".", sep = ",")
b.pts.2<-read.table("BOIN N=18 PTS.txt", dec = ".", sep = ",")
b.pts.3<-read.table("BOIN N=20 PTS.txt", dec = ".", sep = ",")
b.pts.4<-read.table("BOIN N=30 PTS.txt", dec = ".", sep = ",")
b.pts.5<-read.table("BOIN N=36 PTS.txt", dec = ".", sep = ",")
b.pts<-c(unlist(b.pts.1, use.names = FALSE)
         , unlist(b.pts.2, use.names = FALSE)
         , unlist(b.pts.3, use.names = FALSE)
         , unlist(b.pts.4, use.names = FALSE)
         , unlist(b.pts.5, use.names = FALSE)
        )
## mTPI
m.select.1<-read.table("mTPI N=15SELECTION.txt", dec = ".", sep = ",")
m.select.2<-read.table("mTPI N=18SELECTION.txt", dec = ".", sep = ",")
m.select.3<-read.table("mTPI N=20SELECTION.txt", dec = ".", sep = ",")
m.select.4<-read.table("mTPI N=30SELECTION.txt", dec = ".", sep = ",")
m.select.5<-read.table("mTPI N=36SELECTION.txt", dec = ".", sep = ",")
m.selection<-c(unlist(m.select.1, use.names = FALSE)   #n=15
               ,unlist(m.select.2, use.names = FALSE)  #n=18
               ,unlist(m.select.3, use.names = FALSE)  #n=20
               ,unlist(m.select.4, use.names = FALSE)  #n=30
               ,unlist(m.select.5, use.names = FALSE)  #n=36
              )*100

m.pts.1<-read.table("mTPI N=15 PTS.txt", dec = ".", sep = ",")
m.pts.2<-read.table("mTPI N=18 PTS.txt", dec = ".", sep = ",")
m.pts.3<-read.table("mTPI N=20 PTS.txt", dec = ".", sep = ",")
m.pts.4<-read.table("mTPI N=30 PTS.txt", dec = ".", sep = ",")
m.pts.5<-read.table("mTPI N=36 PTS.txt", dec = ".", sep = ",")
m.pts<-c(unlist(m.pts.1, use.names = FALSE)   #n=15
         ,unlist(m.pts.2, use.names = FALSE)  #n=18
         ,unlist(m.pts.3, use.names = FALSE)  #n=20
         ,unlist(m.pts.4, use.names = FALSE)  #n=30
         ,unlist(m.pts.5, use.names = FALSE)  #n=36
         )

## combine all results
result<-cbind(expand.grid(doselevels=doselevels,scenario=scenario,targetprob=prob,sampsize=size)
			  ,dose=dose
			  ,boin.selection=b.selection, boin.pts=b.pts
			  ,mTPI.selection=as.vector(m.selection), mTPI.pts=as.vector(m.pts)
			  )

write.csv(result, file = "all results combined.csv")
str(result)
    #### get summary plots
    result$sel_diff<-result$boin.selection-result$mTPI.selection
    result$pts_diff<-result$boin.pts-result$mTPI.pts
library(ggplot2)
    ### FOR SCENARIO ###
    pdf(file = "Scenario_Selection_diff_poster.pdf", width = 16, height = 4)
    par(mfrow=c(1,4)) 
    #par(mfrow=c(1,1))
    for (scenario_i in 1:4){
      sce_data<-subset(result, scenario==scenario_i)
      head(sce_data)
      with(sce_data, boxplot(sel_diff~doselevels
                             #, col=c(2:7)
                             , ylab="%selection (BOIN-mTPI)"
                             , ylim=c(-12,12)
                             , main=paste("Scenario",scenario_i, sep = ""))) 
    }
    dev.off()
    
    pdf(file = "Scenario_Pts_diff_poster.pdf", width = 16, height = 4)
    par(mfrow=c(1,4))
    for (scenario_i in 1:4){
      sce_data<-subset(result, scenario==scenario_i)
      head(sce_data)
      with(sce_data, boxplot(pts_diff~doselevels
                             #, col=c(2:7)
                             , ylab="#pts (BOIN-mTPI)"
                             , ylim=c(-2,2)
                             , main=paste("Scenario",scenario_i, sep = ""))) 
    }
    dev.off()
    
    
    ### FOR SAMPLE SIZE ###
    pdf(file = "N_Selection_diff_poster.pdf", width = 16, height = 3.5)
    #par(mfrow=c(2,3), mar=c(4,4,3,1)) 
    par(mfrow=c(1,4))
    for (n_i in c(15,18,20,30
                  #,36
                  )){
      #par(oma=c(1,0.1,2,1))
      #for (scenario_i in 1:6){
      scenario_i=4
        sce_data<-subset(result, scenario==scenario_i & sampsize==n_i)
        head(sce_data)
        with(sce_data, boxplot(sel_diff~doselevels
                               #, col=c(2:7)
                               , ylab="%selection (BOIN-mTPI)"
                               , ylim = c(-4,4)
                               , main=paste("Scenario",scenario_i," ","N=",n_i, sep = ""))) 
        #title(main = paste("N=",n_i, sep = ""), outer = T)
      #}
      }
    dev.off()
    
    pdf(file = "N_Pts_diff_poster.pdf", width = 16, height = 3.5)
    #par(mfrow=c(2,3), mar=c(4,4,3,1)) 
    par(mfrow=c(1,4))
    for (n_i in c(15,18,20,30
                  #,36
                  )){
      #par(oma=c(1,0.1,2,1))
      #for (scenario_i in 1:6){
      scenario_i=5
        sce_data<-subset(result, scenario==scenario_i & sampsize==n_i)
        head(sce_data)
        with(sce_data, boxplot(pts_diff~doselevels
                               #, col=c(2:7)
                               , ylab="#pts (BOIN-mTPI)"
                               , ylim = c(-2,2)
                               , main=paste("Scenario",scenario_i," ", "N=",n_i, sep = ""))) 
        #title(main = paste("N=",n_i, sep = ""), outer = T)
    #}
    }
    dev.off()
    
    
    ### FOR TARGET TOXICITY PROBABILITY (pT) ###
    pdf(file = "pT_Selection_diff_poster_s5.pdf", width = 16, height = 3.5)
    #par(mfrow=c(2,3), mar=c(4,4,3,1)) 
    par(mfrow=c(1,3))
    for (pT_i in c(0.1,0.2,0.3)){
      #par(oma=c(1,0.1,2,1))
      #for (scenario_i in 1:6){
      scenario_i=5
        sce_data<-subset(result, scenario==scenario_i & targetprob==pT_i)
        head(sce_data)
        with(sce_data, boxplot(sel_diff~doselevels
                               #, col=c(2:7)
                               , ylab="%selection (BOIN-mTPI)"
                               , ylim = c(-10,10)
                               , main=paste("Scenario",scenario_i," ","pT=",pT_i, sep = ""))) 
        #title(main = paste("pT=",pT_i, sep = ""), outer = T)
    #}
    }
    dev.off()
    
    pdf(file = "pT_Pts_diff_poster.pdf", width = 16, height = 3.5)
    par(mfrow=c(2,3), mar=c(4,4,3,1)) 
    for (pT_i in c(0.1,0.2,0.3)){
      par(oma=c(1,0.1,2,1))
      for (scenario_i in 1:6){
        sce_data<-subset(result, scenario==scenario_i & targetprob==pT_i)
        head(sce_data)
        with(sce_data, boxplot(pts_diff~doselevels
                               , col=c(2:7)
                               , ylab="#pts (BOIN-mTPI)"
                               , ylim = c(-1.8,1.8)
                               , main=paste("Scenario",scenario_i, sep = ""))) 
        title(main = paste("pT=",pT_i, sep = ""), outer = T)
      }}
    dev.off()
    
scenario.array<-levels(scenario)
prob.array<-levels(prob)
size.array<-levels(size)

## line plot for each and every scenario
pdf(file = "comparison_new_5.pdf", width = 12, height =6 )
for (samp in c(15,18,20,30,36)){
  par(oma=c(4,4,5,1))
  for (pb in c(0.1,0.2,0.3)){
    par(mfrow=c(2,3), mar=c(4,4,3,1))
    for (scene in c(1:6)){
      result_test<-result[result$scenario==as.character(scene) & result$targetprob==as.character(pb) & result$sampsize==as.character(samp),]
      # %selection
      plot(x = result_test$dose, xlab="true toxicity probability", ylab = "%selection"
           , xlim = c(-0.05,(max(result_test$dose)+0.05))
           , ylim = c(0,max(rbind(result_test$boin.selection,result_test$mTPI.selection,result_test$"3+3.selection")))
           )
      lines(y = result_test$boin.selection, x = result_test$dose, type = "l", col=2)
      lines(y = result_test$mTPI.selection, x = result_test$dose, col=3)
      #lines(y = result_test$"3+3.selection", x = result_test$dose, col=1)
      abline(v=as.character(pb), lty=2)
      legend(-0.05, max(rbind(result_test$boin.selection,result_test$mTPI.selection,result_test$"3+3.selection")/2)
             , legend = c("BOIN","mTPI"
                          #,"3+3"
                          ), col = c(2,3,1), lty = 1, cex=0.7)
      #title(main = paste("true toxicity prob. = ", paste(result_test$dose, collapse = ",") ))
      title(main = paste("Scenario", scene, sep = ""))
      }
  title(main = paste("n = ", samp, "pT = ", pb), outer = TRUE, cex.main=2)
  } 
}
for (samp in c(15,18,20,30,36)){
  par(oma=c(4,4,5,1))
  for (pb in c(0.1,0.2,0.3)){
    par(mfrow=c(2,3), mar=c(4,4,3,1))
    for (scene in c(1:6)){      
      # #pts
      result_test<-result[result$scenario==as.character(scene) & result$targetprob==as.character(pb) & result$sampsize==as.character(samp),]
      plot(x = result_test$dose, xlab="true toxicity probability", ylab = "#pts"
           , xlim = c(-0.05,(max(result_test$dose)+0.05))
           , ylim = c(0,max(rbind(result_test$boin.pts,result_test$mTPI.pts,result_test$"3+3.pts")))
           )
      lines(y = result_test$boin.pts, x = result_test$dose, type = "l", col=2)
      lines(y = result_test$mTPI.pts, x = result_test$dose, col=3)
      #lines(y = result_test$"3+3.pts", x = result_test$dose, col=1)
      abline(v=as.character(pb), lty=2)
      legend(-0.05, max(rbind(result_test$boin.pts,result_test$mTPI.pts,result_test$"3+3.pts")/2)
              , legend = c("BOIN","mTPI"), col = c(2,3,1), lty = 1, cex=0.7)
      #title(main = paste("true toxicity prob. = ", paste(result_test$dose, collapse = ",") ))
      title(main = paste("Scenario", scene, sep = ""))
    }
    title(main = paste("n = ", samp, "pT = ", pb) , outer = TRUE, cex.main=2)
  }
}
dev.off()
