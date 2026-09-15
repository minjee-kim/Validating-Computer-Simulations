

source("particle_movement_ABM.R")

### run the system 
abm_run <- vis_ABM(
  total_population = 100,
  steps = 100,
  movement_speed = 1.3,
  seed = 123
)
## history tracking
abm_run %>%
  filter(step == 50) %>%
  ggplot(aes(x = x, y = y)) +
  geom_point(size = 2) +
  coord_fixed(
    xlim = c(0, 100),
    ylim = c(0, 100)
  ) +
  labs(
    title = "Particle Swarm",
    subtitle = "Step 50",
    x = "x",
    y = "y"
  ) +
  theme_minimal()


## animate 
p <- ggplot(
  abm_run,
  aes(x = x, y = y)
) +
  geom_point(
    size = 2,
    alpha = 0.8
  ) +
  coord_fixed(
    xlim = c(0, 100),
    ylim = c(0, 100),
    expand = FALSE
  ) +
  labs(
    title = "Particle Swarm Simulation",
    subtitle = "Step: {frame_time}",
    x = "x",
    y = "y"
  ) +
  theme_minimal() +
  transition_time(step)

animate(
  p,
  nframes = 101,
  fps = 15,
  width = 600,
  height = 600
)


