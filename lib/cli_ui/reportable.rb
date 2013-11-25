# -*- encoding: utf-8 -*-

require 'command_line_reporter'
require 'highline'

module CliUI

  # Handle application reports
  module Reportable
    include CommandLineReporter

    # HighLine::SystemExtensions.terminal_size # [columns, lines]
    CommandLineReporter::DEFAULTS[:width] = HighLine::SystemExtensions.terminal_size[0]
    CommandLineReporter::DEFAULTS[:align] = 'left'
    CommandLineReporter::DEFAULTS[:formatter] = 'nested'

    # All CommandLineReporter methods are rubymagically included :) WOOT!

  end
end
