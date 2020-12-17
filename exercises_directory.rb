def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  while !name.empty? do
    puts "Add a hobby"
    hobby = gets.chomp
    puts "Add height"
    height = gets.chomp
    puts "Add country of birth"
    country_of_birth = gets.chomp
    students << {name: name, hobby: hobby, height: height,
      COB: country_of_birth, cohort: :november}
    puts "Now we have #{students.count} students"
    puts "Please add another student if needed"
    name = gets.chomp
  end
    students
  end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  counter = 0
  while counter < students.length
  students.each do |student|
    counter += 1
    puts "#{student[:name]}, born in #{student[:COB]}, is #{student[:height]} and enjoys #{student[:hobby]}. They are joining the #{student[:cohort]} cohort."
  end
end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
