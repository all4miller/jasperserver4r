require 'rubygems'
require 'test/unit'
require 'jasperserver4r'
require 'common_utils'

class TestReportScheduler < Test::Unit::TestCase
  
  # Initialize tests
  def setup
    @client = CommonUtils.create_api_object(self)
    
    # Defaults to http://localhost:8080/jasperserver/services/ReportScheduler"
    @scheduler_service = @client.get_report_scheduler_service
    
    @test_report_no_params = {'uri' => '/reports/samples/AllAccounts',  
                     'output_label' => 'AllAccounts', 
                     'output_filename' => 'AllAccounts'}
                     
    @test_report_with_params = {'uri' => '/reports/samples/EmployeeAccounts',  
                     'output_label' => 'EmployeeAccounts', 
                     'output_filename' => 'EmployeeAccounts',
                     'params' => {
                        'name' => 'EmployeeID',
                        'value' => 'matt_id'}}    
    
    @test_jobs = []
  end

  # Delete all jobs created
  def teardown
     @scheduler_service.deleteJobs( @test_jobs ) if !@test_jobs.nil? 
  end
  
  # Test creating a scheduled job with a simple trigger 
  def test_schedule_job_simple_trigger
    # Create a trigger object with simple recurrence
    trigger = JasperServer::ReportSchedulerService::JobSimpleTrigger.new
    trigger.startDate = SOAP::SOAPDateTime.new( "2010-01-01T00:00:00.0000000+02:00" )
    trigger.occurrenceCount = 1
    trigger.recurrenceInterval = 1
    trigger.recurrenceIntervalUnit = JasperServer::ReportSchedulerService::IntervalUnit::WEEK
    
    # Create an mail notification object
    email = JasperServer::ReportSchedulerService::JobMailNotification.new
    email.toAddresses = "all4miller@gmail.com"
    email.subject = "Schedule report execution completed successfully"
    email.messageText = "Schedule report execution completed successfully"
    email.resultSendType = JasperServer::ReportSchedulerService::ResultSendType::SEND_ATTACHMENT
    
    # Create a repository destination object 
    repo_dest = JasperServer::ReportSchedulerService::JobRepositoryDestination.new
    repo_dest.folderURI = '/ContentFiles/pdf'
    repo_dest.sequentialFilenames = false 
    repo_dest.overwriteFiles = true
    
    # Create a job object      
    job = JasperServer::ReportSchedulerService::Job.new
    job.reportUnitURI = @test_report_no_params['uri']
    job.label = @test_report_no_params['output_label']    
    job.baseOutputFilename = @test_report_no_params['output_filename']
    job.outputFormats = ['PDF']
    job.simpleTrigger = trigger
    job.mailNotification = email
    job.repositoryDestination = repo_dest
    
    # Create the schedule on the server 
    job_res = @scheduler_service.scheduleJob( job )
    assert_not_nil( job_res, 'Failed to create schedule with simple recurrence' )    
    @test_jobs << job_res.id if !job_res.nil? 
  end
  
  # Test creating a scheduled job with a calendar trigger 
  def test_schedule_job_calendar_trigger
    # Create a trigger object with calendar recurrence
    trigger = JasperServer::ReportSchedulerService::JobCalendarTrigger.new
    trigger.startDate = SOAP::SOAPDateTime.new("2010-01-01T08:00:00.0000000+02:00")
    trigger.minutes = "0"
    trigger.hours = "8"
    trigger.daysType=JasperServer::ReportSchedulerService::CalendarDaysType::ALL
    trigger.months = [0,1,2,3,4,5,6,7,8,9,10,11]
    
    # Create an mail notification object
    email = JasperServer::ReportSchedulerService::JobMailNotification.new
    email.toAddresses = "all4miller@gmail.com"
    email.subject = "Schedule report execution completed successfully"
    email.messageText = "Schedule report execution completed successfully"
    email.resultSendType = JasperServer::ReportSchedulerService::ResultSendType::SEND_ATTACHMENT
    
    # Create a repository destination object 
    repo_dest = JasperServer::ReportSchedulerService::JobRepositoryDestination.new
    repo_dest.folderURI = '/ContentFiles/pdf'
    repo_dest.sequentialFilenames = false 
    repo_dest.overwriteFiles = true
    
    # Create a job object      
    job = JasperServer::ReportSchedulerService::Job.new
    job.reportUnitURI = @test_report_no_params['uri']
    job.label = @test_report_no_params['output_label']    
    job.baseOutputFilename = @test_report_no_params['output_filename']
    job.outputFormats = ['PDF']
    job.calendarTrigger = trigger
    job.mailNotification = email
    job.repositoryDestination = repo_dest
    
    # Create the schedule on the server 
    job_res = @scheduler_service.scheduleJob( job )    
    assert_not_nil( job_res, 'Failed to create schedule with calendar recurrence' )    
    @test_jobs << job_res.id if !job_res.nil?        
  end
  
  # Test creating a scheduled job with a simple trigger and report params 
  def test_schedule_job_simple_trigger_report_params
    # Create a trigger object with simple recurrence
    trigger = JasperServer::ReportSchedulerService::JobSimpleTrigger.new
    trigger.startDate = SOAP::SOAPDateTime.new( "2010-01-01T00:00:00.0000000+02:00" )
    trigger.occurrenceCount = 1
    trigger.recurrenceInterval = 1
    trigger.recurrenceIntervalUnit = JasperServer::ReportSchedulerService::IntervalUnit::WEEK
    
    # Create an mail notification object
    email = JasperServer::ReportSchedulerService::JobMailNotification.new
    email.toAddresses = "all4miller@gmail.com"
    email.subject = "Schedule report execution completed successfully"
    email.messageText = "Schedule report execution completed successfully"
    email.resultSendType = JasperServer::ReportSchedulerService::ResultSendType::SEND_ATTACHMENT
    
    # Create a repository destination object 
    repo_dest = JasperServer::ReportSchedulerService::JobRepositoryDestination.new
    repo_dest.folderURI = '/ContentFiles/pdf'
    repo_dest.sequentialFilenames = false 
    repo_dest.overwriteFiles = true
    
    # Create a param array object
    params = JasperServer::ReportSchedulerService::ArrayOfJobParameter.new    
    params << JasperServer::ReportSchedulerService::JobParameter.new( @test_report_with_params['params']['name'], @test_report_with_params['params']['value'] )
    
    # Create a job object      
    job = JasperServer::ReportSchedulerService::Job.new
    job.reportUnitURI = @test_report_with_params['uri']
    job.label = @test_report_with_params['output_label']    
    job.baseOutputFilename = @test_report_with_params['output_filename']
    job.outputFormats = ['PDF']
    job.simpleTrigger = trigger
    job.mailNotification = email
    job.repositoryDestination = repo_dest
    job.parameters = params
    
    # Create the schedule on the server 
    job_res = @scheduler_service.scheduleJob( job )
    assert_not_nil( job_res, 'Failed to create schedule with simple recurrence and report params' )
    @test_jobs << job_res.id if !job_res.nil?
  end
  
  
  # Test getting list of scheduled jobs back
  def test_get_all_jobs
    # Create a trigger object with simple recurrence
    trigger = JasperServer::ReportSchedulerService::JobSimpleTrigger.new
    trigger.startDate = SOAP::SOAPDateTime.new( "2010-01-01T00:00:00.0000000+02:00" )
    trigger.occurrenceCount = 1
    trigger.recurrenceInterval = 1
    trigger.recurrenceIntervalUnit = JasperServer::ReportSchedulerService::IntervalUnit::WEEK
    
    # Create an mail notification object
    email = JasperServer::ReportSchedulerService::JobMailNotification.new
    email.toAddresses = "all4miller@gmail.com"
    email.subject = "Schedule report execution completed successfully"
    email.messageText = "Schedule report execution completed successfully"
    email.resultSendType = JasperServer::ReportSchedulerService::ResultSendType::SEND_ATTACHMENT
    
    # Create a repository destination object 
    repo_dest = JasperServer::ReportSchedulerService::JobRepositoryDestination.new
    repo_dest.folderURI = '/ContentFiles/pdf'
    repo_dest.sequentialFilenames = false 
    repo_dest.overwriteFiles = true
    
    # Create a job object      
    job = JasperServer::ReportSchedulerService::Job.new
    job.reportUnitURI = @test_report_no_params['uri']
    job.label = @test_report_no_params['output_label']    
    job.baseOutputFilename = @test_report_no_params['output_filename']
    job.outputFormats = ['PDF']
    job.simpleTrigger = trigger
    job.mailNotification = email
    job.repositoryDestination = repo_dest
    
    # Create the schedule on the server 
    job_res = @scheduler_service.scheduleJob( job )
    
    @test_jobs << job_res.id if !job_res.nil?
    
    array_of_jobs = @scheduler_service.getAllJobs
    assert_not_nil array_of_jobs, 'Failed to retrieve list of jobs' 
    array_of_jobs.each do |job|
      assert_not_nil job, 'Null job returned' 
    end
  end
  
  # Test getting list of scheduled jobs back for specific report
  def test_get_report_jobs
    # Create a trigger object with simple recurrence
    trigger = JasperServer::ReportSchedulerService::JobSimpleTrigger.new
    trigger.startDate = SOAP::SOAPDateTime.new( "2010-01-01T00:00:00.0000000+02:00" )
    trigger.occurrenceCount = 1
    trigger.recurrenceInterval = 1
    trigger.recurrenceIntervalUnit = JasperServer::ReportSchedulerService::IntervalUnit::WEEK
    
    # Create an mail notification object
    email = JasperServer::ReportSchedulerService::JobMailNotification.new
    email.toAddresses = "all4miller@gmail.com"
    email.subject = "Schedule report execution completed successfully"
    email.messageText = "Schedule report execution completed successfully"
    email.resultSendType = JasperServer::ReportSchedulerService::ResultSendType::SEND_ATTACHMENT
    
    # Create a repository destination object 
    repo_dest = JasperServer::ReportSchedulerService::JobRepositoryDestination.new
    repo_dest.folderURI = '/ContentFiles/pdf'
    repo_dest.sequentialFilenames = false 
    repo_dest.overwriteFiles = true
    
    # Create a job object      
    job = JasperServer::ReportSchedulerService::Job.new
    job.reportUnitURI = @test_report_no_params['uri']
    job.label = @test_report_no_params['output_label']    
    job.baseOutputFilename = @test_report_no_params['output_filename']
    job.outputFormats = ['PDF']
    job.simpleTrigger = trigger
    job.mailNotification = email
    job.repositoryDestination = repo_dest
    
    # Create the schedule on the server 
    job_res = @scheduler_service.scheduleJob( job )
    
    @test_jobs << job_res.id if !job_res.nil?
    
    array_of_jobs = @scheduler_service.getReportJobs( @test_report_no_params['uri'])
    assert_not_nil array_of_jobs, 'Failed to retrieve report jobs'
    array_of_jobs.each do |job|
      assert_not_nil job, 'Null job returned' 
    end
  end 
  
  # Test getting an existing scheduled job
  def test_get_job
    # Create a trigger object with simple recurrence
    trigger = JasperServer::ReportSchedulerService::JobSimpleTrigger.new
    trigger.startDate = SOAP::SOAPDateTime.new( "2010-01-01T00:00:00.0000000+02:00" )
    trigger.occurrenceCount = 1
    trigger.recurrenceInterval = 1
    trigger.recurrenceIntervalUnit = JasperServer::ReportSchedulerService::IntervalUnit::WEEK
    
    # Create an mail notification object
    email = JasperServer::ReportSchedulerService::JobMailNotification.new
    email.toAddresses = "all4miller@gmail.com"
    email.subject = "Schedule report execution completed successfully"
    email.messageText = "Schedule report execution completed successfully"
    email.resultSendType = JasperServer::ReportSchedulerService::ResultSendType::SEND_ATTACHMENT
    
    # Create a repository destination object 
    repo_dest = JasperServer::ReportSchedulerService::JobRepositoryDestination.new
    repo_dest.folderURI = '/ContentFiles/pdf'
    repo_dest.sequentialFilenames = false 
    repo_dest.overwriteFiles = true
    
    # Create a job object      
    job = JasperServer::ReportSchedulerService::Job.new
    job.reportUnitURI = @test_report_no_params['uri']
    job.label = @test_report_no_params['output_label']    
    job.baseOutputFilename = @test_report_no_params['output_filename']
    job.outputFormats = ['PDF']
    job.simpleTrigger = trigger
    job.mailNotification = email
    job.repositoryDestination = repo_dest
    
    # Create the schedule on the server 
    job_res = @scheduler_service.scheduleJob( job )
    
    @test_jobs << job_res.id if !job_res.nil?
    
    # Fetch job by id      
    job = @scheduler_service.getJob( job_res.id )
    
    # Did we get anythign back
    assert_not_nil( job, 'Failed to retrieve existing job' )
    assert_instance_of( JasperServer::ReportSchedulerService::Job, job,
      'Failed to retrieve existing job' )    
  end
  
  # Test updating an existing scheduled job
  def test_update_job     
    # Create a trigger object with simple recurrence
    trigger = JasperServer::ReportSchedulerService::JobSimpleTrigger.new
    trigger.startDate = SOAP::SOAPDateTime.new( "2010-01-01T00:00:00.0000000+02:00" )
    trigger.occurrenceCount = 1
    trigger.recurrenceInterval = 1
    trigger.recurrenceIntervalUnit = JasperServer::ReportSchedulerService::IntervalUnit::WEEK
    
    # Create an mail notification object
    email = JasperServer::ReportSchedulerService::JobMailNotification.new
    email.toAddresses = "all4miller@gmail.com"
    email.subject = "Schedule report execution completed successfully"
    email.messageText = "Schedule report execution completed successfully"
    email.resultSendType = JasperServer::ReportSchedulerService::ResultSendType::SEND_ATTACHMENT
    
    # Create a repository destination object 
    repo_dest = JasperServer::ReportSchedulerService::JobRepositoryDestination.new
    repo_dest.folderURI = '/ContentFiles/pdf'
    repo_dest.sequentialFilenames = false 
    repo_dest.overwriteFiles = true
    
    # Create a job object      
    job = JasperServer::ReportSchedulerService::Job.new
    job.reportUnitURI = @test_report_no_params['uri']
    job.label = @test_report_no_params['output_label']    
    job.baseOutputFilename = @test_report_no_params['output_filename']
    job.outputFormats = ['PDF']
    job.simpleTrigger = trigger
    job.mailNotification = email
    job.repositoryDestination = repo_dest
    
    # Create the schedule on the server 
    job_res = @scheduler_service.scheduleJob( job )
    
    @test_jobs << job_res.id if !job_res.nil?
    
    # Update job values
    job_res.label << ' updated params'
    job_res.outputFormats = ['XLS']
    job_res.simpleTrigger.recurrenceIntervalUnit = JasperServer::ReportSchedulerService::IntervalUnit::DAY
    job_res.mailNotification.resultSendType = JasperServer::ReportSchedulerService::ResultSendType::SEND_ATTACHMENT
    
    # Persist the updated job
    updated_job = @scheduler_service.updateJob( job_res )
    
    assert_not_nil( updated_job, 'Failed to update the existing job' )
    assert_instance_of( JasperServer::ReportSchedulerService::Job, updated_job,
      'Failed to update the existing job' )    
  end   
  
  # Test deleting a single scheduled job  
  def test_delete_job     
    # Create a trigger object with simple recurrence
    trigger = JasperServer::ReportSchedulerService::JobSimpleTrigger.new
    trigger.startDate = SOAP::SOAPDateTime.new( "2010-01-01T00:00:00.0000000+02:00" )
    trigger.occurrenceCount = 1
    trigger.recurrenceInterval = 1
    trigger.recurrenceIntervalUnit = JasperServer::ReportSchedulerService::IntervalUnit::WEEK
    
    # Create an mail notification object
    email = JasperServer::ReportSchedulerService::JobMailNotification.new
    email.toAddresses = "all4miller@gmail.com"
    email.subject = "Schedule report execution completed successfully"
    email.messageText = "Schedule report execution completed successfully"
    email.resultSendType = JasperServer::ReportSchedulerService::ResultSendType::SEND_ATTACHMENT
    
    # Create a repository destination object 
    repo_dest = JasperServer::ReportSchedulerService::JobRepositoryDestination.new
    repo_dest.folderURI = '/ContentFiles/pdf'
    repo_dest.sequentialFilenames = false 
    repo_dest.overwriteFiles = true
    
    # Create a job object      
    job = JasperServer::ReportSchedulerService::Job.new
    job.reportUnitURI = @test_report_no_params['uri']
    job.label = @test_report_no_params['output_label']    
    job.baseOutputFilename = @test_report_no_params['output_filename']
    job.outputFormats = ['PDF']
    job.simpleTrigger = trigger
    job.mailNotification = email
    job.repositoryDestination = repo_dest
    
    # Create the schedule on the server 
    job_res = @scheduler_service.scheduleJob( job )
    
    # Delete the schedule on the server
    assert_nothing_raised do
      @scheduler_service.deleteJob( job_res.id )
    end
  end   
  
  # Test deleting multiple jobs scheduled job  
  def test_delete_jobs
    jobs = []
    2.times do
      # Create a trigger object with simple recurrence
      trigger = JasperServer::ReportSchedulerService::JobSimpleTrigger.new
      trigger.startDate = SOAP::SOAPDateTime.new( "2010-01-01T00:00:00.0000000+02:00" )
      trigger.occurrenceCount = 1
      trigger.recurrenceInterval = 1
      trigger.recurrenceIntervalUnit = JasperServer::ReportSchedulerService::IntervalUnit::WEEK
      
      # Create an mail notification object
      email = JasperServer::ReportSchedulerService::JobMailNotification.new
      email.toAddresses = "all4miller@gmail.com"
      email.subject = "Schedule report execution completed successfully"
      email.messageText = "Schedule report execution completed successfully"
      email.resultSendType = JasperServer::ReportSchedulerService::ResultSendType::SEND_ATTACHMENT
      
      # Create a repository destination object 
      repo_dest = JasperServer::ReportSchedulerService::JobRepositoryDestination.new
      repo_dest.folderURI = '/ContentFiles/pdf'
      repo_dest.sequentialFilenames = false 
      repo_dest.overwriteFiles = true
      
      # Create a job object      
      job = JasperServer::ReportSchedulerService::Job.new
      job.reportUnitURI = @test_report_no_params['uri']
      job.label = @test_report_no_params['output_label']    
      job.baseOutputFilename = @test_report_no_params['output_filename']
      job.outputFormats = ['PDF']
      job.simpleTrigger = trigger
      job.mailNotification = email
      job.repositoryDestination = repo_dest
      
      # Create the schedule on the server 
      job_res = @scheduler_service.scheduleJob( job )
      jobs << job_res.id if !job_res.nil?
    end
    
    # Delete the schedule on the server
    assert_nothing_raised do
      @scheduler_service.deleteJobs( jobs )
    end
  end     
  
end
