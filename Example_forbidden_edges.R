################################################################################
#                                                                              #
# In this example, I show how to introduce and plot forbidden edges, that is   #
# regions of an object that cannot contain a goal.                             #
#                                                                              #
################################################################################

library(predped)

# Defining an environment with one object that cannot be interacted with, one 
# object that has some forbidden edges, and one object that has no restrictions.
my_environment <- background(
    shape = rectangle(center = c(0, 0), size = c(6, 6)),
    objects = list(
        # No restrictions
        rectangle(
            center = c(0, 0), 
            size = c(1, 1)
        ),
        # Two forbidden edges (edge 1 and edge 3, see plot)
        rectangle(
            center = c(0, 2), 
            size = c(1, 1), 
            forbidden = c(1, 3)
        ),
        # No interaction possible
        rectangle(
            center = c(0, -2), 
            size = c(1, 1),
            interactable = FALSE
        )
    ),
    entrance = c(-3, 0)
)

# To plot the environment with explicit mention of the forbidden edges, you 
# you should change the `plot_forbidden` argument to TRUE and (optional) specify
# the color you want these forbidden regions to have.
plot(my_environment, 
     plot_forbidden = TRUE, 
     forbidden.color = "red")




# This time, we will use circles instead of rectangles for the environment.
my_environment <- background(
    shape = rectangle(center = c(0, 0), size = c(6, 6)),
    objects = list(
        # No restrictions
        circle(
            center = c(0, 0), 
            radius = 0.5
        ),
        # Two forbidden sets of angles (0 to 90 degrees, 180 to 270 degrees)
        circle(
            center = c(0, 2), 
            radius = 0.5, 
            forbidden = rbind(c(0, pi / 2), 
                              c(pi, 3 * pi / 2))
        ),
        # No interaction possible
        circle(
            center = c(0, -2), 
            radius = 0.5,
            interactable = FALSE
        )
    ),
    entrance = c(-3, 0)
)

# To plot the environment with explicit mention of the forbidden edges, you 
# you should change the `plot_forbidden` argument to TRUE and (optional) specify
# the color you want these forbidden regions to have.
plot(my_environment, 
     plot_forbidden = TRUE, 
     forbidden.color = "red", 
     optimize = TRUE)

