@students = []

def print_menu
  puts
  puts "1. Input the students".center(50)
  puts "2. Show the students".center(50)
  puts "3. Save the list to students.csv".center(50)
  puts "4. Load the list from students.csv".center(50)
  puts "9. Exit".center(50)
  puts
end

def interactive_menu
    loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
  when "1"
    puts "Ok, please input_students".center(50)
    input_students
  when "2"
    puts "Ok, here are the students".center(50)
    output_students
  when "3"
    puts "Ok, saving students".center(50)
    save_students
  when "4"
    puts "Ok, loading students".center(50)
    load_students
  when "9"
    puts "Ok, exiting program".center(50)
    exit #this will cause the program to terminate
  else
    puts "I don't know what you meant, try again".center(50)
  end
end

def add_to_students(name)
  @students << {name: name, cohort: :november}
end

def input_students
  puts "Please enter the names of the students".center(50)
  puts "To finish, just hit return twice".center(50)
  # get the first name
  name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    add_to_students(name)
    puts "Now we have #{@students.count} students".center(50)
    # get another name from the user
    name = STDIN.gets.chomp
  end
  end

def output_students
  print_header
  print_students_list
  print_footer
end

def print_header
  puts "The students of Villains Academy".center(50)
  puts "-------------".center(50)
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)".center(50)
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students".center(50)
end

def save_students
  puts "Which file would you like to save to?"
  filename = STDIN.gets.chomp
  #open the file for writing
  File.open(filename, "w") do |file|
  #iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
end
end

def load_students
  puts "Which file would you like to load?"
  filename = STDIN.gets.chomp
  File.open(filename, "r") do |file|
    file.each do |line|
      name, cohort = line.chomp.split(',')
      add_to_students(name)
    end
  end
end

def try_load_students
  filename = "students.csv"
  return if filename.nil? #get out of the method if it isn't given
  if File.exists?(filename) #if it exists
    load_students
    puts "Loaded #{@students.count} from #{filename}"
  else #if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit #quit the program
  end
end

try_load_students
interactive_menu
