require 'birthday_greetings'

describe BirthdayGreeting do  
  before {
    @employee_repository = double
    allow(@employee_repository).to receive(:get_emails_of_employees_with_birthday).and_return( {"the.hulk@shield.org" => "The"} )
    
    @email_service = double
    expect(@email_service).to receive(:send_birthday_email).with("the.hulk@shield.org", "The")
  }
  
  it "should send email to employee whose birthday is today" do
    birthday_service = BirthdayGreeting.new(@employee_repository, @email_service) 

    birthday_service.send_greetings(Date.today)
  end
end
