nodes = importnodes('nodes.csv');
edges = importedges(edges.csv');
distance = find_distance(nodes, edges);
%Initialize and preallocate the variables 
start = 1;
goal = table2array(nodes(end, 1));
past_cost = zeros(1, height(nodes));

for k =2:height(nodes)
    past_cost(1, k) = inf;
end

opt_ctg = nodes.hctg.' ;
est_tot_cost = past_cost + opt_ctg;
parent_node = zeros(1, height(nodes));
parent_node(1, 1) = 0;

open = [];
open(1, 1) = nodes.ID(start);
open(1, 2) = est_tot_cost(1);

close = zeros(1, height(nodes));
x = 1;
c = 1;
while ~ isempty(open)
    open = sortrows(open, 2);
    open = open(any(open, 2), :);
    current = open(1, 1);
    open(1, :) = [];
    
    if current == goal
        fprintf('SUCCESS, The shortest optimal path is found!\n');
        path = reconstruct_path(parent_node, current,start);
        fprintf("The shortest optimal path = "); disp(path);        
        pathcost = findcost(path, distance, nodes);
        fprintf("The path_cost of optimal path = "); disp(pathcost);
        writematrix(path,filename);
        break;
    end    
    close(1, c) = current; 
    c = c + 1;
    nbr = findnbr(current, edges);
    
    for i = 1 : length(nbr)        
        if ~ ismember(nbr(i), close)
            tentative_past_cost = past_cost(current) + distance(current,nbr(i));
            if tentative_past_cost < past_cost(nbr(i))
                past_cost(nbr(i)) = tentative_past_cost;
                parent_node(nbr(i)) = current;
                est_tot_cost(nbr(i)) = past_cost(nbr(i)) + nodes.hctg(nbr(i)).';
                if ~ismember(nbr(i), open)
                    open(x, 1) = nbr(i);
                    open(x, 2) = est_tot_cost(nbr(i));
                    x = x + 1;
                end
             end
        end
    end
end
close = close(close ~= 0);
if isempty(open)
    fprintf('FAILED, The path to the goal node is not found! \n');
end                                  