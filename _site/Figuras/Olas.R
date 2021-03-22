# CREDIT: https://github.com/gkaramanis

#remotes::install_github("davidsjoberg/ggstream")
#remotes::install_github("cj-holmes/vhs")
library(ggstream)
library(tidyverse)
#library(vhs)

numero_colores = 100

olas <- data.frame(x = 1:numero_colores, 
                   color = sample(1:5)) %>% 
  rowwise() %>% 
  mutate(
    v = 0.15 + runif(1, max = 0.025)
  ) %>% 
  ungroup()

#paleta <- sample(vhs("vhs", type = "c", n = 100))
Blue1<-rep(c("#03045E",
            "#023E8A",
            "#0077B6",
            "#0096C7",
            "#00B4D8",
            "#48CAE4",
            "#90E0EF",
            "#ADE8F4",
            "#CAF0F8",
            "#edf6f9"), each=2)

#df<-data.frame(x=1:20,
#              y=rep(10,each=20))

#ggplot(df, aes(y))+ geom_bar(aes(color = Blue2))+   scale_color_manual(values = Blue2)
           
Blue2<-rep(c("#03045E","#04288B","#032174","#023E8A","#0077B6",
"#0096C7","#00B4D8","#48CAE4","#90E0EF","#ADE8F4"), each=2)

Blue3<-rep(c("#02033B","#040677","#04288B","#0250B6","#0085CC","#00A8E0","#00CCF5","#71D6EA","#C9F0F7","#EDFAFD"), each=2)

paleta<-rbind(Blue1,Blue2,Blue2,Blue3,Blue3)

ggplot(olas) +
  geom_stream(aes(x = x, 
                  y = v, 
                  #color = colorspace::lighten(factor(v)), #espacio entre colores
                  fill = factor(v)), 
              type = "proportional",  #relleno
              bw = 1, #movimiento
              extra_span = 0.9, 
              size = 0.2,
              method = c("new_wiggle")) +
  scale_color_manual(values = paleta) +
  scale_fill_manual(values = paleta) +
  coord_cartesian(expand = FALSE) +
  theme_void() +
  theme(legend.position = "none")

library(here)
ggsave(here::here("Figuras/olas.png"), dpi = 320, width = 5, height = 5)
