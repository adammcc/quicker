# quicker

A simple timing gem for testing ruby code speed

## Installation

To install using Bundler:

```
gem 'quicker', '~> 0.0.4'
```

To manually install:

```
gem install quicker
```

## Basic Usage

This gem can be used to analyze the slow spots in your code. You'll have these three methods to work with:

`start`, `check`, and `finish`

```ruby
class MyClass
  include Quicker

  def my_method
    start

    # ...run some code

    check

    # ...run some code

    finish
  end
end

```

After running the above code, check your logs for the following:


```
----------------------------------------------------
Started
Elapsed time: 0ms
----------------------------------------------------

...logs

----------------------------------------------------
Method: my_method
Elapsed time: 574.9499999999999ms
----------------------------------------------------

...logs

----------------------------------------------------
Finished!
Total elapsed time: 4952.438ms
----------------------------------------------------
```

## Advanced Usage

Add discription text with your `check` methods and a benchmark with your `finish` method

```ruby
# controllers/my_class

class MyClass
  include Quicker

  def my_method
    start

    # ...run some code

    check('A')

    # ...run some code

    check('B')

    # call other method
    MyOtherClass.other_method

    finish(1000) # we want our code to run in 1000ms or less
  end
end

# models/my_class

class MyOtherClass
  extend Quicker

  def self.other_method
    # ...run some code
    check('C')
  end
end

```

After running the above code, check your logs for the following:

```
----------------------------------------------------
Started
Elapsed time: 0ms
----------------------------------------------------

...logs

----------------------------------------------------
A
Method: my_method
Elapsed time: 150.65ms
----------------------------------------------------

...logs

----------------------------------------------------
B
Method: my_method
Elapsed time: 151.529ms
----------------------------------------------------

...logs

----------------------------------------------------
C
Method: other_method
Elapsed time: 3284.048ms
----------------------------------------------------

...logs

----------------------------------------------------
Finished!
Total elapsed time: 3286.149ms
Darn! You missed your goal by 2286.149ms
----------------------------------------------------

```
