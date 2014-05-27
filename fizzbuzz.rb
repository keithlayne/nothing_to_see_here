class FizzBuzz

  def mutator(number)
    fizz(buzz(fizzbuzz(number)))
  end

  def buzzerate(goto)
    (0..goto).map{ |number| mutator(number) }
  end

  def name_or_number(mod, num, name)
    return num unless num.kind_of?(Integer)
    num % mod == 0 ? name : num
  end

  def fizz(num)
    name_or_number(3, num, 'fizz')
  end

  def buzz(num)
    name_or_number(5, num, 'buzz')
  end

  def fizzbuzz(num)
    name_or_number(15, num, 'fizzbuzz')
  end
end
