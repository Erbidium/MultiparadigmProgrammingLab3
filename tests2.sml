use "task2.sml";

(*card_color tests*)
card_color(Clubs, Jack);

(*card_value tests*)
card_value(Clubs, Num 10);

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