@students = [] # an empty array accessible to all methods

def input_students
  puts "Please enter the details of the students"
  puts "To finish, just hit return twice when presented with new name prompt"
  # create an empty array
  @students = []
  temp = []
  puts "Please enter student name"
  # get the first name
  name = gets.capitalize.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    temp = []
    puts "Please indicate cohort for student using first three characters of month."
    cohort = gets.downcase.strip
    cohort = "UNKNOWN" if cohort.empty?
    puts "Please enter main hobby of student"
    hobby = gets.downcase.strip
    hobby = "UNKNOWN" if hobby.empty?
    puts "Please enter country of birth for student"
    country = gets.downcase.strip
    country = "UNKNOWN" if country.empty?
    puts "Please enter heigh of student in cm"
    height = gets.strip
    height = "UNKNOWN" if height.empty?
    temp << {name: name, cohort: cohort, hobbies: hobby, country_of_birth: country, height: height}
    p temp
    puts "Please check if details are correct. If so, press 'y' if not press 'n'"
    check = gets.strip
      if check == "y"
    # add the student hash to the array
      @students << {name: name, cohort: cohort, hobbies: hobby, country_of_birth: country, height: height}
      end
    # this is where the new user input for student details needs to go.
    puts "Now we have #{@students.count} students"
    puts "Please enter student name"
    # get another name from the user
    name = gets.strip
  end
  # return the array of students
  return @students
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_all
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  if @students.count == 1
    puts "Overall, we have #{@students.count} great student"
  else
    puts "Overall, we have #{@students.count} great students"
  end
end

def print_by_cohort
  cohort_sort = []
  puts "Which cohort would you like to see? (Please type only first three characters.)"
  cohort_to_find = gets.downcase.strip
  @students.select do |student|
    if student[:cohort] == cohort_to_find
      cohort_sort << student
    end
  end
  return cohort_sort
end

def print_students_list
  count = 1
  spacing = 50
  while count <= @students.count do
    puts "#{count} #{@students[count-1][:name]} #{@students[count-1][:cohort]}".center(spacing)
    puts "#{@students[count-1][:hobbies]}".center(spacing+25)
    puts "#{@students[count-1][:country_of_birth]}".center(spacing+30)
    puts "#{@students[count-1][:height]}cm".center(spacing+35)
    count += 1
  end
  puts "-- end of list --"
end

# nothing happens until we call the methods
interactive_menu
