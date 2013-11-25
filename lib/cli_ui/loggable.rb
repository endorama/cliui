# -*- encoding: utf-8 -*-

require 'logger'

module CliUI

  # Handle application log
  module Loggable
    
    # @!attribute [r] loggers
    #   Hash of available loggers ( one for class in which logger is invoked )
    @loggers = {}
    # @!attribute [rw] log_path
    #   Path in which log files are saved
    @log_path = "/tmp/cui-logs/#{Time.now}.log"
    # @!attribute [rw] level
    #   Log level. See Ruby Logger class for available levels ( http://www.ruby-doc.org/stdlib-2.0.0/libdoc/logger/rdoc/Logger.html )
    @level = Logger::INFO

    # Global, memoized, lazy initialized instance of a logger
    #
    # This is the magical bit that gets mixed into your classes. Respond to Logger function.
    # 
    # @return [Object] an instance of the logger class
    def logger
      classname = (self.is_a? Module) ? self : self.class.name
      @logger ||= Loggable.logger_for(classname)
    end

    class << self
      # @!attribute [rw] level
      #   Log output level. Can be one of Logger::DEBUG, Logger::INFO, Logger::WARN, Logger::ERROR
      # @!attribute [rw] log_path
      #   Path in which log files are saved ( default STDOUT )
      attr_accessor :level, :log_path
      
      # Return the logger for a specific Class. If the instance is not found, creates it.
      #
      # @param classname [String] the name of the class for which a logger instance must be retrieved
      # @return [Object] the instance of the logger class for the specified Class
      def logger_for(classname)
        @loggers[classname] ||= configure_logger_for(classname)
      end

      # Create and configure a logger for the specified Class
      #
      # @param classname [String] the name of the class for which a logger instance must be retrieved
      # @return [Object] the instance of the logger class for the specified Class
      def configure_logger_for(classname)
        # handle case in which log path does not exists
        begin
          logger = Logger.new(@log_path)
        rescue Errno::ENOENT
          FileUtils.mkdir_p File.dirname @log_path
          retry
        end

        logger.progname = classname
        logger.level = @level
        logger.formatter = proc { |severity, datetime, progname, msg|
          case severity
          when 'DEBUG'
            spaciator = "    *"
            after_space = ""
          when 'INFO'
            spaciator = "   **"
            after_space = " "
          when 'WARN'
            spaciator = "  ***"
            after_space = " "
          when 'ERROR'
            spaciator = " ****"
            after_space = ""
          when 'FATAL'
            spaciator = "*****"
            after_space = ""
          else
            spaciator = "     "
            after_space = ""
          end

          formatted_output = " #{spaciator} [#{severity}]#{after_space} [#{datetime}] -- #{msg} { #{progname} }\n"
          formatted_output
        }
        logger
      end
    end
  end
end
