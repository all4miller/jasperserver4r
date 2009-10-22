require 'logger'

module JasperServer

  # Wrapper class to handle logging to console and/or files.
  class JasperServerLogger

    # Constructor for JasperServerLogger.
    #
    # Args:
    # - filename: the filename for the log file to be written (if log_to_file is
    #   called)
    # - log_to_console: boolean, indicates whether or not to log to the console
    #
    def initialize(filename, log_to_console=false)
      @filename = filename
      @loggers = []
      if log_to_console
        stderr_logger = Logger.new(STDERR)
        stderr_logger.level = Logger::INFO
        @loggers << stderr_logger
      end
    end

    # Enables logging to a file.
    # May be called several times to log to multiple files.
    #
    # Args:
    # - path: where to write the file (defaults to current dir). Path only, do
    #   not provide filename.
    #
    def log_to_file(path='.')
      new_logger = Logger.new(File.join(path, @filename))
      new_logger.level = Logger::INFO
      @loggers << new_logger

      return nil
    end

    # Overload << operator to perform logging.
    def << (text)
      @loggers.each do |logger|
        logger.info text.to_s
      end
    end
  end
end
