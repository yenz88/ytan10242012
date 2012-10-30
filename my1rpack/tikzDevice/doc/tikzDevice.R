### R code from vignette source 'tikzDevice.Rnw'

###################################################
### code chunk number 1: setup
###################################################

	if( !file.exists( 'figs' ) ) dir.create( 'figs' )
	require(tikzDevice)

  options(prompt = ' ', continue = ' ')



###################################################
### code chunk number 2: tikzTitlePlot
###################################################

	tikz('figs/titlePlot.tex',bareBones=T,width=4,height=4)

	x <- seq(-4.5,4.5,length.out=100)
	y <- dnorm(x)

	xi <- seq(-2,2,length.out=30)
	yi <- dnorm(xi)

	plot(x,y,type='l',col='blue',ylab='$p(x)$',xlab='$x$')
	lines(xi,yi,type='s')
	lines(range(xi),c(0,0))
	lines(xi,yi,type='h')
	title(main="$p(x)=\\frac{1}{\\sqrt{2\\pi}}e^{-\\frac{x^2}{2}}$")
	int <- integrate(dnorm,min(xi),max(xi),subdivisions=length(xi))
	text(2.8,0.3,paste("\\small$\\displaystyle\\int_{",min(xi),"}^{",max(xi),"}p(x)dx\\approx",round(int[['value']],3),'$',sep=''))


	dev.off()


###################################################
### code chunk number 3: pathStepIn
###################################################
	setwd('figs')


###################################################
### code chunk number 4: simpleEx
###################################################
require(tikzDevice)
tikz('simpleEx.tex',width=3.5,height=3.5)
plot(1,main='Hello World!')
dev.off()


###################################################
### code chunk number 5: latexEx
###################################################
require(tikzDevice)
tikz('latexEx.tex',
  width=3.5,height=3.5)

x <- rnorm(10)
y <- x + rnorm(5,sd=0.25)

model <- lm(y ~ x)
rsq <- summary( model )$r.squared
rsq <- signif(rsq,4)

plot(x,y,main='Hello \\LaTeX!')
abline(model,col='red')

mtext(paste("Linear model: $R^{2}=",
  rsq,"$" ),line=0.5)
  
legend('bottomright', legend = 
  paste("$y = ",
    round(coef(model)[2],3), 'x +',
    round(coef(model)[1],3), '$',
    sep=''), bty= 'n')

dev.off()


###################################################
### code chunk number 6: bareBonesExample
###################################################
require(tikzDevice)
require(maps)

tikz('westCoast.tex', bareBones=TRUE)
map('state', regions=c('california', 'oregon', 'washington'),
    lwd=4, col='grey40')

eurekaLon <- grconvertX(-124.161, to='device')
eurekaLat <- grconvertY(40.786, to='device')

longviewLon <- grconvertX(-122.962, to='device')
longviewLat <- grconvertY(46.148, to='device')

coosLon <- grconvertX(-124.237, to='device')
coosLat <- grconvertY(43.378, to='device')

sfLon <- grconvertX(-122.419, to='device')
sfLat <- grconvertY(37.775, to='device')

tikzAnnotate(paste('\\coordinate (humBay) at (',
  eurekaLon, ',', eurekaLat, ');', sep='') )

tikzAnnotate(paste('\\coordinate (longView) at (',
  longviewLon, ',', longviewLat, ');', sep='') )

tikzAnnotate(paste('\\coordinate (coosBay) at (',
  coosLon, ',', coosLat, ');', sep='') )

tikzAnnotate(paste('\\coordinate (sfBay) at (',
  sfLon, ',', sfLat, ');', sep='') )

dev.off()


###################################################
### code chunk number 7: standAloneExample
###################################################
require(tikzDevice)
tikz('standAloneExample.tex',standAlone=T)
plot(sin,-pi,2*pi,main="A Stand Alone TikZ Plot")
dev.off()


###################################################
### code chunk number 8: standAloneCompileExample (eval = FALSE)
###################################################
## 
## 	require(tools)
## 	
## 	catch <- system(paste(Sys.which('pdflatex'),
## 		'-interaction=batchmode -output-directory figs/ figs/standAloneExample.tex'),
## 		ignore.stderr=T)
## 	
## 	# If compiling the example failed, we don't want to include a broken link.	
## 	if( catch == 0 ){
## 		pdfLink <- "The file \\\\code{standAloneExample.tex} may then be compiled to produce
## 			\\\\href{./figs/standAloneExample.pdf}{standAloneExample.pdf}. "
## 	}else{
## 		pdfLink <- ""
## 	}
##     #%\Sexpr{print(pdfLink)}


###################################################
### code chunk number 9: annotation
###################################################
require(tikzDevice)

# Load some additional TikZ libraries
tikz("annotation.tex",width=4,height=4,
  packages = c(getOption('tikzLatexPackages'),
    "\\usetikzlibrary{decorations.pathreplacing}",
    "\\usetikzlibrary{positioning}",
    "\\usetikzlibrary{shapes.arrows,shapes.symbols}")
)

p <- rgamma (300 ,1)
outliers <- which( p > quantile(p,.75)+1.5*IQR(p) )
boxplot(p)

# Add named coordinates that other TikZ commands can hook onto
tikzCoord(1, min(p[outliers]), 'min outlier')
tikzCoord(1, max(p[outliers]), 'max outlier')

# Use tikzAnnotate to insert arbitrary code, such as drawing a
# fancy path between min outlier and max outlier.
tikzAnnotate(c("\\draw[very thick,red,",
  # Turn the path into a brace.
  'decorate,decoration={brace,amplitude=12pt},',
  # Shift it 1em to the left of the coordinates
  'transform canvas={xshift=-1em}]',
  '(min outlier) --',
  # Add a node with some text in the middle of the path
  'node[single arrow,anchor=tip,fill=white,draw=green,',
  'left=14pt,text width=0.70in,align=center]',
  '{Holy Outliers Batman!}', '(max outlier);'))

# tikzNode can be used to place nodes with customized options and content
tikzNode(
  opts='starburst,fill=green,draw=blue,very thick,right=of max outlier',
  content='Wow!'
)

dev.off()


###################################################
### code chunk number 10: pathStepOut
###################################################
	setwd('../')


###################################################
### code chunk number 11: strWidthDemo
###################################################
getLatexStrWidth( "The symbol: alpha" )
getLatexStrWidth( "The symbol: $\\alpha$" )


###################################################
### code chunk number 12: charMetricDemo
###################################################
# Get metrics for 'y'
getLatexCharMetrics(121)

# Get metrics for 'x' - the second value is the descent
# and should be zero or very close to zero.
getLatexCharMetrics(120)


###################################################
### code chunk number 13: charMetricErrors
###################################################
getLatexCharMetrics('y')
getLatexCharMetrics(20)

# Will return metrics for 'y'
getLatexCharMetrics(121.99)


