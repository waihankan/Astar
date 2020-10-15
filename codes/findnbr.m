function nbr = findnbr(x,edges)
j = 1;
    for i = 1:height(edges)
        if edges.ID1(i) ~= x
            if edges.ID2(i) == x
                nbr(1,j) = edges.ID1(i);
                j = j+1;
            end
        else
            nbr(1,j) = edges.ID2(i);
            j = j+1;
        end
    end
end
                
            



