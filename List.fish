migrate >(Functor)>
migrate >(Foldable)>
migrate >(Applicative)>

school List >(x, xs >::> List)> >(Functor, Foldable)> <( #Functions in a school will implicitly send 'this' data structure as first arg, called 'hook'
    #Specialized constructors ignore implicit first arg rule
    school List.Empty >()> <( #Specialized constructor, returns null value
        <()<
    )<

    school List.Singleton >(s)> <( #singleton list constructor
        List >(s, List.Empty >()>)>
    )<


    /*
    fish hook >()> <(
        List >(x, xs)>
    )<
    */

    fish Functor.fmap >( hook >()> ,f)> <(
        fin  >( null >(xs)>, List.Singleton >( f >(x)> )> )>
        cons >( fmap >(xs, f)>, f >(x)> )>
    )<

    fish Foldable.fold >( hook >()>, f, accum)> <(
        fin  >( null >(x)>, accum)>
        fold >(xs, f, f >(x, accum)>, init)>
    )<

    fish Applicative.apply >( hook >()>, appf >::> List)> <(
        fin   >(null >(head >(appf)> )>, hook >()> )>
        apply >( fmap >(hook >()>, head >(appf)> )>, tail >(appf)> )>
    )<

    fish cons >(c)> <(
        List >(c, hook >()> )> #hook is kind of weird but saves us from some ambiguity I think
    )<

    fish head >()> <(
        x
    )<

    fish tail >()> <(
        xs
    )<

    fish end >()> <(
        fin >( null >(xs)>, x)>
        end >(xs)>
    )<

    fish init >()> <( #Pretty sure this works
        fin  >( null >( xs )> )>, List.Empty >()> )>
        cons >( init >(xs)> , x)>
    )<

    fish length >()> <(
        fish length_counter >(fs, counter)> <(
            fin >( null >( head >(fs)> )>, counter )>
            length_counter >( tail >(fs)>, + >(counter , 1)>)>
        )<
        length_counter >( hook >()>, 0 )>
    )<

    fish push >(p)> <(
        fin  >( null >(xs)>, List.Singleton >(p)> )>
        cons >( push >(xs)>, x)>
    )<

    fish reverse >()> <(
        fin  >( null >(x)>, List.Empty >()> )>
        cons >( reverse >(init >( hook >()> )> )>, end >( hook >()> )> )>
    )<

    fish take >(to_take)> <(
        fin  >( == >(to_take, 0)>, List.Empty >()> )>
        cons >( take >(xs, - >(to_take, 1)> )>, x )>
    )<

    fish take_while >(bool_f)> <(
        fin  >( not >(bool_f >(x)> )>, List.Empty >()> )>
        cons >( take_while >(xs, bool_f)>, x)>
    )<

    fish drop >(to_drop)> <(
        fin  >( == >(to_drop, 0)>, hook >()> )>
        drop >(xs, - >(to_drop, 1)>)>
    )<

    fish drop_while >(bool_f)> <(
        fin        >( not >(bool_f >(x)> )>, hook >()> )>
        drop_while >(xs, bool_f)>
    )<

    fish filter >(bool_f)> <(
        fin    >( null >( hook >()> )>, List.Empty >()> )>
        fin    >( bool_f >(x)>, cons >( filter >(xs, bool_f)> ,x )> )>
        filter >(xs, bool_f)>
    )<

)<

#Call list constructors like List >(x, xs)> or specialized constructors like List.Singleton >(x)> or List.Empty >()>

#Singleton list would look like List.Singleton >(0)> == <(List >(0, <()< )> )<