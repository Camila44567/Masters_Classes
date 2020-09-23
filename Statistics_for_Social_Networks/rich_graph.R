library(igraph)

#********************* Declare functions*************************

# This function creates rich gets richer random graph of N0+t vertices where
# N0 is the initial number of vertices in the graph, M0 is the edge list with the
# initial connection and t is the number of iterations (vertices added).
# If plot gV0 is true then the initial graph is plotted
rich_get_richer_graph <- function(N0, M0, t, plot_gV0){
  
  #Create initial graph with N0 vertices and M0
  g <- make_graph(M0, directed = FALSE)
  
  if (plot_gV0 == TRUE) {
    #Plot graph
    par(mar = c(0, 0, 0, 0)) # Set the margin on all sides to 0
    plot(g, vertex.label.color = "black", edge.color = "black", 
         vertex.size = 20)
  }
  
  ############Generate rich gets richer graph
  
  # we will add to this sample list each vertex that has a new connection. in this way, when we sample from it, vertices that are more recurrent have higher degrees and are more likely to be sampled
  sample_list <- vector(length = length(M0)/2 + 2*t)
  sample_list[1:length(M0)] <- M0
  
  n_sl <- 2 #number of vertices in the sample_list
  
  for (v_new in seq(N0+1,t)) {
    
    #sample a vertex for the new vertex i to connect to
    neighbor <- sample(sample_list[1:n_sl], 1)
    
    # add one new vertex
    g <- add_vertices(g, 1) 
    
    # connect new vertex to its sampled neighbor
    g <- add.edges(g, cbind(v_new, neighbor))
    
    #plot(g, vertex.label.color = "black", edge.color = "black", 
    #     vertex.size = 10)
    
    #update sample list with vertices that received a connection (we always add two new elements)
    sample_list[(n_sl+1):(n_sl+2)] = c(v_new, neighbor)
    
    #update number of vertices in the sample_list
    n_sl <- n_sl + 2
    
  }
  
  return(g)
  
}
