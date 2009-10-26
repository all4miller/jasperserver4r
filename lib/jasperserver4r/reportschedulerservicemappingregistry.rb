require 'jasperserver4r/reportschedulerservice'
require 'soap/mapping'

module JasperServer
  
  module ReportSchedulerService
    
    module DefaultMappingRegistry
      EncodedRegistry = ::SOAP::Mapping::EncodedRegistry.new
      LiteralRegistry = ::SOAP::Mapping::LiteralRegistry.new
      NsWs = "http://www.jasperforge.org/jasperserver/ws"
      
      EncodedRegistry.set(
                          ArrayOf_xsd_long,
                          ::SOAP::SOAPArray,
      ::SOAP::Mapping::EncodedRegistry::TypedArrayFactory,
      { :type => XSD::QName.new("http://www.w3.org/2001/XMLSchema", "long") }
      )
      
      EncodedRegistry.set(
                          ArrayOf_xsd_int,
                          ::SOAP::SOAPArray,
      ::SOAP::Mapping::EncodedRegistry::TypedArrayFactory,
      { :type => XSD::QName.new("http://www.w3.org/2001/XMLSchema", "int") }
      )
      
      EncodedRegistry.register(
    :class => JasperServer::ReportSchedulerService::JobCalendarTrigger,
    :schema_type => XSD::QName.new(NsWs, "JobCalendarTrigger"),
    :schema_basetype => XSD::QName.new(NsWs, "JobTrigger"),
    :schema_element => [
      ["id", ["SOAP::SOAPLong", XSD::QName.new(nil, "id")]],
      ["version", ["SOAP::SOAPInt", XSD::QName.new(nil, "version")]],
      ["timezone", ["SOAP::SOAPString", XSD::QName.new(nil, "timezone")]],
      ["startDate", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "startDate")]],
      ["endDate", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "endDate")]],
      ["minutes", ["SOAP::SOAPString", XSD::QName.new(nil, "minutes")]],
      ["hours", ["SOAP::SOAPString", XSD::QName.new(nil, "hours")]],
      ["daysType", ["JasperServer::ReportSchedulerService::CalendarDaysType", XSD::QName.new(nil, "daysType")]],
      ["weekDays", ["JasperServer::ReportSchedulerService::ArrayOf_xsd_int", XSD::QName.new(nil, "weekDays")]],
      ["monthDays", ["SOAP::SOAPString", XSD::QName.new(nil, "monthDays")]],
      ["months", ["JasperServer::ReportSchedulerService::ArrayOf_xsd_int", XSD::QName.new(nil, "months")]]
      ]
      )
      
      EncodedRegistry.set(
                          ArrayOf_xsd_string,
                          ::SOAP::SOAPArray,
      ::SOAP::Mapping::EncodedRegistry::TypedArrayFactory,
      { :type => XSD::QName.new("http://www.w3.org/2001/XMLSchema", "string") }
      )
      
      EncodedRegistry.register(
    :class => JasperServer::ReportSchedulerService::JobMailNotification,
    :schema_type => XSD::QName.new(NsWs, "JobMailNotification"),
    :schema_element => [
      ["id", ["SOAP::SOAPLong", XSD::QName.new(nil, "id")]],
      ["version", ["SOAP::SOAPInt", XSD::QName.new(nil, "version")]],
      ["toAddresses", ["JasperServer::ReportSchedulerService::ArrayOf_xsd_string", XSD::QName.new(nil, "toAddresses")]],
      ["subject", ["SOAP::SOAPString", XSD::QName.new(nil, "subject")]],
      ["messageText", ["SOAP::SOAPString", XSD::QName.new(nil, "messageText")]],
      ["resultSendType", ["JasperServer::ReportSchedulerService::ResultSendType", XSD::QName.new(nil, "resultSendType")]],
      ["skipEmptyReports", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "skipEmptyReports")]]
      ]
      )
      
      EncodedRegistry.register(
    :class => JasperServer::ReportSchedulerService::JobParameter,
    :schema_type => XSD::QName.new(NsWs, "JobParameter"),
    :schema_element => [
      ["name", ["SOAP::SOAPString", XSD::QName.new(nil, "name")]],
      ["value", ["SOAP::SOAPAnySimpleType", XSD::QName.new(nil, "value")]]
      ]
      )
      
      EncodedRegistry.set(
                          ArrayOfJobParameter,
                          ::SOAP::SOAPArray,
      ::SOAP::Mapping::EncodedRegistry::TypedArrayFactory,
      { :type => XSD::QName.new(NsWs, "JobParameter") }
      )
      
      EncodedRegistry.register(
    :class => JasperServer::ReportSchedulerService::JobRepositoryDestination,
    :schema_type => XSD::QName.new(NsWs, "JobRepositoryDestination"),
    :schema_element => [
      ["id", ["SOAP::SOAPLong", XSD::QName.new(nil, "id")]],
      ["version", ["SOAP::SOAPInt", XSD::QName.new(nil, "version")]],
      ["folderURI", ["SOAP::SOAPString", XSD::QName.new(nil, "folderURI")]],
      ["sequentialFilenames", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "sequentialFilenames")]],
      ["overwriteFiles", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "overwriteFiles")]],
      ["outputDescription", ["SOAP::SOAPString", XSD::QName.new(nil, "outputDescription")]],
      ["timestampPattern", ["SOAP::SOAPString", XSD::QName.new(nil, "timestampPattern")]]
      ]
      )
      
      EncodedRegistry.register(
    :class => JasperServer::ReportSchedulerService::JobSimpleTrigger,
    :schema_type => XSD::QName.new(NsWs, "JobSimpleTrigger"),
    :schema_basetype => XSD::QName.new(NsWs, "JobTrigger"),
    :schema_element => [
      ["id", ["SOAP::SOAPLong", XSD::QName.new(nil, "id")]],
      ["version", ["SOAP::SOAPInt", XSD::QName.new(nil, "version")]],
      ["timezone", ["SOAP::SOAPString", XSD::QName.new(nil, "timezone")]],
      ["startDate", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "startDate")]],
      ["endDate", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "endDate")]],
      ["occurrenceCount", ["SOAP::SOAPInt", XSD::QName.new(nil, "occurrenceCount")]],
      ["recurrenceInterval", ["SOAP::SOAPInt", XSD::QName.new(nil, "recurrenceInterval")]],
      ["recurrenceIntervalUnit", ["JasperServer::ReportSchedulerService::IntervalUnit", XSD::QName.new(nil, "recurrenceIntervalUnit")]]
      ]
      )
      
      EncodedRegistry.register(
    :class => JasperServer::ReportSchedulerService::Job,
    :schema_type => XSD::QName.new(NsWs, "Job"),
    :schema_element => [
      ["id", ["SOAP::SOAPLong", XSD::QName.new(nil, "id")]],
      ["version", ["SOAP::SOAPInt", XSD::QName.new(nil, "version")]],
      ["reportUnitURI", ["SOAP::SOAPString", XSD::QName.new(nil, "reportUnitURI")]],
      ["username", ["SOAP::SOAPString", XSD::QName.new(nil, "username")]],
      ["label", ["SOAP::SOAPString", XSD::QName.new(nil, "label")]],
      ["description", ["SOAP::SOAPString", XSD::QName.new(nil, "description")]],
      ["simpleTrigger", ["JasperServer::ReportSchedulerService::JobSimpleTrigger", XSD::QName.new(nil, "simpleTrigger")]],
      ["calendarTrigger", ["JasperServer::ReportSchedulerService::JobCalendarTrigger", XSD::QName.new(nil, "calendarTrigger")]],
      ["parameters", ["JasperServer::ReportSchedulerService::ArrayOfJobParameter", XSD::QName.new(nil, "parameters")]],
      ["baseOutputFilename", ["SOAP::SOAPString", XSD::QName.new(nil, "baseOutputFilename")]],
      ["outputFormats", ["JasperServer::ReportSchedulerService::ArrayOf_xsd_string", XSD::QName.new(nil, "outputFormats")]],
      ["outputLocale", ["SOAP::SOAPString", XSD::QName.new(nil, "outputLocale")]],
      ["repositoryDestination", ["JasperServer::ReportSchedulerService::JobRepositoryDestination", XSD::QName.new(nil, "repositoryDestination")]],
      ["mailNotification", ["JasperServer::ReportSchedulerService::JobMailNotification", XSD::QName.new(nil, "mailNotification")]]
      ]
      )
      
      EncodedRegistry.register(
    :class => JasperServer::ReportSchedulerService::JobSummary,
    :schema_type => XSD::QName.new(NsWs, "JobSummary"),
    :schema_element => [
      ["id", ["SOAP::SOAPLong", XSD::QName.new(nil, "id")]],
      ["version", ["SOAP::SOAPInt", XSD::QName.new(nil, "version")]],
      ["reportUnitURI", ["SOAP::SOAPString", XSD::QName.new(nil, "reportUnitURI")]],
      ["username", ["SOAP::SOAPString", XSD::QName.new(nil, "username")]],
      ["label", ["SOAP::SOAPString", XSD::QName.new(nil, "label")]],
      ["state", ["JasperServer::ReportSchedulerService::RuntimeJobState", XSD::QName.new(nil, "state")]],
      ["previousFireTime", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "previousFireTime")]],
      ["nextFireTime", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "nextFireTime")]]
      ]
      )
      
      EncodedRegistry.set(
                          ArrayOfJobSummary,
                          ::SOAP::SOAPArray,
      ::SOAP::Mapping::EncodedRegistry::TypedArrayFactory,
      { :type => XSD::QName.new(NsWs, "JobSummary") }
      )
      
      EncodedRegistry.register(
    :class => JasperServer::ReportSchedulerService::IntervalUnit,
    :schema_type => XSD::QName.new(NsWs, "IntervalUnit")
      )
      
      EncodedRegistry.register(
    :class => JasperServer::ReportSchedulerService::CalendarDaysType,
    :schema_type => XSD::QName.new(NsWs, "CalendarDaysType")
      )
      
      EncodedRegistry.register(
    :class => JasperServer::ReportSchedulerService::ResultSendType,
    :schema_type => XSD::QName.new(NsWs, "ResultSendType")
      )
      
      EncodedRegistry.register(
    :class => JasperServer::ReportSchedulerService::RuntimeJobState,
    :schema_type => XSD::QName.new(NsWs, "RuntimeJobState")
      )
      
      LiteralRegistry.register(
    :class => JasperServer::ReportSchedulerService::JobCalendarTrigger,
    :schema_type => XSD::QName.new(NsWs, "JobCalendarTrigger"),
    :schema_basetype => XSD::QName.new(NsWs, "JobTrigger"),
    :schema_element => [
      ["id", ["SOAP::SOAPLong", XSD::QName.new(nil, "id")]],
      ["version", ["SOAP::SOAPInt", XSD::QName.new(nil, "version")]],
      ["timezone", ["SOAP::SOAPString", XSD::QName.new(nil, "timezone")]],
      ["startDate", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "startDate")]],
      ["endDate", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "endDate")]],
      ["minutes", ["SOAP::SOAPString", XSD::QName.new(nil, "minutes")]],
      ["hours", ["SOAP::SOAPString", XSD::QName.new(nil, "hours")]],
      ["daysType", ["JasperServer::ReportSchedulerService::CalendarDaysType", XSD::QName.new(nil, "daysType")]],
      ["weekDays", ["JasperServer::ReportSchedulerService::ArrayOf_xsd_int", XSD::QName.new(nil, "weekDays")]],
      ["monthDays", ["SOAP::SOAPString", XSD::QName.new(nil, "monthDays")]],
      ["months", ["JasperServer::ReportSchedulerService::ArrayOf_xsd_int", XSD::QName.new(nil, "months")]]
      ]
      )
      
      LiteralRegistry.register(
    :class => JasperServer::ReportSchedulerService::JobMailNotification,
    :schema_type => XSD::QName.new(NsWs, "JobMailNotification"),
    :schema_element => [
      ["id", ["SOAP::SOAPLong", XSD::QName.new(nil, "id")]],
      ["version", ["SOAP::SOAPInt", XSD::QName.new(nil, "version")]],
      ["toAddresses", ["JasperServer::ReportSchedulerService::ArrayOf_xsd_string", XSD::QName.new(nil, "toAddresses")]],
      ["subject", ["SOAP::SOAPString", XSD::QName.new(nil, "subject")]],
      ["messageText", ["SOAP::SOAPString", XSD::QName.new(nil, "messageText")]],
      ["resultSendType", ["JasperServer::ReportSchedulerService::ResultSendType", XSD::QName.new(nil, "resultSendType")]],
      ["skipEmptyReports", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "skipEmptyReports")]]
      ]
      )
      
      LiteralRegistry.register(
    :class => JasperServer::ReportSchedulerService::JobParameter,
    :schema_type => XSD::QName.new(NsWs, "JobParameter"),
    :schema_element => [
      ["name", ["SOAP::SOAPString", XSD::QName.new(nil, "name")]],
      ["value", ["SOAP::SOAPAnySimpleType", XSD::QName.new(nil, "value")]]
      ]
      )
      
      LiteralRegistry.register(
    :class => JasperServer::ReportSchedulerService::JobRepositoryDestination,
    :schema_type => XSD::QName.new(NsWs, "JobRepositoryDestination"),
    :schema_element => [
      ["id", ["SOAP::SOAPLong", XSD::QName.new(nil, "id")]],
      ["version", ["SOAP::SOAPInt", XSD::QName.new(nil, "version")]],
      ["folderURI", ["SOAP::SOAPString", XSD::QName.new(nil, "folderURI")]],
      ["sequentialFilenames", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "sequentialFilenames")]],
      ["overwriteFiles", ["SOAP::SOAPBoolean", XSD::QName.new(nil, "overwriteFiles")]],
      ["outputDescription", ["SOAP::SOAPString", XSD::QName.new(nil, "outputDescription")]],
      ["timestampPattern", ["SOAP::SOAPString", XSD::QName.new(nil, "timestampPattern")]]
      ]
      )
      
      LiteralRegistry.register(
    :class => JasperServer::ReportSchedulerService::JobSimpleTrigger,
    :schema_type => XSD::QName.new(NsWs, "JobSimpleTrigger"),
    :schema_basetype => XSD::QName.new(NsWs, "JobTrigger"),
    :schema_element => [
      ["id", ["SOAP::SOAPLong", XSD::QName.new(nil, "id")]],
      ["version", ["SOAP::SOAPInt", XSD::QName.new(nil, "version")]],
      ["timezone", ["SOAP::SOAPString", XSD::QName.new(nil, "timezone")]],
      ["startDate", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "startDate")]],
      ["endDate", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "endDate")]],
      ["occurrenceCount", ["SOAP::SOAPInt", XSD::QName.new(nil, "occurrenceCount")]],
      ["recurrenceInterval", ["SOAP::SOAPInt", XSD::QName.new(nil, "recurrenceInterval")]],
      ["recurrenceIntervalUnit", ["JasperServer::ReportSchedulerService::IntervalUnit", XSD::QName.new(nil, "recurrenceIntervalUnit")]]
      ]
      )
      
      LiteralRegistry.register(
    :class => JasperServer::ReportSchedulerService::Job,
    :schema_type => XSD::QName.new(NsWs, "Job"),
    :schema_element => [
      ["id", ["SOAP::SOAPLong", XSD::QName.new(nil, "id")]],
      ["version", ["SOAP::SOAPInt", XSD::QName.new(nil, "version")]],
      ["reportUnitURI", ["SOAP::SOAPString", XSD::QName.new(nil, "reportUnitURI")]],
      ["username", ["SOAP::SOAPString", XSD::QName.new(nil, "username")]],
      ["label", ["SOAP::SOAPString", XSD::QName.new(nil, "label")]],
      ["description", ["SOAP::SOAPString", XSD::QName.new(nil, "description")]],
      ["simpleTrigger", ["JasperServer::ReportSchedulerService::JobSimpleTrigger", XSD::QName.new(nil, "simpleTrigger")]],
      ["calendarTrigger", ["JasperServer::ReportSchedulerService::JobCalendarTrigger", XSD::QName.new(nil, "calendarTrigger")]],
      ["parameters", ["JasperServer::ReportSchedulerService::ArrayOfJobParameter", XSD::QName.new(nil, "parameters")]],
      ["baseOutputFilename", ["SOAP::SOAPString", XSD::QName.new(nil, "baseOutputFilename")]],
      ["outputFormats", ["JasperServer::ReportSchedulerService::ArrayOf_xsd_string", XSD::QName.new(nil, "outputFormats")]],
      ["outputLocale", ["SOAP::SOAPString", XSD::QName.new(nil, "outputLocale")]],
      ["repositoryDestination", ["JasperServer::ReportSchedulerService::JobRepositoryDestination", XSD::QName.new(nil, "repositoryDestination")]],
      ["mailNotification", ["JasperServer::ReportSchedulerService::JobMailNotification", XSD::QName.new(nil, "mailNotification")]]
      ]
      )
      
      LiteralRegistry.register(
    :class => JasperServer::ReportSchedulerService::JobSummary,
    :schema_type => XSD::QName.new(NsWs, "JobSummary"),
    :schema_element => [
      ["id", ["SOAP::SOAPLong", XSD::QName.new(nil, "id")]],
      ["version", ["SOAP::SOAPInt", XSD::QName.new(nil, "version")]],
      ["reportUnitURI", ["SOAP::SOAPString", XSD::QName.new(nil, "reportUnitURI")]],
      ["username", ["SOAP::SOAPString", XSD::QName.new(nil, "username")]],
      ["label", ["SOAP::SOAPString", XSD::QName.new(nil, "label")]],
      ["state", ["JasperServer::ReportSchedulerService::RuntimeJobState", XSD::QName.new(nil, "state")]],
      ["previousFireTime", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "previousFireTime")]],
      ["nextFireTime", ["SOAP::SOAPDateTime", XSD::QName.new(nil, "nextFireTime")]]
      ]
      )
      
      LiteralRegistry.register(
    :class => JasperServer::ReportSchedulerService::IntervalUnit,
    :schema_type => XSD::QName.new(NsWs, "IntervalUnit")
      )
      
      LiteralRegistry.register(
    :class => JasperServer::ReportSchedulerService::CalendarDaysType,
    :schema_type => XSD::QName.new(NsWs, "CalendarDaysType")
      )
      
      LiteralRegistry.register(
    :class => JasperServer::ReportSchedulerService::ResultSendType,
    :schema_type => XSD::QName.new(NsWs, "ResultSendType")
      )
      
      LiteralRegistry.register(
    :class => JasperServer::ReportSchedulerService::RuntimeJobState,
    :schema_type => XSD::QName.new(NsWs, "RuntimeJobState")
      )
    end
    
  end
  
end
