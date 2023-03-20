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

    data = matrix( :, r + 1 )';
    binary_index = 0;

    for i = 1 : 2 ^ r

        if ( data ( i ) >= 2 ^ r / 2 ) && ( binary_index ~= i - 1 )

            binary_index = zeros( 1, r );

            char = dec2bin( i - 1 );

            for j = 0 : length( char ) - 1

                binary_index( r - j ) = str2double( char( length( char ) - j ) );

            end

            binary_index = binary_index ( length( binary_index ) : -1 : 1 );
            binary_index = bin2dec( dec2bin( binary_index )' );

            temp = data ( binary_index + 1 );
            data( binary_index + 1 ) = data( i );
            data( i ) = temp;

        end

    end

end