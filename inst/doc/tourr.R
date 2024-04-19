## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  cache = FALSE,
  eval = TRUE,
  rmarkdown.html_vignette.check_title = FALSE
)

## ----setup--------------------------------------------------------------------
library(tourr)

## -----------------------------------------------------------------------------
f <- apply(flea[,1:6], 2, function(x) (x-mean(x))/sd(x))
animate(f)

## -----------------------------------------------------------------------------
animate(f,
        tour_path = grand_tour(),
        display = display_xy()
        )

## -----------------------------------------------------------------------------
animate(f,
        tour_path = guided_tour(holes()),
        display = display_xy())

## -----------------------------------------------------------------------------
animate(f,
        tour_path = guided_tour(holes()),
        display = display_xy(col = flea$species))

## -----------------------------------------------------------------------------
# defining the color palette
clrs <- c("#486030", "#c03018", "#f0a800")
# mapping the species vector onto a color vector
flea_col <- clrs[as.numeric(flea$species)]
# the color vector specifies the color for each point
# and gets passed into the display function
animate(f,
        tour_path = guided_tour(holes()),
        display = display_xy(col = flea_col))

## -----------------------------------------------------------------------------
animate(f,
        tour_path = grand_tour(d = 1),
        display = display_dist()
        )

## -----------------------------------------------------------------------------
animate_dist(f)

## -----------------------------------------------------------------------------
t1 <- save_history(f, max = 3)
animate(f, planned_tour(t1))

