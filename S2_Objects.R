# Example objects
my_rectangle <- rectangle(
    center = c(0, 0),
    size = c(2, 2)
)

my_polygon <- polygon(
    points = rbind(
        c(-1, -1),
        c(-1, 1),
        c(1, 1),
        c(1, -1)
    )
)

# Accessing attributes
my_rectangle@size
size(my_rectangle)

# Changing attributes
my_rectangle@center <- c(1, 1)
center(my_rectangle) <- c(3, 3)
