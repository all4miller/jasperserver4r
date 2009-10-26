require 'rubygems'
gem 'soap4r', '=1.5.8'
require 'jasperserver4r/reportschedulerservicedriver'
require 'jasperserver4r/jasperserverlogger'

# Main namespace for all the client library's modules and classes.
module JasperServer
  
  # Wrapper class that serves as the main point of access for all the API usage.
  #
  # Holds all the services, as well as login credentials.
  #
  class API
    
    # JasperServerLogger object used for logging SOAP XML
    attr_reader :xml_logger
    
    public
    
    # Constructor for API.
    #
    # Args:
    # - username: Valid JasperServer account username
    # - password: Valid JasperServer account password
    #
    def initialize(username, password)
      @username = username 
      @password = password
      log_to_console = !ENV['JASPERSERVER4R_DEBUG'].nil? &&
      ENV['JASPERSERVER4R_DEBUG'].upcase == 'TRUE'
      @xml_logger = JasperServerLogger.new('soap_xml', log_to_console)
    end
    
    # Obtain an ReportSchedulerService service, given a valid end point.
    #
    # Args:
    # - endpoint_url: Valid endpoint_url
    #
    # Returns:
    # The service wrapper for the intended service.
    #
    def get_report_scheduler_service(endpoint_url = nil)
      driver = JasperServer::ReportSchedulerService::ReportSchedulerInterface.new(endpoint_url)      
      driver.options["protocol.http.basic_auth"] << [endpoint_url, @username, @password]
      driver.wiredump_dev = @xml_logger
      return driver
    end
    
    # Obtain an Repositiry service, given a valid end point.
    #
    # Args:
    # - endpoint_url: Valid endpoint_url
    #
    # Returns:
    # The service wrapper for the intended service.
    #
    def get_repository_service(endpoint_url = nil)
      #TODO impliment repository service 
    end

  end
end
