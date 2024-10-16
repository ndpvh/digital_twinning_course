# Exercise 3a
my_model <- predped(
    setting = my_environment,
    archetypes = c(
        "BaselineEuropean",
        "DrunkAussie"
    )
)
weights(my_model)

# Exercise 3b
my_model <- predped(
    setting = my_environment,
    archetypes = c(
        "BaselineEuropean"
    )
)
weights(my_model)

archetypes(my_model) <- "DrunkAussie"

View(parameters(my_model)[["params_archetypes"]])
