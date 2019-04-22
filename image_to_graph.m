function adjacencyMatrix = image_to_graph(image)
%IMAGE_TO_GRAPH Converts the image to an adjacency matrix
    nb_rows = size(image,1);
    nb_cols = size(image,2);
    nb_cells = nb_rows*nb_cols;
    adjacencyMatrix = zeros(nb_cells,nb_cells);
        
    dirs=[-1 0; 
           1 0;
           0 -1;
           0 1;
           1 1;
           -1 1;
           -1 -1;
           1 -1;
           %2 0;
           %0 2;
           %-2 0
           %0 -2
           %2 2;
           %2 -2;
           %-2 2;
           %-2 -2;
           ];
    
    size(dirs)
    
    for i=1:nb_rows
        for j=1:nb_cols
            for k=1:length(dirs)
                new_row=i+dirs(k,1);
                new_col=j+dirs(k,2);
                if ~(1<=new_row && new_row<=nb_rows && 1<=new_col && new_col<=nb_cols)
                    continue;
                end
                cell1=(i-1)*nb_cols+j;
                cell2=(new_row-1)*nb_cols+new_col;
                RGB1=image(i,j,:);
                RGB2=image(new_row,new_col,:);
                
                dist=norm(RGB1(:)-RGB2(:))/sqrt(norm(dirs(k,:)));
                
                if dist<=0.5
                    dist=0;
                end
                adjacencyMatrix(cell1,cell2)=dist;
                adjacencyMatrix(cell2,cell1)=dist;
            end
        end
    end     
end

