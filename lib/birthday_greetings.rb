class BirthdayGreeting

  def initialize employee_repository, email_service
    @employee_repository = employee_repository
    @email_service = email_service
  end

  def send_greetings date
    todays_birthdays = @employee_repository.get_employees_with_birthday date
    todays_birthdays.each do |employee|
      @email_service.send_birthday_email(employee)
    end
  end
end
