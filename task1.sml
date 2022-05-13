fun all_except_option(myStr, stringList) =
    let
        fun traverse(startList, strToFind, leftList) =
            case leftList of
            head::tail => if (head = myStr)
                        then SOME (startList @ tail)
                        else traverse(startList @ (head::[]), myStr, tail)
            |[] => NONE
    in
        traverse([], myStr, stringList)
    end;

all_except_option("1", ["1", "4", "5", "6"]);


fun get_substitutions1(strings, s) =
    case strings of
    head::tail => (case all_except_option(s, head) of
                  NONE => get_substitutions1(tail, s)
                  |SOME lst => lst @ get_substitutions1(tail, s))
    |[] => [];

get_substitutions1([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]], "Fred");


fun get_substitutions2(strings, s) =
    let
        fun getWords(str, lst) =
            case all_except_option(str, lst) of
                  NONE => []
                  |SOME lst =>lst
    in
        case strings of
        head::tail => getWords(s, head) @ get_substitutions2(tail, s)
        |[] => []
    end;

get_substitutions2([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]], "Fred");


fun similar_names(strings, fullName) =
    let
        fun temp(str) =
            str
    in
        strings
    end;


similar_names([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]], {first="Fred", middle="W", last="Smith"});
