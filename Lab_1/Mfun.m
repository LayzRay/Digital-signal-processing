function [ M ] = Mfun ( A, C )

    % A - фаза.
    % С - характеристический многочлен.

    m = length( C );
    
    M = zeros( 1, 2 ^ ( m ) - 1 );
    
    for n = 1 : 2 ^ ( m ) - 1

        M( n ) = A( length( A ) );

        temp = A & C; 
    
        A = circshift( A, 1 );
        A( 1 ) = mod( sum( temp ), 2 ); 
    
    end

end