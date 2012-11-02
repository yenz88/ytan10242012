problem1 = function(filename=NULL,
                    fcnobj=NULL,
                    range=NULL,
                    nsample=NULL,
                    compile=NULL)  {
  xval = seq(range[1], range[2], length=nsample)
  yval = fcnobj(xval)
  outputtexfile= paste(filename, '.tex', sep = '')
  tikz(file=outputtexfile, standAlone=TRUE); #Start tikZ
  plot(xval,yval, type='l')
  dev.off();                                #ends tikZ
  if(compile==TRUE){
    tools::texi2pdf(outputtexfile);
                  }
  }