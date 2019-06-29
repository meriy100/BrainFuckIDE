module BrainFuck.Tape exposing (Command, Tape, currentOrMap, dec, get, inc, init, isZero, leftMap, leftToList, none, pointerDec, pointerInc, putValue, rightMap, rightToList, toList, while)

import BrainFuck.Value as Value
import Debug as Debug


type Right a
    = Right a (Right a)
    | UnUsedRight


type Left a
    = Left (Left a) a
    | UnUsedLeft


type Tape a
    = Tape (Left a) a (Right a)


type alias Command a =
    Tape a -> Tape a


init : Tape Value.Value
init =
    Tape UnUsedLeft Value.zero UnUsedRight


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
    leftToList left ++ value :: rightToList right


leftToList : Left a -> List a
leftToList left =
    case left of
        Left l value ->
            leftToList l ++ [ value ]

        UnUsedLeft ->
            []


rightToList : Right a -> List a
rightToList right =
    case right of
        Right value r ->
            value :: rightToList r

        UnUsedRight ->
            []


inc : Command Value.Value
inc (Tape left value right) =
    Tape left (Value.increment value) right


dec : Command Value.Value
dec (Tape left value right) =
    Tape left (Value.decrement value) right


pointerInc : Command Value.Value
pointerInc (Tape left value right) =
    case right of
        Right v r ->
            Tape (Left left value) v r

        UnUsedRight ->
            Tape (Left left value) Value.zero UnUsedRight


pointerDec : Command Value.Value
pointerDec (Tape left value right) =
    case left of
        Left l v ->
            Tape l v (Right value right)

        UnUsedLeft ->
            Tape UnUsedLeft Value.zero (Right value right)


get : Char -> Command Value.Value
get c (Tape left _ right) =
    Tape left (c |> Char.toCode |> Value.fromInt |> Maybe.withDefault Value.zero) right


putValue : Tape Value.Value -> Value.Value
putValue (Tape _ value _) =
    value



--while : (Tape Value.Value -> Tape Value.Value) -> Tape Value.Value -> Tape Value.Value


while : Command Value.Value -> Command Value.Value
while f ((Tape _ value _) as tape) =
    if tape |> isZero then
        tape

    else
        while f (f tape)


none : Command Value.Value
none tape =
    tape


isZero : Tape Value.Value -> Bool
isZero (Tape _ value _) =
    value == Value.zero
