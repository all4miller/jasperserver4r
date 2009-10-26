require 'jasperserver4r/reportschedulerservice'
require 'jasperserver4r/reportschedulerservicemappingregistry'
require 'soap/rpc/driver'

module JasperServer
  module ReportSchedulerService
    
    class ReportSchedulerInterface < ::SOAP::RPC::Driver
      DefaultEndpointUrl = "http://localhost:8080/jasperserver/services/ReportScheduler"
      NsWs = "http://www.jasperforge.org/jasperserver/ws"
      
      Methods = [
      [ XSD::QName.new(NsWs, "deleteJob"),
      "",
      "deleteJob",
      [ ["in", "id", ["::SOAP::SOAPLong"]] ],
      { :request_style =>  :rpc, :request_use =>  :encoded,
        :response_style => :rpc, :response_use => :encoded,
        :faults => {} }
      ],
      [ XSD::QName.new(NsWs, "deleteJobs"),
      "",
      "deleteJobs",
      [ ["in", "ids", ["JasperServer::ReportSchedulerService::ArrayOf_xsd_long", "http://www.jasperforge.org/jasperserver/ws", "ArrayOf_xsd_long"]] ],
      { :request_style =>  :rpc, :request_use =>  :encoded,
        :response_style => :rpc, :response_use => :encoded,
        :faults => {} }
      ],
      [ XSD::QName.new(NsWs, "getJob"),
      "",
      "getJob",
      [ ["in", "id", ["::SOAP::SOAPLong"]],
      ["retval", "getJobReturn", ["JasperServer::ReportSchedulerService::Job", "http://www.jasperforge.org/jasperserver/ws", "Job"]] ],
      { :request_style =>  :rpc, :request_use =>  :encoded,
        :response_style => :rpc, :response_use => :encoded,
        :faults => {} }
      ],
      [ XSD::QName.new(NsWs, "scheduleJob"),
      "",
      "scheduleJob",
      [ ["in", "job", ["Job", "http://www.jasperforge.org/jasperserver/ws", "Job"]],
      ["retval", "scheduleJobReturn", ["JasperServer::ReportSchedulerService::Job", "http://www.jasperforge.org/jasperserver/ws", "Job"]] ],
      { :request_style =>  :rpc, :request_use =>  :encoded,
        :response_style => :rpc, :response_use => :encoded,
        :faults => {} }
      ],
      [ XSD::QName.new(NsWs, "updateJob"),
      "",
      "updateJob",
      [ ["in", "job", ["Job", "http://www.jasperforge.org/jasperserver/ws", "Job"]],
      ["retval", "updateJobReturn", ["JasperServer::ReportSchedulerService::Job", "http://www.jasperforge.org/jasperserver/ws", "Job"]] ],
      { :request_style =>  :rpc, :request_use =>  :encoded,
        :response_style => :rpc, :response_use => :encoded,
        :faults => {} }
      ],
      [ XSD::QName.new(NsWs, "getAllJobs"),
      "",
      "getAllJobs",
      [ ["retval", "getAllJobsReturn", ["JasperServer::ReportSchedulerService::ArrayOfJobSummary", "http://www.jasperforge.org/jasperserver/ws", "ArrayOfJobSummary"]] ],
      { :request_style =>  :rpc, :request_use =>  :encoded,
        :response_style => :rpc, :response_use => :encoded,
        :faults => {} }
      ],
      [ XSD::QName.new(NsWs, "getReportJobs"),
      "",
      "getReportJobs",
      [ ["in", "reportURI", ["::SOAP::SOAPString"]],
      ["retval", "getReportJobsReturn", ["JasperServer::ReportSchedulerService::ArrayOfJobSummary", "http://www.jasperforge.org/jasperserver/ws", "ArrayOfJobSummary"]] ],
      { :request_style =>  :rpc, :request_use =>  :encoded,
        :response_style => :rpc, :response_use => :encoded,
        :faults => {} }
      ]
      ]
      
      def initialize(endpoint_url = nil)
        endpoint_url ||= DefaultEndpointUrl
        super(endpoint_url, nil)
        self.mapping_registry = JasperServer::ReportSchedulerService::DefaultMappingRegistry::EncodedRegistry
        self.literal_mapping_registry = JasperServer::ReportSchedulerService::DefaultMappingRegistry::LiteralRegistry
        init_methods
      end
      
      private
      
      def init_methods
        Methods.each do |definitions|
          opt = definitions.last
          if opt[:request_style] == :document
            add_document_operation(*definitions)
          else
            add_rpc_operation(*definitions)
            qname = definitions[0]
            name = definitions[2]
            if qname.name != name and qname.name.capitalize == name.capitalize
              ::SOAP::Mapping.define_singleton_method(self, qname.name) do |*arg|
                __send__(name, *arg)
              end
            end
          end
        end
      end
    end
    
  end
end
