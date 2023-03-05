function [ W ] = Wfun ( data, r )

    W = zeros( 1, 2 ^ r );

    T = zeros( 1, 2 ^ ( r - 1 ) );

    for k = 0 : r - 1

        for i = 2 ^ k : 2 ^ ( k + 1 ) - 1 

            MUX = mod( sum( [ data( k + 1 ), T( 2 ^ k ) ] ), 2 );

            T = [ MUX , T( 1 : length( T ) - 1 ) ];
            W( i + 1 ) = MUX;
            
        end

    end

end