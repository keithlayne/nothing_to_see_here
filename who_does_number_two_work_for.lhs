Okay, so the first try sucked.  What did you expect?

First off, the Chain thing is kinda silly.  I think I just wanted to be able
to say 'I wrote a monad!'.  It's exactly like Either.  Either does exactly
what we want - short circuit (ABORT! ABORT!) when we match a rule (Left), and
continue with the Right value otherwise.

So what I really want to do is make a newtype from Either that has better
names.  It would be confusing otherwise since Left is usually an error and
Right is well, right.  I just don't know how to do that exactly.

There's also a lot of moistness in the first version.  I'll get right on that.

> data Rule a b = Rule {
>     test :: (a -> Bool),
>     result :: b
>   }

Ah, feels so declarative.

Should the test be monadic?  Seems less awesome to force that.  Seems like we
can do all kinds of stuff without that, and lift the test if we want to use
monads.

Oh yeah I forgot to mention that the default can always be written as a Rule.
But I don't know any way to force the user to make it like a total function
and cover all the inputs.  Hrm.  I guess that the default would be whatever
you do with a Right value.
