

source("particle_movement_ABM.R")

### run simulation
abm_run <- vis_ABM(
  total_population = 100,
  steps = 500,
  movement_speed = 1.3,
  animate = FALSE,
  seed = 123
)


### animate afterward
library(ggplot2)
library(gganimate)
library(gifski)

p <- ggplot(
  abm_run,
  aes(x = x, y = y)
) +
  geom_point(
    size = 1,
    color = "pink"
  ) +
  coord_fixed(
    xlim = c(0, 100),
    ylim = c(0, 100)
  ) +
  labs(
    title = "Step: {frame_time}",
    x = "X Position",
    y = "Y Position"
  ) +
  theme_minimal() +
  transition_time(step) +
  ease_aes("linear")


animate(
  p,
  nframes = 100,
  fps = 10,
  renderer = gifski_renderer()
)





