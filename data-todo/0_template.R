# 0_template.R
# Time-stamp: <10 May 2018 19:50:45 c:/x/rpack/agridat/data-raw/0_template.R>

libs(desplot,dplyr,kw,lattice,magrittr,readxl,readr,reshape2,tibble)

# ----------------------------------------------------------------------------

# one matrix, no column names

setwd("c:/x/rpack/agridat/data-raw/")
dat <- read_excel("nagai.strawberry.uniformity.xlsx","Sheet1", col_names=FALSE)

dat %<>% as.matrix %>% `colnames<-`(1:ncol(dat)) %>% melt %>% rename(row=Var1,col=Var2,yield=value)

require(desplot)
desplot(yield ~ col*row, dat,
        flip=TRUE, aspect=1,
        main="nagai.strawberry.uniformity")

nagai.strawberry.uniformity <- dat

agex(nagai.strawberry.uniformity)

# ----------------------------------------------------------------------------

# multiple matrices

dat2 <- read_excel("bose.multi.xlsx","Sheet2", col_names=FALSE)
dat3 <- read_excel("bose.multi.xlsx","Sheet3", col_names=FALSE)

# dat1 %<>% as.matrix %>% setNames(., 1:15) %>% melt %>% rename(col=Var1,row=Var2,yield=value)
dat1 %<>% as.matrix %>% `colnames<-`(1:ncol(dat1)) %>% melt %>% rename(row=Var1,col=Var2,yield=value) %>% 

dat2 %<>% as.matrix %>% `colnames<-`(1:15) %>% melt %>% rename(row=Var1,col=Var2,yield=value) %>% mutate(year="1931", crop="wheat")

dat3 %<>% as.matrix %>% `colnames<-`(1:15) %>% melt %>% rename(row=Var1,col=Var2,yield=value) %>% mutate(year="1932", crop="lentil")
