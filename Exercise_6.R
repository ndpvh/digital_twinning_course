# Without one-directional flow
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
    )
)
plot(my_environment)

my_model <- predped(
    setting = my_environment,
    archetypes = "BaselineEuropean"
)

trace <- simulate(
    my_model,
    add_agent_after = 5,
    max_agents = 5,
    iterations = 100
)
plots <- plot(trace)
gifski::save_gif(
    lapply(plots, print),
    "E6_bidirectional.gif",
    delay = 1/10
)

# With one-directional flow
limited_access(my_environment) <- lapply(
    1:10,
    function(x) {
        angle <- x * 2 * pi / 10
        return(
            segment(
                from = c(0, 0),
                to = sqrt(50) / 2 * c(cos(angle), sin(angle))
            )
        )
    }
)
plot(my_environment)

my_model <- predped(
    setting = my_environment,
    archetypes = "BaselineEuropean"
)

trace <- simulate(
    my_model,
    add_agent_after = 5,
    max_agents = 5,
    iterations = 100
)
plots <- plot(trace)
gifski::save_gif(
    lapply(plots, print),
    "E6_unidirectional.gif",
    delay = 1/10
)
