function img = generate_random_image(n)
%GENERATE_RANDOM_IMAGE Generates a n by n by 3 matrix of rgb values
    % img=rand(n,n,3);
    img=ones(n,n,3);
    for i=n/3:(2*n/3)
        for j=n/3:(2*n/3)
            for k=1:3
                img(int16(i),int16(j),k)=0;
            end
        end
    end
end

