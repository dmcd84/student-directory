require 'csv'
@students = [] # an empty array accessible to all methods

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    add_student_info(name, :november)
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = STDIN.gets.chomp
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def add_student_info(name, cohort)
  @students << {name: name, cohort: :november}
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to a new file"
  puts "4. Load the list from existing file"
  puts "9. Exit" # 9 because we'll be adding more items
end

def show_students
  print_header
  print_student_list
  print_footer
end

def process(selection)
  case selection
  when "1"
    puts "Success! Option 1 selected."
    input_students
  when "2"
    puts "Success! Option 2 selected."
    show_students
  when "3"
    puts "Success! Option 3 selected."
    save_students
  when "4"
    puts "Success! Option 4 selected."
    load_students
  when "9"
    puts "Success! Option 9 selected - exiting program. Goodbye. "
    exit # this will cause the program to terminate
  else
    puts "I don't know what you meant, try again"
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def try_load_students
  filename = ARGV.first # first arguement in the command line
  if filename.nil? # get out of the method if it isn't given
    filename = "students.csv"
  end
  if File.exists?(filename) # if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

def load_students(filename = file_name)
  File.open(filename, "r") do |file|
    CSV.foreach(file) do |row|
    name, cohort = row
    add_student_info(name, cohort)
  end
  end
end

def save_students
  # open the file for writing
  file_name
  File.open(@filename, "w") do |file|
  # iterate over the array of students
  @students.each do |student|
    CSV.open(@filename, "a+") do |csv|
      puts student
      student << [student[:name], student[:cohort]]
    end
    end
  end
end

def file_name
  puts "What is the name of the file?"
  @filename = STDIN.gets.chomp
end

try_load_students
interactive_menu
