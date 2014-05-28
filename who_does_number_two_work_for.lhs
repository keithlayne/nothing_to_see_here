Okay, so the first try sucked.  What did you expect?

First off, the Chain thing is kinda silly.  I think I just wanted to be able
to say 'I wrote a monad!'.  It's exactly like Either.  Either does exactly
what we want - short circuit (ABORT! ABORT!) when we match a rule (Left), and
continue with the Right value otherwise.

So what I really want to do is make a newtype from Either that has better
names.  It would be confusing otherwise since Left is usually an error and
Right is well, right.  I just don't know how to do that exactly.

There's also a lot of moistness in the first version.  I'll get right on that.

\begin{code}
import Control.Monad (mapM_)

data Rule a b = Rule {
    test :: (a -> Bool),
    result :: b
  }
\end{code}

Ah, feels so declarative.

Should the test be monadic?  Seems less awesome to force that.  Seems like we
can do all kinds of stuff without that, and lift the test if we want to use
monads.

Oh yeah I forgot to mention that the default can always be written as a Rule.
But I don't know any way to force the user to make it like a total function
and cover all the inputs.  Hrm.  I guess that the default would be whatever
you do with a Right value.

Anyways, for the fizzbuzz crap we know we can DRY it up, this little helper
might come in handy:
\begin{code}
modp :: (Integral a) => a -> a -> Bool
modp n = (== 0) . (`mod` n)
\end{code}

Now we can trivially write our fizzbuzz rules:
\begin{code}
fizz = Rule (modp 3) "fizz"
buzz = Rule (modp 5) "buzz"
fizzbuzz = Rule (modp 15) "fizzbuzz"
\end{code}

Writing a little runner for our rules is now pretty easy:
\begin{code}
tryRule :: Rule a b -> a -> Either b a
tryRule rule input | test rule $ input = Left $ result rule
                   | otherwise = Right input
\end{code}

I suppose we could use a nice way to specify a default.  It should just be a
rule that will always match:

\begin{code}
catch_all = Rule (\_ -> True)
\end{code}

Got a (sort-of) monadic thing going on now.  We want to end up with something
that we can compose For Great Good™, so it prolly needs some more love.

What I want to end up with is some chained type of thing like on the first try.

Remembering:
(>>=) :: Monad m => m a -> (a -> m b) -> m b

m = Either b

(>>=) :: Either b a -> (a -> Either b a) -> Either b a

So...'tryRule rule' returns the monadic function.  This leads to the following
result, which is not really satisfying.

\begin{code}
runFizzBuzz n = return n >>= tryRule fizzbuzz >>= tryRule buzz >>= tryRule fizz
\end{code}

This is a problem though, because it needs the value.  This is a shortcoming
of the whole Rule thing.  I think it needs some more work.  Later, that is.

For now, just cheat and use the right value, cause that's what fizzbuzz does.

\begin{code}
-- this is terribad
showResult :: (Show a, Show b) => Either a b -> String
showResult (Left l) = show l
showResult (Right r) = show r

main = mapM_ (putStrLn . showResult . runFizzBuzz) [1..30]
\end{code}

