T = 10;
a = rand(T, 1);

cvx_begin
    variable P(T, 1);
    maximize(sum(log(1 + P.*a)/ log(2)));
    
    subject to
        P >= 0;
        % min(P) >= 0;
        sum(P) == 1;
cvx_end
