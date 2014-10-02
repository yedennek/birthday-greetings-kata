require 'birthday_greetings'

describe BirthdayGreeting do
  before {
    @employee1 = double(:employee1)
    @employee2 = double(:employee2)

    @date = double(:date)

    @employee_repository = double
    allow(@employee_repository).to receive(:get_employees_with_birthday).with(@date).and_return( [@employee1, @employee2] )

    @email_service = double
    expect(@email_service).to receive(:send_birthday_email).with(@employee1)
    expect(@email_service).to receive(:send_birthday_email).with(@employee2)
  }

  it "should send email to employees whose birthdays are today" do
    birthday_service = BirthdayGreeting.new(@employee_repository, @email_service)

    birthday_service.send_greetings(@date)
  end
end
