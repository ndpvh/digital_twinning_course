# Exercise 1a
my_rectangle <- rectangle(
    center = c(2, 2),
    size = c(2, 4)
)

# Exercise 1b
my_rectangle@size
size(my_rectangle)

#Exercise 1c
my_rectangle@points
points(my_rectangle)
base::plot(
    points(my_rectangle),
    xlim = c(-1, 5),
    ylim = c(-1, 5)
)

# Exercise 1d
my_rectangle@size <- c(2, 2)
points(my_rectangle)
base::plot(
    points(my_rectangle),
    xlim = c(-1, 5),
    ylim = c(-1, 5)
)

# Exercise 1e
size(my_rectangle) <- c(2, 2)
points(my_rectangle)
base::plot(
    points(my_rectangle),
    xlim = c(-1, 5),
    ylim = c(-1, 5)
)

# Exercise 1f
my_polygon <- polygon(
    points = rbind(
        c(0, 0),
        c(1, 2),
        c(2, 0)
    )
)
my_polygon

my_circle <- circle(
    center = c(0, 0),
    radius = 1
)
my_circle
