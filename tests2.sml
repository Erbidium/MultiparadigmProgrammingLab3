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
remove_card((Clubs, Num 10), [(Clubs, Num 10), (Spades, Num 10), (Diamonds, Num 10)], IllegalMove);

(*all_same_color tests*)
all_same_color([(Clubs, Num 10), (Spades, Num 10), (Diamonds, Num 10)]);

(*sum_cards tests*)
sum_cards([(Clubs, Num 10), (Spades, Num 10), (Diamonds, Num 10)]);

(*score tests*)
score([(Clubs, Num 10), (Spades, Num 10), (Diamonds, Num 10)], 50);

(*officiate tests*)
officiate([(Clubs, Num 10), (Spades, Num 10), (Diamonds, Num 10)], [Draw, Draw, Discard (Clubs, Num 10)], 50);