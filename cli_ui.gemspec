# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cli_ui/version'

Gem::Specification.new do |spec|
  spec.name          = "cli_ui"
  spec.version       = CliUI::VERSION
  spec.authors       = ["Edoardo Tenani"]
  spec.email         = ["edoardo.tenani@gmail.com"]
  spec.description   = %q{With CliUI you can create Cli UI in an easy and clean way. It includes 2 greats gems ( for which CliUI act as a proxy, enhancing them but not getting in your way) and adds a enhanced logger.}
  spec.summary       = %q{A gem that makes easy to create Command LIne User Interfaces ( CliUI )}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  
  spec.add_runtime_dependency "command_line_reporter"
  spec.add_runtime_dependency "highline"
  spec.add_runtime_dependency "gli"
end
