---
title: "Exercício Litteris"
author: Luis Antonio
output: revealjs::revealjs_presentation
css: 
---



# Introdução

## Questões
1. Quais gêneros tem na média histórica os maiores ratings
2. Quais gêneros obtiveram a maior queda e crescimento na média com o passar do tempo 
3. Existe alguma relação entre users? (e.g. users dão notas mais altas para um gênero dão notas mais baixas para outro gênero; dica: você pode tentar segmentar users)

## 
Os dados utilizados para responder as questões foram retirados do link 
[http://grouplens.org/datasets/movielens/20m/](http://grouplens.org/datasets/movielens/20m/)

A partir dele foram retirados dois arquivos úteis, e foram criados dois data frames

```r
ratings <- read_csv("../data/ml-20m/ratings.csv")
```

```
## Error: '../data/ml-20m/ratings.csv' does not exist in current working directory ('/Users/luisantonio/Desktop/testededados/Litteris/arquivos/Presentation/PresReveal').
```

##

```r
movies <- read_csv("../data/ml-20m/movies.csv")
```

```
## Error: '../data/ml-20m/movies.csv' does not exist in current working directory ('/Users/luisantonio/Desktop/testededados/Litteris/arquivos/Presentation/PresReveal').
```

# Processamento
##
Como alguns filmes possuem vários gêneros, separamos os diferentes gêneros em diferentes linhas.

```
## Error in head(movies): objeto 'movies' não encontrado
```


```
## Error in eval(expr, envir, enclos): objeto 'movies' não encontrado
```


```
## Error in head(moviess): objeto 'moviess' não encontrado
```

##
Para obtermos os gêneros e seus respectivos ratings criamos um único data frame fazendo inner join de `ratings` e `movies`, usando o campo `movieId`. 
