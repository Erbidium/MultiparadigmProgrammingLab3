use "task2.sml";

(*card_color tests*)
fun provided_test_card_color() = 
    let
        val card1=(Clubs, Jack)
        val card2=(Diamonds, Queen)
        val card3=(Spades, Num 9)
    in
        [
            card_color(card1),
            card_color(card2),
            card_color(card3)
        ]
    end;

provided_test_card_color();

(*card_value tests*)
fun provided_test_card_value() = 
    let
        val card1=(Clubs, Jack)
        val card2=(Diamonds, Queen)
        val card3=(Spades, Num 9)
    in
        [
            card_value(card1),
            card_value(card2),
            card_value(card3)
        ]
    end;

provided_test_card_value();

(*remove_card tests*)
fun provided_test_remove_card() = 
    let
        val card1=(Clubs, Num 10) val cardsList1=[(Clubs, Num 10), (Spades, Num 10), (Diamonds, Num 10)]
        val card2=(Spades, Num 10) val cardsList2=[(Spades, Num 10)]
        val card3=(Diamonds, Num 10) val cardsList3=[(Clubs, Num 10), (Spades, Num 10), (Diamonds, Num 10)]
    in
        [
            remove_card(card1, cardsList1, IllegalMove),
            remove_card(card2, cardsList2, IllegalMove),
            remove_card(card3, cardsList3, IllegalMove)
        ]
    end;

provided_test_remove_card();

(*all_same_color tests*)
fun provided_test_all_same_color() = 
    let
        val cardsList1=[(Clubs, Num 10), (Spades, Num 10), (Diamonds, Num 10)]
        val cardsList2=[(Spades, Num 10)]
        val cardsList3=[(Clubs, Num 10), (Spades, Num 10), (Hearts, Num 10)]
    in
        [
            all_same_color(cardsList1),
            all_same_color(cardsList2),
            all_same_color(cardsList3)
        ]
    end;

provided_test_all_same_color();

(*sum_cards tests*)
fun provided_test_sum_cards() = 
    let
        val cardsList1=[(Clubs, Num 10), (Spades, Num 10), (Diamonds, Num 10)]
        val cardsList2=[(Spades, Queen)]
        val cardsList3=[(Clubs, King), (Spades, Ace), (Hearts, Num 10)]
    in
        [
            sum_cards(cardsList1),
            sum_cards(cardsList2),
            sum_cards(cardsList3)
        ]
    end;

provided_test_sum_cards();

(*score tests*)
fun provided_test_score() = 
    let
        val cardsList1=[(Clubs, Num 10), (Spades, Num 10), (Diamonds, Num 10)] val goal1=50
        val cardsList2=[(Spades, Queen)] val goal2=30
        val cardsList3=[(Clubs, King), (Spades, Ace), (Hearts, Num 10)] val goal3=20
    in
        [
            score(cardsList1, goal1),
            score(cardsList2, goal2),
            score(cardsList3, goal3)
        ]
    end;

provided_test_score();

(*officiate tests*)
fun provided_test_officiate() = 
    let
        val cardsList1=[(Clubs, Num 10), (Spades, Num 10), (Diamonds, Num 10)] val moves1=[Draw, Draw, Discard (Clubs, Num 10)] val goal1=50
        val cardsList2=[(Spades, Queen)] val moves2=[Draw] val goal2=30
        val cardsList3=[(Clubs, King), (Spades, Ace), (Hearts, Num 10)] val moves3=[Draw, Discard (Clubs, King), Draw] val goal3=20
    in
        [
            officiate(cardsList1, moves1, goal1),
            officiate(cardsList2, moves2, goal2),
            officiate(cardsList3, moves3, goal3)
        ]
    end;

provided_test_officiate();