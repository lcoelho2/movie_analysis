# arquivo com o processamento dos dados

# Separando os gêneros dos filmes classificados com mais de um.
moviess <- movies %>% mutate(genres = strsplit(genres, "\u007C",fixed=TRUE)) %>% unnest(genres)

# Alterando o formato da data
ratings$timestamp <- as.POSIXct(as.numeric(ratings$timestamp),origin="1970-01-01",tz="GMT")
ratings$timestamp <- format(ratings$timestamp, "%Y")

# Juntando o aquivo com os ratings e o arquivo com os gêneros
total <- ratings %>% inner_join(moviess,by="movieId")

# Analisando quem são os outliers. Foi excluído o ano de 1995, pois existem apenas 4 filmes nesse ano.  
#y1995 <- total %>% filter(timestamp == 1995)  
#movies %>% filter(movieId %in% y1995$movieId)
# Retirando outliers
tout <- total %>% filter(timestamp != 1995)  

# Agrupando a média dos ratings por gênero e tempo
tagg <- tout %>% group_by(genres,timestamp) %>% summarise(rating = mean(rating))

# Resposta da questão 1
# Analisando as maiores médias
m <- tagg %>% group_by(genres) %>% summarise(rating = mean(rating)) %>% arrange(desc(rating))

# Questão 2
cresc <- tout %>% filter(timestamp %in% c(2005:2013) & genres != "(no genres listed)")
queda <- tout %>% filter(timestamp %in% c(1999:2005) & genres != "(no genres listed)")

#Abaixo temos os gêneros que tiveram os maiores crescimentos na média.
crescLm <- ddply(cresc %>% select(genres,timestamp,rating), "genres", function(x) coef(lm(rating ~ timestamp,data = x))[2])
names(crescLm)[2] <- "slope"
head(crescLm %>% arrange(desc(slope)))

#Abaixo temos os gêneros que tiveram as maiores quedas na média.
quedaLm <- ddply(queda %>% select(genres,timestamp,rating), "genres", function(x) coef(lm(rating ~ timestamp,data = x))[2])
names(quedaLm)[2] <- "slope"
head(quedaLm %>% arrange(desc(slope)))

#E a segunda seria calcular a diferença entre o maior e o menor rating nesses períodos, por gênero. 
#Para isso usei o pacote `sqldf`. Não gerou o mesmo resultado, a ordem dos maiores não foi a mesma.
library(tcltk)
#Crescimento na média.
cresc <- sqldf("select genres, (max(rating) - min(rating)) diff from tagg where 
               timestamp between 2005 and 2013 and genres != '(no genres listed)' group by genres order by diff desc")
head(cresc)
#Queda na média.
decr <- sqldf("select genres, (max(rating) - min(rating)) diff from tagg where timestamp between 1999 and 2005 and genres != '(no genres listed)' group by genres order by diff desc")
head(decr)

# Questão 3
#usrRatMax <- tout %>% group_by(userId,genres,rating) %>% summarise(count = n())
#usrRatxCt <- usrRatMax %>% mutate(cxr = rating * count) %>% group_by(userId,genres) %>% summarise(avg = mean(cxr))




