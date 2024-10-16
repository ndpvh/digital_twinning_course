# Create example environment with limited access
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
    limited_access = list(
        segment(
            from = c(0, 0),
            to = c(0, 2.5)
        )
    )
)
plot(my_environment)
