module BrainFuck.Tape exposing (..)

type Tape a =
   Tape (Tape a) a (Tape a)
   | UnUsed

currentOrMap : (a -> b) -> (a -> b) -> Tape a -> Tape b
currentOrMap f g tape =
    case tape of
        Tape left value right ->
            Tape (map g left) (f value) (map g right)
        UnUsed ->
            UnUsed

map : (a -> b) -> Tape a -> Tape b
map f tape =
    case tape of
       Tape left value right ->
            Tape (map f left) (f value) (map f right)
       UnUsed ->
           UnUsed

toList : Tape a -> List a
toList memory =
    case memory of
       Tape left value right ->
           (toList left) ++ value :: (toList right)
       UnUsed ->
           []

length : Tape a -> Int
length memory =
    case memory of
       Tape left _ right ->
           (length left) + 1 + (length right)
       UnUsed ->
           0

inc : Tape Int -> Tape Int
inc memory =
    case memory of
       Tape left value right ->
           Tape left (value + 1) right
       UnUsed ->
            UnUsed

dec : Tape Int -> Tape Int
dec memory =
    case memory of
       Tape left value right ->
           Tape left (value - 1) right
       UnUsed ->
            UnUsed

pointerInc : Tape Int -> Tape Int
pointerInc memory =
    case memory of
       Tape left value right ->
           case right of
               Tape _ v r ->
                   Tape (Tape left value UnUsed) v r
               UnUsed ->
                   Tape (Tape left value UnUsed) 0 UnUsed

       UnUsed ->
            UnUsed

pointerDec : Tape Int -> Tape Int
pointerDec memory =
    case memory of
       Tape left value right ->
           case left of
               Tape l v _ ->
                   Tape l v (Tape UnUsed value right)
               UnUsed ->
                   Tape UnUsed 0 (Tape UnUsed value right)

       UnUsed ->
            UnUsed
