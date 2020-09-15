#setwd("~/Dropbox/Aulas/RedesSociais")

library(igraph)

#********************* Declare functions*************************
# this function creates the unidimensional model with N actors
create_unidimensional_model <- function(N){
  #graph from edgelist
  g <- graph_from_edgelist(cbind(c(1:N), c(2:N, 1)), directed = FALSE)
  return(g)
} 

# this function creates the bidimensional model with N² actors
create_bidimensional_model <- function(N){
  g = graph.lattice(c(N,N))
  
  plot(g, vertex.size = 10)
  
  #close lattice
  v1 = seq(from =1, to = N,by = 1)
  v2 = seq(from = 1, to = (N^2) - (N-1), by = N)
  v3 = c(v1,v2)
  
  v1 = seq(from = (N^2) - (N-1), to = N^2, by = 1)
  v2 = seq(from = N, to = N^2, by = N)
  v4 = c(v1,v2)
  
  a = rbind(v3, v4)
  a2 = matrix(a,nrow=length(a),ncol = 1)
  
  g = add.edges(g,a2)
  
  return(g)
}

# this function initiates the opinions of the actors of a model
initiate_opinions <- function(g, seed, prob_minus, prob_plus){
  set.seed(seed)
  X0 = sample(c(-1,1), length(V(g)), replace = TRUE, 
              prob = c(prob_minus, prob_plus))
  
  V(g)$opinion = X0
  
  V(g)$color <- ifelse(V(g)$opinion == 1, "blue", "red")
  par(mar = c(0, 0, 0, 0)) # Set the margin on all sides to 0
  plot(g, vertex.label.color = "white", edge.color = "black", 
       vertex.size = 20)
  
  return(g)
}

# this functions simulates the change of opinion during during a user given number of epochs
# this function returns the graph with final opinions and a dataframe with the sampled
# actor in the first column and its influencer in the second column
model_opinions <- function(g, seed, epochs){
  df <- data.frame(Takes=vector(length = epochs),
                   Gives=vector(length = epochs)) 
  set.seed(seed)
  for (n in seq(1:epochs)) {
    
    b = sample(V(g), 1) #sample an actor
    
    #This IF avoids problems in case the vertex is disconnected from the graph
    if (degree(g)[b] != 0) {
      influencer = sample(neighbors(g, b), size=1) #sample an influencer
      V(g)[b]$opinion = V(g)[influencer]$opinion #get the influencer's opinion
      
      df[n,] = c(as_ids(V(g)[b]), as_ids(V(g)[influencer])) 
      
    } else {df[n,] = c(b, b)}
    
  }
  
  V(g)$color <- ifelse(V(g)$opinion == 1, "blue", "red")
  par(mar = c(0, 0, 0, 0)) # Set the margin on all sides to 0
  plot(g, vertex.label.color = "white", edge.color = "black", 
       vertex.size = 20)
  
  return(list(g, df))
  
}

#this function searches for the origin (influencers) of opinions
get_origin <- function(g, df, epochs){
  
  for (i in seq(1:length(V(g)))) {
    
    size = epochs
    origin = i
    index = match(origin, df$Takes[1:size])
    
    while (is.na(index) == FALSE  && size != 0) {
      size = index-1
      origin = df$Gives[index]
      index = match(origin, df$Takes[1:size])
    }
    V(g)[i]$origin = origin
  }
  
  return(g)
}

# this function simulates the model 100 times and returns a given actors
# last opinion from each simulation
last_opinion <- function(g, actor, prob_minus, prob_plus, n_sim, epochs){
  opinion <- vector(length = n_sim)
  
  for (i in seq(1:n_sim)) {
    print(i)
    g <- initiate_opinions(g, seed = i, 
                           prob_minus = prob_minus, prob_plus = prob_plus)
    l <- model_opinions(g, seed = i, epochs = epochs)
    g <- l[[1]]
    
    opinion[i] <- V(g)[actor]$opinion
  }
  return(opinion)
}

# this functions simulates the change of opinion during T iterations
# with a given actor being a robot (a robot is an actor that does not
# change its original opinion)
model_opinions_robot <- function(g, seed, T, robot, robot_opinion){
  
  V(g)[robot]$opinion <- robot_opinion 
  
  df <- data.frame(Takes=vector(length = T),
                   Gives=vector(length = T)) 
  set.seed(seed)
  for (n in seq(1:T)) {
    b = sample(V(g), 1) #sample an actor
    if (b != robot) {
      influencer = sample(neighbors(g, b), size=1) #sample an influencer
      V(g)[b]$opinion = V(g)[influencer]$opinion #get the influencer's opinion
      df[n,] = c(b, influencer)
    } else {
      df[n,] = c(b, b)
    }
    
  }
  
  V(g)$color <- ifelse(V(g)$opinion == 1, "blue", "red")
  par(mar = c(0, 0, 0, 0)) # Set the margin on all sides to 0
  plot(g, vertex.label.color = "white", edge.color = "black", 
       vertex.size = 20)
  
  return(list(g, df))
  
}

# this function simulates the model 100 times and returns a given actors
# last opinion from each simulation (a given actor is a robot)
last_opinion_robot <- function(g, actor, robot, robot_opinion){
  opinion <- vector(length = 100)
  
  for (i in seq(1:100)) {
    print(i)
    g <- initiate_opinions(g, seed = i, 
                           prob_minus = 0.7, prob_plus = 0.3)
    l <- model_opinions_robot(g, seed = i, T = 100, 
                              robot = robot, robot_opinion = robot_opinion)
    g <- l[[1]]
    
    opinion[i] <- V(g)[actor]$opinion
  }
  return(opinion)
}