#arquivo com os gráficos

# Plontando a resposta da questão 1
ggplot(tagg, aes(x = timestamp, y = rating, color=genres)) + geom_point() + facet_wrap(~genres) + scale_x_discrete(breaks=seq(1995, 2016, 5)) + theme(legend.position="none")+theme(axis.text.x=element_text(angle = -90, hjust = 0))

# Plontando a resposta da questão 3
corrplot(m, p.mat = res1[[1]], order="FPC", insig = "pch",sig.level=0.001,tl.cex=0.7)
