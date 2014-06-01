-- so, the title is horribly misleading.
-- I totally feel like I'm doing it wrong :(

import Control.Monad (mapM_)
import Control.Applicative ((<$>))

type Predicate a = a -> Bool

data Rule b a = Rule {
    test :: Predicate a,
    result :: a -> b
  }

rule p r = tryRule $ Rule p r where
  tryRule rule input | test rule input = Left $ result rule input
                     | otherwise = Right input

modp n = (== 0) . (`mod` n)

fizz = rule (modp 3) (const "fizz")
buzz = rule (modp 5) (const "buzz")
fizzbuzz = rule (modp 15) (const "fizzbuzz")
number = rule (const True) (show :: Integer -> String)

runFizzBuzz n = fizzbuzz n >>= buzz >>= fizz >>= number

main = mapM_ (either putStrLn undefined) $ runFizzBuzz <$> [1..30]
