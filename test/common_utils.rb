require 'rubygems'
require 'test/unit'
require 'jasperserver4r'

module CommonUtils

  def self.create_api_object(test)
    client = JasperServer::API.new( "jasperadmin", "jasperadmin" )
    test. assert_instance_of( JasperServer::API, client, 
        'ERROR: Failed to create JasperServer::API instance' )        
    return client
  end
end

