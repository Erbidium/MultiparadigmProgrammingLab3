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

fun card_value(cardSuit, cardRank) =
    case cardRank of
    Num num => num
    |Ace => 11
    |_ => 10;

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

fun sum_cards(cardsList) =
    let
        fun sum(lst, accum) = 
            case lst of
            head::tail => sum(tail, accum+card_value(head))
            |[] => accum;
    in
        sum(cardsList, 0)
    end;

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