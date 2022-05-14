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
sum_cards([(Clubs, Num 10), (Spades, Num 10), (Diamonds, Num 10)]);

(*score tests*)
score([(Clubs, Num 10), (Spades, Num 10), (Diamonds, Num 10)], 50);

(*officiate tests*)
officiate([(Clubs, Num 10), (Spades, Num 10), (Diamonds, Num 10)], [Draw, Draw, Discard (Clubs, Num 10)], 50);