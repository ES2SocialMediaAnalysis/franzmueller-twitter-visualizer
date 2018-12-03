setwd("R:/"); #Set to wherever you want.

library(igraph);
library(networkD3);
library(magrittr);

edges <- read.csv("edges.csv");
igraph <- graph_from_data_frame(edges);
nwd3 <- igraph_to_networkD3(igraph);
forceNetwork(Links = nwd3$links, Nodes = nwd3$nodes, 
             Source = 'source', Target = 'target', 
             NodeID = 'name', Group = 'name')  %>%
  saveNetwork(file = 'edges.html');
#Now open the HTML file in your brwoser. This should perform much better than the Viewer of RStudio.

#TODO
#This sucks for big graphs as viewing the graph really needs a lot of performance.
#My new Desktop PC (6 cores @ 4Ghz) can't handle 75.000 links.