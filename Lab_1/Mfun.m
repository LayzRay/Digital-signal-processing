function [ M ] = Mfun ( A, C )

    m = length( C );
    
    M = zeros(1,m);
    
    for n = 1 : 2 ^ ( m ) - 1
    
        t = A & C;
    
        s = 0;
    
        for i = 1:length( t )
            s = xor(s, t( i ) );
        end
    
        M(n) = s;
    
        A = circshift(A, 1);
        A(1) = s;
    
    end

end