# Methic

Simple arithmetic implemented by Treetop.

Heavily based on [treetop arithmetic example](https://github.com/cjheath/treetop/blob/master/examples/lambda_calculus/arithmetic.treetop).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'methic'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install methic

## Usage

```ruby
parser = MethicParser.new

parser.parse('0').eval #=> 0
parser.parse('1').eval #=> 1
parser.parse('123').eval #=> 123

parser.parse('x').eval('x' => 0) #=> 0
parser.parse('x').eval('x' => 3) #=> 3
parser.parse('y').eval('y' => 10) #=> 10

parser.parse('x + 5').eval('x' => 5) #=> 10
parser.parse('x - 5').eval('x' => 5) #=> 0
parser.parse('x * 2').eval('x' => 3) #=> 6
parser.parse('x / 2').eval('x' => 6) #=> 3

parser.parse('1 + 2 * 3 + 4').eval #=> 11
parser.parse('5 - 2 - 1').eval #=> 2

parser.parse('(5 + x) * (10 - y)').eval('x' => 0, 'y' => 5) #=> 25

parser.parse('4 == 4').eval #=> true
parser.parse('4 == 3').eval #=> false
```

## Contributing

1. Fork it ( https://github.com/zizkovrb/methic/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
