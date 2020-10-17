function tot_dist = findcost(path,distance)
tot_dist = 0;
    for i = 1:(length(path)-1)
        tot_dist = tot_dist + distance(path(i),path(i+1));
    end
end
         
        
