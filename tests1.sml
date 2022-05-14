use "task1.sml";

(*all_except_option tests*)
fun provided_test_all_except_option () = 
    let
        val str1="1" val strList1=["1", "4", "5", "6"]
        val str2="5" val strList2=["1", "4", "5", "6"]
        val str3="8" val strList3=["1", "4", "5", "6"]
    in
        [
            all_except_option(str1, strList1),
            all_except_option(str2, strList2),
            all_except_option(str3, strList3)
        ]
    end;

provided_test_all_except_option();

(*get_substitutions1 tests*)
fun provided_test_get_substitutions1 () = 
    let
        val strList1=[["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]] val name1="Fred"
        val strList2=[["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]] val name2="Elizabeth"
        val strList3=[["Fred","Fredrick"],["Elizabeth","Betty"],["John","James","Johny"]] val name3="John"
    in
        [
            get_substitutions1(strList1, name1),
            get_substitutions1(strList2, name2),
            get_substitutions1(strList3, name3)
        ]
    end;

provided_test_get_substitutions1();
(*
(*get_substitutions2 tests*)
get_substitutions2([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]], "Fred");

(*similar_names tests*)
similar_names([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]], {first="Fred", middle="W", last="Smith"});*)