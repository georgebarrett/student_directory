# using .center
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  students = []

  name = gets.chomp

  while !name.empty? do

    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"

    name = gets.chomp
  end
  students  
end

def print_header
  puts "The students of Villains Academy".center(80) 
  puts "-------------".center(80)
end

def print(students)
  students.each do |x|
    puts "#{x[:name]} (#{x[:cohort]} cohort)".center(80)
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students".center(80)
end

students = input_students
print_header
print(students)
print_footer(students)
