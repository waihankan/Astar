function dist = find_distance(nodes,edges)

size = height(nodes);
dist = zeros(size,size);
    for i = 1 : height(edges)
        dist(edges.ID2(i),edges.ID1(i)) = edges.cost(i);
        dist(edges.ID1(i),edges.ID2(i)) = edges.cost(i);
    end
end






