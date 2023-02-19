function [ M ] = SubM ( M )

    % Заменяет в M-последовательности 0 на 1, 1 на -1.
    
    for i = 1 : length( M )
    
        if ( M( i ) )
    
            M( i ) = -1;
    
        else
    
            M( i ) = 1;
    
        end
    
    
    end

end