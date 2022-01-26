function [xn err] = hwk2p3(x0, c)
 %Q = [1 0; 0 c];
    err = 1;
    eps = 1e-5; %chose an epsilon that allowed very close convregence
                %while still allowing stopping due to convergence criterion 
                %(as opposed to 1000 steps)
    steps = 1;
    k =0.5;
    alpha = 1;
    rho = 0.5; %backstepping parameter
  
    while err > eps
       % fn = dot(x0, Q*x0);
        d = grad(x0, c); % derivative
        p = -d/norm(d); %direction of search
       
        xn = x0 + alpha*p;
        %fnk = dot(xn, Q*xn);
    
        %backtrack armijio
        while fn(xn, c) > fn(x0, c) + k*alpha*dot(d, p)
            alpha = rho*alpha;
            A_k0 = norm(grad(xn, c));
            xn = x0 + alpha*p;
            A_k1 = norm(grad(x0 + alpha*p, c));
            %fnk = dot(xn, Q*xn);
            %err = abs(A_k1/A_k0 - 1); % Alternative criterion
            err = abs(A_k1);
        end
        if err <= eps
            if fn(xn, c) >= fn(x0, c)
               xn  =  x0;
            end
            break
        end
        
        steps = steps + 1;
        if steps >= 1000
            break
        end
        x0 = xn;
        
    end
    xn = x0;
    err = err;
end