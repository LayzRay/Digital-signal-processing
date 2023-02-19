function [ M ] = Mfun ( A, C )

    m = length( C );
    
    M = zeros( 1, m );
    
    for n = 1 : 2 ^ ( m ) - 1

        M( n ) = A( length( A ) );

        temp = A & C( 2 : length( C ) ); 
    
        A = circshift( A, 1 );
        A( 1 ) = mod( sum( temp ), 2 ); 
    
    end

end