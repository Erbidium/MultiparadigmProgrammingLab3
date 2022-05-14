use "task1.sml";

(*all_except_option tests*)
fun provided_test_all_except_option() = 
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
fun provided_test_get_substitutions1() = 
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

(*get_substitutions2 tests*)
fun provided_test_get_substitutions2() = 
    let
        val strList1=[["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]] val name1="Fred"
        val strList2=[["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]] val name2="Elizabeth"
        val strList3=[["Fred","Fredrick"],["Elizabeth","Betty"],["John","James","Johny"]] val name3="John"
    in
        [
            get_substitutions2(strList1, name1),
            get_substitutions2(strList2, name2),
            get_substitutions2(strList3, name3)
        ]
    end;

provided_test_get_substitutions2();

(*similar_names tests*)
fun provided_test_similar_names() = 
    let
        val strList1=[["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]] val fullname1={first="Fred", middle="W", last="Smith"}
        val strList2=[["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]] val fullname2={first="Betty", middle="F", last="Smith"}
        val strList3=[["Fred","Fredrick"],["Elizabeth","Betty"],["John","James","Johny"]] val fullname3={first="John", middle="B", last="Smith"}
    in
        [
            similar_names(strList1, fullname1),
            similar_names(strList2, fullname2),
            similar_names(strList3, fullname3)
        ]
    end;

provided_test_similar_names();
