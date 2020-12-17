def input_students
  months = {
    "January" => :January,
    "February" => :February,
    "March" => :March,
    "April" => :April,
    "May" => :May,
    "June" => :June,
    "July" => :July,
    "August" => :August,
    "September" => :September,
    "October" => :October,
    "November" => :November,
    "December" => :December
}
  puts "Please enter the names of the students and their cohort separated by a comma"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first input
  user_input = gets.chomp
  # while the user_input is not empty, repeat this code
  while !user_input.empty? do
    #split the user_input into name and cohort
    name, cohort = user_input.split(", ")
    if name == ""
      puts "Please add a name or a default will be added".center(50)
      name = gets.chomp
      if name == ""
        name = "John Doe"
      end
      cohort = months[cohort]
      students << {name: name, cohort: cohort}
    elsif cohort == nil
      puts "Please add a cohort or a default will be provided".center(50)
      month = gets.chomp.capitalize
      cohort = months[month]
      if cohort == nil
        cohort = months["November"]
      end
      students << {name: name, cohort: cohort}
    else
      cohort = cohort.capitalize
      cohort = months[cohort]
      students << {name: name, cohort: cohort}
    end

    puts "Now we have #{students.count} students".center(50)
    # get another name from the user
    user_input = gets.chomp
  end
    #return the array of students
    students
  end

def print_header
  puts "The students of Villains Academy".center(50)
  puts "-------------".center(50)
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} is joining #{student[:cohort]} cohort".center(50)
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students".center(50)
end

students = input_students
print_header
print(students)
print_footer(students)
