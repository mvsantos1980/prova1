module ApplicationHelper
  def format_phone(number)
    if(number.length <= 8)
      return number_to_phone number, pattern: /(\d{4})(\d{4})$/
    elsif (number.length == 9)
      return number_to_phone number, pattern: /(\d{5})(\d{4})$/, area_code: false, delimiter: " "
    elsif (number.length >= 11)
      return number_to_phone number, area_code: true, pattern: /(\d{2})(\d{4,5})(\d{4})$/
    end
  end

  def formatar_hora(date)
    date.strftime("%H:%M:%S")
  end
end
