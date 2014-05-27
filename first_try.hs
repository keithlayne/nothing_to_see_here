import Control.Monad (mapM_)
import System.Environment (getArgs)

data Chain a b  = Continue b | Done a
  deriving (Show, Eq)

instance Monad (Chain a) where
  return = Continue
  Done d >>= _ = Done d
  Continue c >>= k = k c

result :: Chain a b -> a
result (Done d)  = d
result (Continue _)  = undefined

data FizzBuzz = Fizz | Buzz | FizzBuzz | Plain Int
  deriving (Show, Eq)

fizz :: Int -> Chain FizzBuzz Int
fizz n | n `mod` 3 == 0 = Done Fizz
       | otherwise = Continue n

buzz :: Int -> Chain FizzBuzz Int
buzz n | n `mod` 5 == 0 = Done Buzz
       | otherwise = Continue n

fizzbuzz :: Int -> Chain FizzBuzz Int
fizzbuzz n | n `mod` 15 == 0 = Done FizzBuzz
           | otherwise = Continue n

plain :: Int -> Chain FizzBuzz Int
plain = Done . Plain

runFizzBuzz :: Int -> Chain FizzBuzz Int
runFizzBuzz n = return n >>= fizzbuzz >>= buzz >>= fizz >>= plain

main :: IO ()
main = do
  args <- getArgs
  let [first, last] = map read args :: [Int]
  mapM_ (putStrLn . show . result . runFizzBuzz) [first..last]
