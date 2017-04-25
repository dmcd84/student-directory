student_count = 11
# Let's put all students into an array
students = [
  "Dr. Hannibal Lecter",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLArge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Kruger",
  "Joffery Baratheon",
  "Norman Bates"
]
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(names)
  name.each do |name|
    puts name
  end
end

def print_footer(names)
  puts "Overall, we have #{students.count} great students"
end
# nothing happens until we call the methods
print_header
print(students)
print_footer(students)
