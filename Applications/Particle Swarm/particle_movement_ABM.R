



library(dplyr)
library(ggplot2)
library(gganimate)

############################################################
# PARTICLE SWARM / AGENT MOVEMENT SIMULATION
############################################################

vis_ABM <- function(total_population = 100,
                    steps = 100,
                    movement_speed = 1.3, 
                    animate = FALSE, 
                    seed = NULL) {
  
  if (!is.null(seed)) {
    set.seed(seed)
  }
  
  ##########################################################
  # ENVIRONMENT
  ##########################################################
  
  env <- list(
    x_min = 0,
    x_max = 100,
    y_min = 0,
    y_max = 100
  )
  
  
  ##########################################################
  # INITIALIZE AGENTS
  ##########################################################
  
  agents <- data.frame(
    id = 1:total_population,
    
    x = runif(
      total_population,
      env$x_min,
      env$x_max
    ),
    
    y = runif(
      total_population,
      env$y_min,
      env$y_max
    ),
    
    direction = runif(
      total_population,
      0,
      2 * pi
    )
  )
  
  
  ##########################################################
  # MOVEMENT FUNCTION
  ##########################################################
  
  move_agents <- function(agents, env, speed) {
    
    # Move according to current direction
    agents$x <- agents$x +
      speed * cos(agents$direction)
    
    agents$y <- agents$y +
      speed * sin(agents$direction)
    
    
    # Determine whether an agent crossed a boundary
    boundary_x <-
      agents$x <= env$x_min |
      agents$x >= env$x_max
    
    boundary_y <-
      agents$y <= env$y_min |
      agents$y >= env$y_max
    
    
    # Bounce off vertical walls
    agents$direction[boundary_x] <-
      pi - agents$direction[boundary_x]
    
    # Bounce off horizontal walls
    agents$direction[boundary_y] <-
      -agents$direction[boundary_y]
    
    
    # Keep particles inside the environment
    agents$x <- pmax(
      pmin(agents$x, env$x_max),
      env$x_min
    )
    
    agents$y <- pmax(
      pmin(agents$y, env$y_max),
      env$y_min
    )
    
    
    # Keep angle between 0 and 2*pi
    agents$direction <-
      agents$direction %% (2 * pi)
    
    
    return(agents)
  }
  
  
  ##########################################################
  # RUN SIMULATION
  ##########################################################
  
  agent_history <- vector(
    "list",
    steps + 1
  )
  
  # Initial state
  agents$step <- 0
  agent_history[[1]] <- agents
  
  
  for (t in 1:steps) {
    
    # Move agents
    agents <- move_agents(
      agents = agents,
      env = env,
      speed = movement_speed
    )
    
    agents$step <- t
    
    # Save state
    agent_history[[t + 1]] <- agents
    
    
    # OPTIONAL LIVE ANIMATION
    if (animate) {
      
      plot(
        agents$x,
        agents$y,
        xlim = c(env$x_min, env$x_max),
        ylim = c(env$y_min, env$y_max),
        asp = 1,
        pch = 19,
        xlab = "X",
        ylab = "Y",
        main = paste("Step", t)
      )
      
      Sys.sleep(0.03)
    }
  }
  
  
  ##########################################################
  # COMBINE HISTORY
  ##########################################################
  
  history <- bind_rows(agent_history)
  
  return(history)

}

