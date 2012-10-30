problem1 = function(filename=NULL,fcnname=NULL,range=NULL,nsample=NULL,compile=NULL){
  xval = seq(range[1], range[2], length=nsample)
  yval = fcnname(xval)
  fullname = paste(filename, '.tex', sep = '')
  tikz(file=fullname,standAlone=T);
  plot(xval,yval, type='l')
  dev.off();
  if(compile==TRUE){
    tools::texi2pdf(fullname);
  }
    
}