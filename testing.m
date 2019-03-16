n=5;
k=3;
%G_dir=[0 1 1.2 0 0 0; 1.3 0 1.4 0 0 0; 1.5 1.6 0 1.7 0 0; 0 0 1.8 0 1.9 2; 0 0 0 2.1 0 2.2; 0 0 0 2.3 2.4 0];
G_dir=rand(n,n);
V_G = 1:n;
F_cut_dir = sfo_fn_cutfun(G_dir);
[A,scores, evals] = sfo_greedy_lazy(F_cut_dir,V_G,k);
A
scores
evals
