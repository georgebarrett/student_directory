def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  
  students = []
  
  name = gets.chomp
  
  while !name.empty? do
    students << {name: name, cohort: :november}

    if students.length > 1
      puts "Now we have #{students.count} students"
    else
      puts "Now we have #{students.count} student"
    end

  name = gets.chomp
  end
  students  
end
  
def print_header
  puts "The students of Villains Academy" 
  puts "-------------"
end
  
def print(students)
  students.each do |x|
    puts "#{x[:name]} (#{x[:cohort]} cohort)"
  end
end
  
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end
  
students = input_students
print_header
print(students)
print_footer(students)