n=50;
img=generate_random_image(n);
figure;
imshow(img(:,:,1:3));
adjacencyMatrix=image_to_graph(img);
nb_cells=size(adjacencyMatrix,1);
k=int16(nb_cells/2);
V_G = 1:nb_cells;
F_cut_dir = sfo_fn_cutfun(adjacencyMatrix);
[A, scores, evals] = sfo_greedy_lazy(F_cut_dir,V_G,k);
% A = sfo_ls_lazy(F_cut_dir,V_G);
img2=make_indication(A,img);
figure;
imshow(img2(:,:,1:3));