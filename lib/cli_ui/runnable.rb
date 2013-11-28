# -*- encoding: utf-8 -*-

require 'gli'
gem 'sysexits' # support mac os x 10.7 ( see sysexits docs )
require 'sysexits'

module CliUI
  module Runnable
    include GLI::App
    include Sysexits
  end
end
