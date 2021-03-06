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

fun get_substitutions1(strings, s) =
    case strings of
    head::tail => (case all_except_option(s, head) of
                  NONE => get_substitutions1(tail, s)
                  |SOME lst => lst @ get_substitutions1(tail, s))
    |[] => [];

fun get_substitutions2(strings, s) =
    let
        fun recursive(str, lst, accumulator) =
            case lst of
            head::tail => (case all_except_option(s, head) of
                           NONE => recursive(s, tail, accumulator)
                           |SOME lst => recursive(s, tail, accumulator @ lst))
            |[] => accumulator
    in
        recursive(s, strings, [])
    end;

fun similar_names(strings, {first=f, middle=m, last=l}) =
    let
        fun temp(strs) =
            case strs of
            [] => []
            | head::tail => {first=head, middle=m, last=l}::temp(tail)
    in
        {first=f, middle=m, last=l}::temp(get_substitutions2(strings, f))
    end;