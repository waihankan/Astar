function edges = importedges(filename)
%Identify the import options for nodes.
varNames_edges = {'ID1', 'ID2', 'cost'};
varTypes_edges = {'double', 'double', 'double'};
opts_edges = delimitedTextImportOptions('VariableNames',varNames_edges,...
                                  'VariableTypes',varTypes_edges,...
                                  'Delimiter', ',',...
                                  'ExtraColumnsRule', 'ignore',...
                                  'DataLines', [1,inf],...
                                  'EmptyLineRule', 'read',...
                                  'NumVariables', 3);
edges = readtable(filename, opts_edges);
% Modify the edges.csv file to make sure the upcoming codes work properlly.
for i = 1:height(edges)
    if edges.ID2(i) > edges.ID1(i)
        temp = edges.ID1(i);
        edges.ID1(i) = edges.ID2(i);
        edges.ID2(i) = temp;
    end
end    