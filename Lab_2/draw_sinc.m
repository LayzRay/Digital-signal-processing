function [] = draw_sinc ( N, n, Real, Image )

    figure

    subplot( 2, 1, 1 )
    
    hold on
    
    line( [ 0, N - 1 ], [ 0, 0 ], "Color", "Black" )
    line( [ n; n ], [ zeros( 1, N ); Real ], "Color", "Blue", "LineWidth", 1 )
    
    plot( n, Real, "Color", "Red", "Marker", ".", "MarkerEdgeColor", "b" , "MarkerSize", 10)
    
    xlim( [ 0, N - 1 ] )

    title( "Cos(Real)" )
    xlabel( "Samples" )
    ylabel( "Amp" )
    
    grid on
    
    subplot( 2, 1, 2 )
    
    hold on
    
    line( [ 0, N - 1 ], [ 0, 0 ], "Color", "Black" )
    line( [ n; n ], [ zeros( 1, N ); Image ], "Color", "Blue", "LineWidth", 1 )
    
    plot( n, Image, "Color", "Red", "Marker", ".", "MarkerEdgeColor", "b" , "MarkerSize", 10) 
    
    xlim( [ 0, N - 1 ] )

    title( "Sin(Image)" )
    xlabel( "Samples" )
    ylabel( "Amp" )
    
    grid on

end