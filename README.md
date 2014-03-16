# Speculator

Speculator is a Ruby tool to generate RSpec tests automatically by tracing live/fixture code execution.

The general use case is that you have some code that works as expected within a Rails app or in some sort of integration
test harness or fixture. Speculator will record the execution of that code up to any calls into classes you plan to stub
and then produce a \_spec file that calls your methods using the recorded parameters. Classes specified for stubbing
will have stubs generated appropriately.

## Status

This is all at an early stage. Currently, the package is able to run a test harness in __test/examples/run_example.rb__
and produce a spec for the test class __test/examples/target.rb__. It can also (using the __--dogfood__ option) generate
tests for selected classes/methods within the Speculator codebase.

## TODO (initial)

- Integrate with Rails
- Provide a command line tool to specify testing for a class/method in a Rails web application
- Improve stub handling (for multiple congruent method calls, etc)
- Support use of FactoryGirl in mocking ActiveRecord
- Deal with non-determinacy (updated_at)

## Installation

Add this line to your application's Gemfile:

    gem 'speculator'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install speculator

## Usage

Run the test harness with:
    bundle exec ruby test/examples/run_example.rb \[method\] \[--all\] \[--dogfood\]

__method__ is a method name on Target (__test/examples/target.tb__)
__--all__ generates tests on all methods
__--dogfood__ generates test for internal code

Run the generated example tests with:
    bundle exec rspec test/examples/gen_specs

Run the internal dogfood tests with:
    bundle exec rspec test/gen_specs

TODO: Write proper usage instructions here

## Contributing

1. Fork it ( http://github.com/<my-github-username>/speculator/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Flaming

    gem uninstall speculator

    mail null@example.com <
    How can you even try and make such a thing? Tests should be written before examples, do you here.
    Considered Harmful! Go to the back of the class at once.

    {browser} http://www.youtube.com/watch?v=gx4jn77VKlQ
