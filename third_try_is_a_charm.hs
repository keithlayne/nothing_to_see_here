-- Still not great, but getting better.
-- Don't judge me.  You don't know my life.

import Control.Monad (mapM_)
import Control.Applicative ((<$>))

data Rule a b = Rule {
    test :: a -> Bool,
    result :: a -> b
  }

modp :: (Integral a) => a -> a -> Bool
modp n = (== 0) . (`mod` n)

fizz = Rule (modp 3) (const "fizz")
buzz = Rule (modp 5) (const "buzz")
fizzbuzz = Rule (modp 15) (const "fizzbuzz")
number = Rule (const True) (show :: Integer -> String)

tryRule :: Rule a b -> a -> Either b a
tryRule rule input | test rule input = Left $ result rule input
                   | otherwise = Right input

runFizzBuzz n = tryRule fizzbuzz n >>= tryRule buzz >>= tryRule fizz >>= tryRule number

main = mapM_ (either putStrLn undefined) $ runFizzBuzz <$> [1..30]
