require 'xsd/qname'

module JasperServer
  module ReportSchedulerService     
      
    # JobTrigger
    # - id - SOAP::SOAPLong
    # - version - SOAP::SOAPInt
    # - timezone - SOAP::SOAPString
    # - startDate - SOAP::SOAPDateTime
    # - endDate - SOAP::SOAPDateTime
    class JobTrigger
      attr_accessor :id
      attr_accessor :version
      attr_accessor :timezone
      attr_accessor :startDate
      attr_accessor :endDate
      
      def initialize(id = nil, version = nil, timezone = nil, startDate = nil, endDate = nil)
        @id = id
        @version = version
        @timezone = timezone
        @startDate = startDate
        @endDate = endDate
      end
    end
    
    # {http://www.jasperforge.org/jasperserver/ws}JobCalendarTrigger
    #   id - SOAP::SOAPLong
    #   version - SOAP::SOAPInt
    #   timezone - SOAP::SOAPString
    #   startDate - SOAP::SOAPDateTime
    #   endDate - SOAP::SOAPDateTime
    #   minutes - SOAP::SOAPString
    #   hours - SOAP::SOAPString
    #   daysType - CalendarDaysType
    #   weekDays - ArrayOf_xsd_int
    #   monthDays - SOAP::SOAPString
    #   months - ArrayOf_xsd_int
    class JobCalendarTrigger < JobTrigger
      attr_accessor :id
      attr_accessor :version
      attr_accessor :timezone
      attr_accessor :startDate
      attr_accessor :endDate
      attr_accessor :minutes
      attr_accessor :hours
      attr_accessor :daysType
      attr_accessor :weekDays
      attr_accessor :monthDays
      attr_accessor :months
      
      def initialize(id = nil, version = nil, timezone = nil, startDate = nil, endDate = nil, minutes = nil, hours = nil, daysType = nil, weekDays = nil, monthDays = nil, months = nil)
        @id = id
        @version = version
        @timezone = timezone
        @startDate = startDate
        @endDate = endDate
        @minutes = minutes
        @hours = hours
        @daysType = daysType
        @weekDays = weekDays
        @monthDays = monthDays
        @months = months
      end
    end
    
    # {http://www.jasperforge.org/jasperserver/ws}JobSimpleTrigger
    #   id - SOAP::SOAPLong
    #   version - SOAP::SOAPInt
    #   timezone - SOAP::SOAPString
    #   startDate - SOAP::SOAPDateTime
    #   endDate - SOAP::SOAPDateTime
    #   occurrenceCount - SOAP::SOAPInt
    #   recurrenceInterval - SOAP::SOAPInt
    #   recurrenceIntervalUnit - IntervalUnit
    class JobSimpleTrigger < JobTrigger
      attr_accessor :id
      attr_accessor :version
      attr_accessor :timezone
      attr_accessor :startDate
      attr_accessor :endDate
      attr_accessor :occurrenceCount
      attr_accessor :recurrenceInterval
      attr_accessor :recurrenceIntervalUnit
      
      def initialize(id = nil, version = nil, timezone = nil, startDate = nil, endDate = nil, occurrenceCount = nil, recurrenceInterval = nil, recurrenceIntervalUnit = nil)
        @id = id
        @version = version
        @timezone = timezone
        @startDate = startDate
        @endDate = endDate
        @occurrenceCount = occurrenceCount
        @recurrenceInterval = recurrenceInterval
        @recurrenceIntervalUnit = recurrenceIntervalUnit
      end
    end
    
    # {http://www.jasperforge.org/jasperserver/ws}JobMailNotification
    #   id - SOAP::SOAPLong
    #   version - SOAP::SOAPInt
    #   toAddresses - ArrayOf_xsd_string
    #   subject - SOAP::SOAPString
    #   messageText - SOAP::SOAPString
    #   resultSendType - ResultSendType
    #   skipEmptyReports - SOAP::SOAPBoolean
    class JobMailNotification
      attr_accessor :id
      attr_accessor :version
      attr_accessor :toAddresses
      attr_accessor :subject
      attr_accessor :messageText
      attr_accessor :resultSendType
      attr_accessor :skipEmptyReports
      
      def initialize(id = nil, version = nil, toAddresses = nil, subject = nil, messageText = nil, resultSendType = nil, skipEmptyReports = nil)
        @id = id
        @version = version
        @toAddresses = toAddresses
        @subject = subject
        @messageText = messageText
        @resultSendType = resultSendType
        @skipEmptyReports = skipEmptyReports
      end
    end
    
    # {http://www.jasperforge.org/jasperserver/ws}JobParameter
    #   name - SOAP::SOAPString
    #   value - (any)
    class JobParameter
      attr_accessor :name
      attr_accessor :value
      
      def initialize(name = nil, value = nil)
        @name = name
        @value = value
      end
    end
    
    # {http://www.jasperforge.org/jasperserver/ws}JobRepositoryDestination
    #   id - SOAP::SOAPLong
    #   version - SOAP::SOAPInt
    #   folderURI - SOAP::SOAPString
    #   sequentialFilenames - SOAP::SOAPBoolean
    #   overwriteFiles - SOAP::SOAPBoolean
    #   outputDescription - SOAP::SOAPString
    #   timestampPattern - SOAP::SOAPString
    class JobRepositoryDestination
      attr_accessor :id
      attr_accessor :version
      attr_accessor :folderURI
      attr_accessor :sequentialFilenames
      attr_accessor :overwriteFiles
      attr_accessor :outputDescription
      attr_accessor :timestampPattern
      
      def initialize(id = nil, version = nil, folderURI = nil, sequentialFilenames = nil, overwriteFiles = nil, outputDescription = nil, timestampPattern = nil)
        @id = id
        @version = version
        @folderURI = folderURI
        @sequentialFilenames = sequentialFilenames
        @overwriteFiles = overwriteFiles
        @outputDescription = outputDescription
        @timestampPattern = timestampPattern
      end
    end
    
    # {http://www.jasperforge.org/jasperserver/ws}Job
    #   id - SOAP::SOAPLong
    #   version - SOAP::SOAPInt
    #   reportUnitURI - SOAP::SOAPString
    #   username - SOAP::SOAPString
    #   label - SOAP::SOAPString
    #   description - SOAP::SOAPString
    #   simpleTrigger - JobSimpleTrigger
    #   calendarTrigger - JobCalendarTrigger
    #   parameters - ArrayOfJobParameter
    #   baseOutputFilename - SOAP::SOAPString
    #   outputFormats - ArrayOf_xsd_string
    #   outputLocale - SOAP::SOAPString
    #   repositoryDestination - JobRepositoryDestination
    #   mailNotification - JobMailNotification
    class Job
      attr_accessor :id
      attr_accessor :version
      attr_accessor :reportUnitURI
      attr_accessor :username
      attr_accessor :label
      attr_accessor :description
      attr_accessor :simpleTrigger
      attr_accessor :calendarTrigger
      attr_accessor :parameters
      attr_accessor :baseOutputFilename
      attr_accessor :outputFormats
      attr_accessor :outputLocale
      attr_accessor :repositoryDestination
      attr_accessor :mailNotification
      
      def initialize(id = nil, version = nil, reportUnitURI = nil, username = nil, label = nil, description = nil, simpleTrigger = nil, calendarTrigger = nil, parameters = nil, baseOutputFilename = nil, outputFormats = nil, outputLocale = nil, repositoryDestination = nil, mailNotification = nil)
        @id = id
        @version = version
        @reportUnitURI = reportUnitURI
        @username = username
        @label = label
        @description = description
        @simpleTrigger = simpleTrigger
        @calendarTrigger = calendarTrigger
        @parameters = parameters
        @baseOutputFilename = baseOutputFilename
        @outputFormats = outputFormats
        @outputLocale = outputLocale
        @repositoryDestination = repositoryDestination
        @mailNotification = mailNotification
      end
    end
    
    # {http://www.jasperforge.org/jasperserver/ws}JobSummary
    #   id - SOAP::SOAPLong
    #   version - SOAP::SOAPInt
    #   reportUnitURI - SOAP::SOAPString
    #   username - SOAP::SOAPString
    #   label - SOAP::SOAPString
    #   state - RuntimeJobState
    #   previousFireTime - SOAP::SOAPDateTime
    #   nextFireTime - SOAP::SOAPDateTime
    class JobSummary
      attr_accessor :id
      attr_accessor :version
      attr_accessor :reportUnitURI
      attr_accessor :username
      attr_accessor :label
      attr_accessor :state
      attr_accessor :previousFireTime
      attr_accessor :nextFireTime
      
      def initialize(id = nil, version = nil, reportUnitURI = nil, username = nil, label = nil, state = nil, previousFireTime = nil, nextFireTime = nil)
        @id = id
        @version = version
        @reportUnitURI = reportUnitURI
        @username = username
        @label = label
        @state = state
        @previousFireTime = previousFireTime
        @nextFireTime = nextFireTime
      end
    end
    
    # {http://www.jasperforge.org/jasperserver/ws}ArrayOf_xsd_long
    class ArrayOf_xsd_long < ::Array
    end
    
    # {http://www.jasperforge.org/jasperserver/ws}ArrayOf_xsd_int
    class ArrayOf_xsd_int < ::Array
    end
    
    # {http://www.jasperforge.org/jasperserver/ws}ArrayOf_xsd_string
    class ArrayOf_xsd_string < ::Array
    end
    
    # {http://www.jasperforge.org/jasperserver/ws}ArrayOfJobParameter
    class ArrayOfJobParameter < ::Array
    end
    
    # {http://www.jasperforge.org/jasperserver/ws}ArrayOfJobSummary
    class ArrayOfJobSummary < ::Array
    end
    
    # {http://www.jasperforge.org/jasperserver/ws}IntervalUnit
    class IntervalUnit < ::String
      DAY = IntervalUnit.new("DAY")
      HOUR = IntervalUnit.new("HOUR")
      MINUTE = IntervalUnit.new("MINUTE")
      WEEK = IntervalUnit.new("WEEK")
    end
    
    # {http://www.jasperforge.org/jasperserver/ws}CalendarDaysType
    class CalendarDaysType < ::String
      ALL = CalendarDaysType.new("ALL")
      MONTH = CalendarDaysType.new("MONTH")
      WEEK = CalendarDaysType.new("WEEK")
    end
    
    # {http://www.jasperforge.org/jasperserver/ws}ResultSendType
    class ResultSendType < ::String
      SEND = ResultSendType.new("SEND")
      SEND_ATTACHMENT = ResultSendType.new("SEND_ATTACHMENT")
    end
    
    # {http://www.jasperforge.org/jasperserver/ws}RuntimeJobState
    class RuntimeJobState < ::String
      COMPLETE = RuntimeJobState.new("COMPLETE")
      ERROR = RuntimeJobState.new("ERROR")
      EXECUTING = RuntimeJobState.new("EXECUTING")
      NORMAL = RuntimeJobState.new("NORMAL")
      PAUSED = RuntimeJobState.new("PAUSED")
      UNKNOWN = RuntimeJobState.new("UNKNOWN")
    end      

    # getAllJobs
    class GetAllJobs #:nodoc: all
      def initialize
      end
    end
  
  end
end
