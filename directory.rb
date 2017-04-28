def input_students
  puts "Please enter the details of the students"
  puts "To finish, just hit return twice when presented with new name prompt"
  # create an empty array
  students = []
  temp = []
  puts "Please enter student name"
  # get the first name
  name = gets.capitalize.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    temp = []
    puts "Please indicate cohort for student using first three characters of month."
    cohort = gets.downcase.chomp
    cohort = "UNKNOWN" if cohort.empty?
    puts "Please enter main hobby of student"
    hobby = gets.downcase.chomp
    hobby = "UNKNOWN" if hobby.empty?
    puts "Please enter country of birth for student"
    country = gets.downcase.chomp
    country = "UNKNOWN" if country.empty?
    puts "Please enter heigh of student in cm"
    height = gets.chomp
    height = "UNKNOWN" if height.empty?
    temp << {name: name, cohort: cohort, hobbies: hobby, country_of_birth: country, height: height}
    p temp
    puts "Please check if details are correct. If so, press 'y' if not press 'n'"
    check = gets.chomp
      if check == "y"
    # add the student hash to the array
      students << {name: name, cohort: cohort, hobbies: hobby, country_of_birth: country, height: height}
      end
    # this is where the new user input for student details needs to go.
    puts "Now we have #{students.count} students"
    puts "Please enter student name"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  return students
end

def print_by_cohort(students)
  cohort_sort = []
  puts "Which cohort would you like to see? (Please type only first three characters.)"
  cohort_to_find = gets.downcase.chomp
  students.select do |student|
    if student[:cohort] == cohort_to_find
      cohort_sort << student
    end
  end
  return cohort_sort
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  count = 1
  spacing = 50
  while count <= students.count do
    puts "#{count} #{students[count-1][:name]} #{students[count-1][:cohort]}".center(spacing)
    puts "#{students[count-1][:hobbies]}".center(spacing+25)
    puts "#{students[count-1][:country_of_birth]}".center(spacing+30)
    puts "#{students[count-1][:height]}cm".center(spacing+35)
    count += 1
  end
  puts "-- end of list --"
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end
# nothing happens until we call the methods
students = input_students
print_header
students = print_by_cohort(students)
print(students)
print_footer(students)
