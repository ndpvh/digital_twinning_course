##############################################
# ENVIRONMENT

# Create an example environment
my_environment <- background(
    shape = rectangle(
        center = c(0, 0),
        size = c(5, 5)
    ),
    objects = list(
        circle(
            center = c(0, 0),
            radius = 1
        )
    ),
    entrance = c(-2.5, 0)
)
plot(my_environment)


##############################################
# AGENT CHARACTERISTICS

# Read in parameters and view
parameters <- predped::params_from_csv[["params_archetypes"]]
View(parameters)
parameters$name

# Create a predped model
my_model <- predped(
    setting = my_environment,
    archetypes = c(
        "BaselineEuropean",
        "DrunkAussie"
    ),
    weights = c(0.75, 0.25)
)

# Create user-specified parameters
my_archetype <- parameters[parameters$name == "BaselineEuropean", ]
View(my_archetype)

my_archetype$name <- "FastWalker"
my_archetype$preferred_speed <- 1.8

parameters <- rbind(
    parameters,
    my_archetype
)

write.table(
    parameters,
    "my_parameters.csv",
    sep = ","
)

# Create new predped class
my_model <- predped(
    setting = my_environment,
    archetypes = "FastWalker",
    filename = "my_parameters.csv",
    sep = ","
)
View(parameters(my_model)[["params_archetypes"]])


##############################################
# SIMULATION

# Simulate our first model
trace <- simulate(
    my_model,
    max_agents = 5,
    iterations = 100
)

# Make into a GIF
plots <- plot(trace)
gifski::save_gif(
    lapply(plots, print),
    "my_simulation.gif"
)

