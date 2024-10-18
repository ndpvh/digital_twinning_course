################################################################################
#                                                                              #
# In this example, I show how to use the `fx` argument of `simulate` to        #
# introduce more complex behavior into M4MA.                                   #
#                                                                              #
################################################################################

library(predped)

# Preliminaries: Defining the environment and linking environment to agent 
# characteristics.
my_environment <- background(
    shape = rectangle(center = c(0, 0), size = c(5, 5)),
    objects = list(
        circle(center = c(0, 0), radius = 1)
    ),
    entrance = c(-2.5, 0)
)
plot(my_environment)

my_model <- predped(
    setting = my_environment,
    archetypes = "BaselineEuropean"
)


# Simulation without changing the state variable through fx
trace <- simulate(
    my_model,
    max_agents = 5,
    iterations = 50,
    fx = function(x) {
        return(x)
    },
    plot_live = TRUE,
    plot_time = 0.1
)

# Simulation with changing the name of the agent after iteration 25
trace <- simulate(
    my_model,
    max_agents = 5,
    iterations = 50,
    fx = function(x) {

        if(x@iteration == 25) {
            id(x@agents[[1]]) <- "test"
        }

        if(length(x@agents) > 0) {
            print(id(x@agents[[1]]))
        }

        return(x)
    },
    plot_live = TRUE,
    plot_time = 0.1
)

# Simulation with imposing the start of an evacuation after iteration 50
evacuation <- function(x) {

    if(x@iteration == 50) {
        # No agents can enter the room
        x@iteration_variables$max_agents <- 0
        x@potential_agents <- list()

        # Change goals of agents
        agent_list <- x@agents
        for(i in seq_along(agent_list)) {
            # Delete all goals
            goals(agent_list[[i]]) <- list()
            current_goal(agent_list[[i]])@done <- TRUE

            # Plan a route
            status(agent_list[[i]]) <- "completing goal"
        }

        # Put agents back in state
        x@agents <- agent_list
    }

    return(x)
}

set.seed(1)
trace <- simulate(
    my_model,
    max_agents = 5,
    add_agent_after = 2,
    iterations = 80,
    sort_goals = FALSE,
    fx = evacuation,
    plot_live = TRUE,
    plot_time = 0.1
)

# Create a gif out of this evacuation behavior. I replace the plot at index 51 
# to indicate when the evacuation starts in the GIF.
plots <- plot(trace, 
              plot.title.size = 25,
              axis.title.size = 15, 
              goal.size = 4, 
              agent.linewidth = 2)
plots[[51]] <- plot(trace[[51]], 
                    plot.title.size = 25, 
                    axis.title.size = 15, 
                    goal.size = 4, 
                    agent.linewidth = 2, 
                    shape.fill = "red")

gifski::save_gif(lapply(plots, print), 
                 "evacuation.gif", 
                 delay = 1/10)

