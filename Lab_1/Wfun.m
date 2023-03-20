function [ W ] = Wfun ( data, r )

    temp = zeros( 1, r );

    char = dec2bin( data );

    for i = 0 : length( char ) - 1

        temp( r - i ) = str2double( char( length( char ) - i ) );

    end

    data_bin = temp;

    fprintf( "Двоичное представление числа %d:\n%s\n", data, dec2bin( data_bin ) )

    W = zeros( 1, 2 ^ r );

    T = zeros( 1, 2 ^ ( r - 1 ) );

    for k = 0 : r - 1

        for i = 2 ^ k : 2 ^ ( k + 1 ) - 1 

            MUX = mod( sum( [ data_bin( k + 1 ), T( 2 ^ k ) ] ), 2 );

            T = [ MUX , T( 1 : length( T ) - 1 ) ];
            W( i + 1 ) = MUX;
            
        end

    end

end