function[ Filtered_signal ] = my_sf( A, B )

    m = length( B );
    t = zeros( 1, m );
    Filtered_signal = zeros( 1, 2 *m );

    A = [ A, zeros(1,m) ];
    
    for n = 1 : 2 * m

        Filtered_signal( n ) = sum ( t .* B );
        t = circshift( t, 1 );
        t( 1 ) = A( n );
        
    end

end