img = imread('img/goat.jpg');
img=double(img)/255;
figure;
imshow(img);
nb_rows=size(img,1);
nb_cols=size(img,2);

sz=80;
new_nb_rows=ceil(nb_rows/sz);
new_nb_cols=ceil(nb_cols/sz);
compressed_img=zeros(new_nb_rows,new_nb_cols,3);
for i=1:new_nb_rows
    for j=1:new_nb_cols
        total_pixels=0;
        color=[0 0 0];
        for k=((i-1)*sz+1):(i*sz)
            for l=((j-1)*sz+1):(j*sz)
                if ~(1<=k && k<=nb_rows && 1<=l && l<=nb_cols)
                    continue;
                end
                total_pixels=total_pixels+1;
                pixel=img(k,l,:);
                color=color+pixel(:)';
            end
        end
        color=double(color)/total_pixels;
        compressed_img(i,j,:)=color;
    end
end

figure;
imshow(compressed_img);

adjacencyMatrix=image_to_graph(compressed_img);
nb_cells=size(adjacencyMatrix,1);
k=int16(nb_cells/2);
V_G = 1:nb_cells;
F_cut_dir = sfo_fn_cutfun(adjacencyMatrix);
[A, scores, evals] = sfo_greedy_lazy(F_cut_dir,V_G,k);

original_size_compressed_img=zeros(nb_rows,nb_cols,3);
for i=1:new_nb_rows
    for j=1:new_nb_cols
        for k=((i-1)*sz+1):(i*sz)
            for l=((j-1)*sz+1):(j*sz)
                if ~(1<=k && k<=nb_rows && 1<=l && l<=nb_cols)
                    continue;
                end
                original_size_compressed_img(k,l,:)=compressed_img(i,j,:);
            end
        end
    end
end
figure;
imshow(original_size_compressed_img);

marked_img=img;
for i=1:length(A)
    row_compressed=floor((A(i)-1)/new_nb_cols)+1;
    column_compressed=mod(A(i)-1,new_nb_cols)+1;
    for k=((row_compressed-1)*sz+1):(row_compressed*sz)
        for l=((column_compressed-1)*sz+1):(column_compressed*sz)
            if ~(1<=k && k<=nb_rows && 1<=l && l<=nb_cols)
                continue;
            end
            marked_img(k,l,:)=[1 0 0];
        end
     end
end
figure;
imshow(marked_img);


