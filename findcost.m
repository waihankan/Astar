function total = findcost(path,distance,nodes)
tot_hctg = 0;
tot_dist = 0;
    for i = 1:(length(path)-1)
        tot_dist = tot_dist + distance(path(i),path(i+1));
    end
   
    for j = 1:length(path)
        tot_hctg = tot_hctg + nodes.hctg(path(j));
    end
    
    total = tot_dist+tot_hctg;
end
         
        
