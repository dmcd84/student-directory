def input_students
  puts "Please enter the details of the students"
  puts "To finish, just hit return twice when presented with new name prompt"
  # create an empty array
  students = []
  puts "Please enter student name"
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    puts "Plesae indicate cohort for student"
    cohort = gets.chomp
    puts "Please enter main hobby of student"
    hobby = gets.chomp
    puts "Please enter country of birth for student"
    country = gets.chomp
    puts "Please enter heigh of student in cm"
    height = gets.chomp
    # add the student hash to the array
    students << {name: name, cohort: cohort, hobbies: hobby, country_of_birth: country, height: height}
    # this is where the new user input for student details needs to go.
    puts "Now we have #{students.count} students"
    puts "Please enter student name"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  x = 1
  while x <= students.count do
    puts "#{x} #{students[x-1][:name]} #{students[x-1][:cohort]} #{students[x-1][:hobbies]} #{students[x-1][:country_of_birth]} #{students[x-1][:height]}cm"
    x += 1
  end
  puts "-- end of list --"
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end
# nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
