module BrainFuck.Tape exposing (..)

type UnLink =
    UnLink

type Right a =
    Right a (Right a)
    | UnUsedRight

type Left a =
    Left (Left a) a
    | UnUsedLeft

type Tape a =
    Tape (Left a) a (Right a)

init : Tape Int
init =
    Tape UnUsedLeft 0 UnUsedRight

currentOrMap : (a -> b) -> (a -> b) -> Tape a -> Tape b
currentOrMap f g tape =
    case tape of
        Tape left value right ->
            Tape (leftMap g left) (f value) (rightMap g right)

leftMap : (a -> b) -> Left a -> Left b
leftMap f left =
    case left of
       Left l value ->
            Left (leftMap f l) (f value)
       UnUsedLeft ->
           UnUsedLeft
rightMap : (a -> b) -> Right a -> Right b
rightMap f right =
    case right of
       Right value r ->
            Right (f value) (rightMap f r)
       UnUsedRight ->
          UnUsedRight


toList : Tape a -> List a
toList (Tape left value right) =
      (leftToList left) ++ value :: (rightToList right)

leftToList : Left a -> List a
leftToList left =
    case left of
        Left l value ->
            leftToList l ++ [value]
        UnUsedLeft ->
            []
rightToList : Right a -> List a
rightToList right =
    case right of
        Right value r ->
            value :: rightToList r
        UnUsedRight ->
            []

inc : Tape Int -> Tape Int
inc (Tape left value right) =
    if value == 255 then
        Tape left (0) right
    else
        Tape left (value + 1) right

dec : Tape Int -> Tape Int
dec (Tape left value right) =
    if value == 0 then
       Tape left (255) right
    else
       Tape left (value - 1) right

pointerInc : Tape Int -> Tape Int
pointerInc (Tape left value right) =
    case right of
       Right v r ->
           Tape (Left left value) v r
       UnUsedRight ->
           Tape (Left left value) 0 UnUsedRight


pointerDec : Tape Int -> Tape Int
pointerDec (Tape left value right) =
    case left of
       Left l v ->
           Tape l v (Right value right)
       UnUsedLeft ->
           Tape UnUsedLeft 0 (Right value right)

while : (Tape Int -> Tape Int) -> Tape Int -> Tape Int
while f (Tape _ value _ as tape) =
    if value == 0 then
      tape
    else
        while f (f tape)

