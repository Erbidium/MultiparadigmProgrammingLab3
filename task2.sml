datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int 
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw 

exception IllegalMove


fun card_color(cardSuit, cardRank) =
    case cardSuit of
    Hearts => Red
    | Diamonds => Red
    | _ => Black;

card_color(Clubs, Jack);

fun card_value(cardSuit, cardRank) =
    case cardRank of
    Jack => 11
    | Queen => 12
    | King => 13
    | Ace => 14
    | Num num => num;

card_value(Clubs, Num 10);

