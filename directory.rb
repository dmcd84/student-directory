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
# and then print them
puts "The students of Villains Academy"
puts "-------------"
students.each do |student|
  puts student
end
# finally, we print the total
print "Overall, we have #{students.count} great students"
