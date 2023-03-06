function [ data ] = Bpfun ( w, r )

    matrix = zeros( 2 ^ r, r + 1 );

    matrix( :, 1 ) = w';

    for i = 1 : r

        for k = 1 : 2 ^ ( r - i )

            for j = 1 : 2 ^ ( i - 1 )

                line = 2 ^ i * k - 2 ^ i - 1 + j + 1; % зависимость от k и j

                matrix( line, i + 1 ) = matrix( line, i ) + matrix( line + 2 ^ ( i - 1 ), i );
                matrix( line + 2 ^ ( i - 1 ) , i + 1 ) = matrix( line, i ) - matrix( line + 2 ^ ( i - 1 ), i );

            end

        end

    end
    
    [ m, index ] = max( matrix( :, r + 1 ) );

    index = index - 1;

    data = dec2bin( index );

    for i = 1 : round( length( data ) / 2, TieBreaker="tozero")

        temp = data( length( data ) - i + 1 );
        data( length( data ) - i + 1 ) = data( i );
        data( i ) = temp;
    end

    data = bin2dec( data );

end