# Exercise 4a
archetypes <- read.table(
    "my_parameters.csv",
    sep = ","
)

my_archetype <- archetypes[archetypes$name == "BaselineEuropean", ]
my_archetype$name <- "GoalIsEverything"
my_archetype$b_goal_direction <- 30

parameters <- rbind(
    parameters,
    my_archetype
)

write.table(
    parameters,
    "my_parameters.csv",
    sep = ","
)

# Exercise 4b

## Creating the duplicate BaselineEuropean
archetypes <- read.table(
    "my_parameters.csv",
    sep = ","
)

my_archetype <- archetypes[archetypes$name == "BaselineEuropean", ]
my_archetype$b_goal_direction <- 30

parameters <- rbind(
    parameters,
    my_archetype
)

write.table(
    parameters,
    "my_parameters.csv",
    sep = ","
)

## Create predped class and check parameters
my_model <- predped(
    setting = my_environment,
    archetypes = "BaselineEuropean",
    filename = "my_parameters.csv",
    sep = ","
)

View(parameters(my_model)[["params_archetypes"]])


