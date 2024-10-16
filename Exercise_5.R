# Exercise 5a

## BaselineEuropeans
my_model <- predped(
    setting = my_environment,
    archetypes = "BaselineEuropean"
)

trace <- simulate(
    my_model,
    max_agents = 5,
    iterations = 100
)

plots <- plot(trace)
gifski::save_gif(
    lapply(plots, print),
    "baseline_simulation.gif"
)

## FastWalker
my_model <- predped(
    setting = my_environment,
    archetypes = "FastWalker",
    filename = "my_parameters.csv",
    sep = ","
)

devtools::load_all(file.path("..", "..", "Projects", "Software, pedestrian modeling"))

trace <- simulate(
    my_model,
    max_agents = 5,
    iterations = 100
)

plots <- plot(trace)
gifski::save_gif(
    lapply(plots, print),
    "fast_simulation.gif",
    delay = 1/10
)

# Exercise 5b
my_model <- predped(
    setting = my_environment,
    archetypes = "BaselineEuropean",
    filename = "my_parameters.csv",
    sep = ","
)

trace <- simulate(
    my_model,
    max_agents = 5,
    iterations = 100
)

# Exercise 5c
trace <- simulate(
    my_model,
    max_agents = 10,
    iterations = 100,
    add_agent_after = 5,
    goal_number = 5,
    goal_duration = 15
)
