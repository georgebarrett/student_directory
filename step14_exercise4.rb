@students = []

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = gets.chomp 
  while !name.empty? do   
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"  
    name = gets.chomp
  end
  puts "Your students have been added"
end

def interactive_menu
  loop do
    print_menu
    user_options(gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to student.csv"
  puts "4. To load the student.csv file"
  puts "9. Exit" 
end

def show_students
  print_header
  print_student_list
  print_footer
end

def user_options(selection)
  case selection
  when "1"
    puts ""
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit 
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

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  puts "The students have been saved to students.csv"
  file.close 
end

def load_students(filename = "students.csv")
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(",")
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

def find_file
  filename = ARGV.first
  return if filename.nil?
  if File.exist?(filename)
    load_students(filename)
    puts "Loaded #{students.count} from #{filename}"
  else
    puts "Sorry #{filename} does not exist"
    exit
  end
end

interactive_menu