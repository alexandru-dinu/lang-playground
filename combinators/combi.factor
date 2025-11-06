USING: kernel math math.order prettyprint sequences ;
IN: combi.factor

! bi
{ 1 2 3 4 5 } [ sum ] [ length ] bi / .

! bi@
6 -3 [ abs ] bi@ .s

! map
{ 2 -4 -3 5 -1 } [ 0 max ] map .
