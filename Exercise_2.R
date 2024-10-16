# Exercise 2a
my_environment <- background(
    shape = circle(
        center = c(0, 0),
        radius = 3
    ),
    objects = list(
        rectangle(
            center = c(0, 0),
            size = c(2, 2)
        )
    )
)
plot(my_environment)

## Problematic cases
my_environment <- background(
    shape = circle(
        center = c(0, 0),
        radius = 3
    ),
    objects = list(
        rectangle(
            center = c(0, 0),
            size = c(6, 6)
        )
    )
)
plot(my_environment)

my_environment <- background(
    shape = circle(
        center = c(0, 0),
        radius = 3
    ),
    objects = list(
        rectangle(
            center = c(0, 0),
            size = c(6, 2)
        )
    )
)
plot(my_environment)

# Exercise 2b
objects(my_environment) <- list(
    rectangle(
        center = c(0, 0),
        size = c(2, 2)
    ),
    circle(
        center = c(0, -2),
        radius = 0.5
    )
)
plot(my_environment)

# Exercise 2c
create_environment <- function() {
    return(
        background(
            shape = circle(
                center = c(0, 0),
                radius = 3
            ),
            objects = list(
                rectangle(
                    center = c(0, 0),
                    size = c(2, 2)
                ),
                circle(
                    center = c(0, -2),
                    radius = 0.5
                )
            )
        )
    )
}

plot(create_environment())

# Exercise 2d
my_environment <- background(
    shape = circle(
        center = c(0, 0),
        radius = 3
    ),
    objects = list(
        rectangle(
            center = c(0, 0),
            size = c(2, 2)
        ),
        circle(
            center = c(0, -2),
            radius = 0.5
        )
    ),
    entrance = c(-3, 0)
)
plot(my_environment)

# Exercise 2e
my_environment <- background(
    shape = circle(
        center = c(0, 0),
        radius = 3
    ),
    objects = list(
        rectangle(
            center = c(0, 0),
            size = c(2, 2)
        ),
        circle(
            center = c(0, -2),
            radius = 0.5
        )
    ),
    entrance = c(-3, 0),
    exit = c(3, 0)
)
plot(my_environment)

# Exercise 2f
my_environment <- background(
    shape = rectangle(
        center = c(0, 0),
        size = c(10, 5)
    ),
    objects = list(
        polygon(
            points = rbind(
                c(-3, 2.5),
                c(-2.25, 2.5),
                c(-2.25, 1),
                c(1, 1),
                c(1, 0.25),
                c(-3, 0.25)
            )
        ),
        circle(
            center = c(-2.5, -1.75),
            radius = 0.4
        ),
        circle(
            center = c(-1, -1.75),
            radius = 0.4
        ),
        circle(
            center = c(0.5, -1.75),
            radius = 0.4
        ),
        circle(
            center = c(2, -1.75),
            radius = 0.4
        ),
        circle(
            center = c(3.5, -1.75),
            radius = 0.4
        ),
        circle(
            center = c(3.5, -0.25),
            radius = 0.4
        ),
        circle(
            center = c(3.5, 1.25),
            radius = 0.4
        )
    ),
    entrance = c(-5, -1)
)
plot(my_environment)

# Exercise 2g
plot(
    my_environment,
    dark_mode = TRUE
)
