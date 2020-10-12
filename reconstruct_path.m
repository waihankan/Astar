
function total_path = reconstruct_path(parent_node,current,start)
total_path = current;
i = 2;
    while parent_node(current) ~= start
       current = parent_node(current);
       total_path(1,i) = current;
       i = i + 1;   
    end
    total_path(1,end+1) = start;
    total_path = flip(total_path);
end