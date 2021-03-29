#Paquetes manejo de imagenes
library(magick)
#https://cran.r-project.org/web/packages/magick/vignettes/intro.html


### MI FOTO DE PERFIL ###
#Script para recortar en circulo
Foto<- image_read("Figuras/Lerma_Miriam.jpg")
Foto1<-image_draw(Foto)
Foto1

#Cambiar tamanio
FotoChiquita<-image_scale(Foto1, "x200")

#Crea figura
png(tf <- tempfile(fileext = ".png"), 1000, 1000)
par(mar = rep(0,4), yaxs="i", xaxs="i")
#Circulo arriba
plot(0, type = "n", ylim = c(0,1), xlim=c(0,1), axes=F, xlab=NA, ylab=NA)
plotrix::draw.circle(.5,0.5,.5, col="black")
dev.off()

#Crea circlo del mismo tamanio
img <- FotoChiquita
mask <- image_read(tf)
mask <- image_scale(mask, as.character(image_info(img)$width))
mask

#Recorta la foto
FotoCircular<-image_composite(mask, img, "plus") 
FotoCircular

#Exporta
image_write(FotoCircular, path = "Figuras/Lermita.jpg", format = "jpg")

# ~~~~~~~~~~~~~~~~~~~
# MI FOTO DE BOBO #
# ~~~~~~~~~~~~~~~~~~~~~~

Bobo<- image_read("Figuras/MABO.jpg")
Bobo1<-image_draw(Bobo)
Bobo1
#Escala
BoboChiquita<-image_scale(Bobo1, "x200")
BoboChiquita
#Recortar
Bobo2<-image_crop(BoboChiquita, "x150")
Bobo2


#Crea circlo del mismo tamanio
img <- BoboChiquita
mask <- image_read(tf)
mask <- image_scale(mask, as.character(image_info(img)$width))
mask
#Recorta la foto
image_composite(mask, img, "plus") 


#Combine
image_append(image_scale(img, "x200"))


### OTROS
#Agrega letras
#texto<-expression(paste("Miriam Lerma"))
#text(2400, 1700, label=texto, cex=11, family="Arial", col='white')
