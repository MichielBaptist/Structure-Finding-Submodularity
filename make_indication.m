function new_img = make_indication(cells_vector,img)
%MAKE_INDICATION returns a new image where the cells indicated by
%                cells_vector are colored in img
    new_img=img;
    nb_cols=size(img,2);
    for i=1:length(cells_vector)
        row=fix((cells_vector(i)-1)/nb_cols)+1;
        col=mod((cells_vector(i)-1),nb_cols)+1;
        new_img(row,col,:)=[1 0 0];
    end
end

