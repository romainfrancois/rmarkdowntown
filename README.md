
# rmarkdowntown

This is a hack so that you can do this write an Rmd like this

`````
---
title: "Untitled"
author: "Romain"
date: "18/10/2017"
output: rmarkdowntown::html_document2
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## R Markdown

````
```{r label}
rnorm(10)
```
````

`````
