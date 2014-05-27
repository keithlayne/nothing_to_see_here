nothing_to_see_here
===================

So I was talking to my buddy the other day, and he'd had an interview for a Ruby job.
The conversation went something like this:

> *Me*:  What did they ask you?

> *buddy*:  They had me write FizzBuzz.

> Me:  No, really.  What did they ask you?

> buddy:  ...

> Me:  Wow.  Did you punch them in the face before walking out?

> buddy:  ...

> Me:  I don't even know you anymore.


### for reals

I honestly believed (at least hoped) that nobody ever asked the FizzBuzz question in interviews.
I probably sound like a collosal douche, but everyone has heard of it before, right?  In the era
of SO copy 'n paste programmers, there's no way you can expect to learn anything about a 
programmer that way.  

### it gets better....

Being the snarky douche that I am, I immediately sent him a dirty one-liner version of FizzBuzz
via HipChat (I'm so hipster), along with some totally sweet emotions as punctutation.

He replied with his final version from the interview.  It sucked.  I mocked him.

But it wasn't his fault.  The interviewer had taken his simple, correct solution and forced him
to 'refactor' it for great good.  It's not that I don't get the idea - in the real world™, stuff
happens, requirements change, blah coupling blah testing blah OO blah.  BUT IT"S FREAKING FIZZBUZZ!!!11
The analogy to the real world is just too weak.

### and now for something completely awesome

So now I've written what should have been a super-hilarious blog post that no one will ever read in
the form of a README in a random git repo that no one will ever look at.  But then contents of this
repo have pretty much nothing to do with the preceding anecdote.

I started thinking about FizzBuzz and how I guess it could sorta have some marginal pedagogical value.
Wait, did I spell that right?  Prolly not.  There I go, trying to get fancy.  "Fancy" makes me think
think of how ridonculously huge Iggy Azalea's butt is.  Also, I heard on the radio that Megan Fox has
toe thumbs.  Seriously.  Google it.  I digress.

Oh yeah, so FizzBuzz.  In interviews, I guess people ask it to make sure the interviewee is actually
awake.  But I was thinking about what there is to learn from this stupid thing.  A more general
statement of the problem is this:

> Given an input of some type, check to see if it meets some criteria, and if so, return a value of a
possibly different type.  We will call this a 'rule'.  We can have an arbitrary number of rules.  
Also, if none of the rules match, return something else, which potentially depends on the input.
We'll call this the 'default'.

For the classic FizzBuzz, we have these rules (let's call the input `n`, which is some integral type):

* if `n` is divisible by 3, then return 'fizz'
* if `n` is divisible by 5, then return 'buzz'
* if you're still reading this, then I'm shocked
* if `n` is divisible by 15, then return 'fizzbuzz'

And the default:

* return `n`

### but what does it all mean?

I think there are only a couple of ways to screw this up:

* Try to get too fancy and not actually use a rule for the 'fizzbuzz' case.  This totally works for
FizzBuzz, but it assumes a whole lot, and is super-embarrassing to mess up.
* Not recognize that the order of applying the rules is important (especially if you're getting fancy).

So the original awesome statement from above should really include something about forcing an ordering.
Bonus points for getting short-circuit behavior when you're checking the rules.

So all these things add up to a switch statement in your vanilla imperative language.  And if you're
interviewing kids and asking them to solve FizzBuzz (which alone should be grounds for pistol-whipping)
in some imperative language using something other then a switch, you should probably be shot. But there are 
other possibilities...

### enter the dragon

So all this (duh) made me think about Haskell.  I love Haskell, but I haven't had any good excuse to
do something real with it, so I don't know it very well.  Haskell is like the über-hot chick (or dude, whatever)
that lives down the hall.  You've been fantasizing about her for like months or years or something, but you
could never think of an awesome enough excuse to talk to her.  But wait, I'm sure she'd be thrilled to hear
about FizzBuzz!  That's the ticket.  I'm pretty sure Haskell is about to slap me.

Anyways.  My daughter is 5 and she starts like 90% of her sentences with that word.  Probably 30% of her
sentences consist of *only* 'anyways'.  I think she's rubbing off on me.  Anyways, I digress.

Monads.  This seems like a totally righteous way to solve the general FizzBuzz problem.  We can impose ordering
and short-circuit when we have a result.  We can abstract the heck out of it.  Good times.  So that's why this
repo exists.  So I can save my crappy stuff about FizzBuzz.  And maybe learn some more Haskell.  Good times.

### further reading

Look out for my upcoming O'Reilly book on FizzBuzz.  I think it will have a turkey on the cover.




