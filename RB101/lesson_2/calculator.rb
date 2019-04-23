# Requirements
# 1. Asks for two numbers
# 2. Asks for the type of operation to perform: add, subtract, multiply or divide
# 3. Displays the result

def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  num.to_i != 0
end

def operation_to_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

# initialize variables
name = ''
num1 = ''
num2 = ''

prompt('Welcome to Calculator! Please enter your name: ')
# name loop
  loop do
    name = gets.chomp
    if name.empty?
      prompt('Please enter a valid name')
    else
      break
    end
  end
prompt("Hello, #{name}!")

# main loop
loop do
  
  # first number input loop
  loop do
  prompt('Please enter the first number: ')
  num1 = gets.chomp

    if valid_number?(num1)
      break
    else
      prompt("Hmm...that doesn't look like a valid number")
    end
  end

  # second number input loop
  loop do 
  prompt('Please enter the second number: ')
  num2 = gets.chomp

    if valid_number?(num2)
      break
    else
      prompt("Hmm...that doesn't look like a valid number")
    end
  end

  operator_prompt = <<-MSG
  What would you like to do?
    1) add
    2) subtract
    3) multiply
    4) divide
  MSG
  prompt(operator_prompt)

  operator = ''
  
  loop do
    operator = gets.chomp

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt('You must choose 1, 2, 3 or 4')
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers...")

  result =  case operator
            when '1'
              num1.to_i + num2.to_i
            when '2'
              num1.to_i - num2.to_i
            when '3'
              num1.to_i * num2.to_i
            when '4'
              num1.to_f / num2.to_f
  end

  prompt("The result is #{result}")

  prompt('Do you want to perform another calculation? (Y to calculate again)')
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')

end

prompt('Thank you for using calculator!')