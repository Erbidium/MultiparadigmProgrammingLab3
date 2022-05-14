datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int 
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw 


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

exception IllegalMove

fun remove_card(card, cardsList, e) =
    let
        fun remove(checkedCards, cardToFind, leftCards) =
            case leftCards of
            head::tail => (if (head = cardToFind)
                        then checkedCards@tail
                        else remove(checkedCards @ (head::[]), cardToFind, tail))
            |[] => raise e
    in
        remove([], card, cardsList)
    end;

remove_card((Clubs, Num 10), [(Clubs, Num 10), (Spades, Num 10), (Diamonds, Num 10)], IllegalMove);

fun all_same_color(cardsList) =
    let
        fun check(lst, checkColor) =
            case lst of
            [] => true
            | head::tail => if card_color(head) <> checkColor
                          then false
                          else check(tail, checkColor)
    in
        case cardsList of
        head::tail => check(tail, card_color(head))
    end;

all_same_color([(Clubs, Num 10), (Spades, Num 10), (Diamonds, Num 10)]);


fun sum_cards(cardsList) =
    let
        fun sum(lst, accum) = 
            case lst of
            head::tail => sum(tail, accum+card_value(head))
            |[] => accum;
    in
        sum(cardsList, 0)
    end;

sum_cards([(Clubs, Num 10), (Spades, Num 10), (Diamonds, Num 10)]);

fun score(cardsList, goal) =
    let
        val sum = sum_cards(cardsList)
        fun calcPartialScore() = 
            if sum > goal
            then 3*(sum - goal)
            else goal - sum
        val partialScore = calcPartialScore()
    in
        if all_same_color(cardsList) = false
        then partialScore
        else partialScore div 2
    end;


score([(Clubs, Num 10), (Spades, Num 10), (Diamonds, Num 10)], 50);


fun officiate(cardsList, moveList, goal) =
    let 
        fun doStep(cardslst, movelst, playerCards) =
            if sum_cards(playerCards) > goal
            then score(playerCards, goal)
            else (
                case movelst of
                step::tailMove => (
                    case step of
                    Draw => (
                        case cardslst of
                        [] => score(playerCards, goal)
                        |cardHead::tailCards => doStep(tailCards, tailMove, cardHead::playerCards)
                    )
                    |Discard card => doStep(cardslst, tailMove, remove_card(card, playerCards, IllegalMove))
                )
                |[] => score(playerCards, goal)
            )
    in
        doStep(cardsList, moveList, [])
    end;


officiate([(Clubs, Num 10), (Spades, Num 10), (Diamonds, Num 10)], [Draw, Draw, Discard (Clubs, Num 10)], 50);