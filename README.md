# CliUI

**DEPRECATED**: Please have a look at the beautiful [tty toolkit](https://piotrmurach.github.io/tty/)

CliUI is a gem that makes easy to create Command line User Interfaces ( Cli UI )

With CliUI you can create UI for command line application in an easy and clean way, using a set of standard gems.
It includes other greats gems ( for which CUI act as a proxy, enhancing them but not getting in your way) and adds a enhanced logger.

## Gems included

Actually CliUI ships with:

- [Command Line Reporter](https://github.com/wbailey/command_line_reporter)
- [Highline](https://github.com/JEG2/highline)
- [Gli](http://davetron5000.github.io/gli/)
- [Sysexits](https://github.com/ged/sysexits)

This gems are "proxyed" by CliUI, but you can always include them directly in your file avoiding the enhancements provided. CliUI would like to be a starting point for cli applications, but doesn't want to get in your way if your prefer using only parts of it.

## Installation

Add this line to your application's Gemfile:

    gem 'cli_ui'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cli_ui

## Usage

There are 4 utilities available:

- **CliUI::Loggable**  
  An enhanced logger which is built upon `Logger`. Brutally easy to configure and use.  
  To use it simply `include CliUI::Loggable` in your class and start to use the `logger` object ( which is an instance of the `Logger` class ). You will have one logger for each class you use `CliUI::Loggable` ( thanks to ruby magic! ).  
  You can configure the log level and the log path using: 

    - `CliUI::Loggable.log_path` ( default : "/tmp/cui-logs/#{Time.now}.log" )
    - `CliUI::Loggable.level` ( default : Logger::INFO )

- **CliUI::Questionable**  
  Interact with your user in a beautiful way.  
  This is a proxy for the Highline gem. Please refer to their documentation!
- **CliUI::Reportable**  
  Sometime is hard to report progress to user in an easy easy. Command Line Reporter is a gem wich really makes it smoother.  
  This is a proxy for this gem! Please refer to their documentation!
- **CliUI::Runnable**  
  A cli application must have a tool to handle cli arguments in an easy way. I choose Gli, because is damn easy to implement for little projects. I've no doubt that a solution like Thor can be more accurate for larger and complex projects, but for clean and little applications is perfect.  
  It also includes Sysexits gem, useful for exiting using standard BSDish error codes!
  This is a proxy for this gem! Please refer to their documentation!

So to use this is your application simply `include` them in your Class, Module or executable and you're ok! :)



## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
