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
  students = []
  user_input = gets.chop
  while !user_input.empty? do
    name, cohort = user_input.split(", ")
    cohort = cohort.capitalize
    if name == ""
      puts "Please add a name or a default will be added"
      name = gets.chop
      if name == ""
        name = "John Doe"
      end
      cohort = months[cohort]
      students << {name: name, cohort: cohort}
    elsif cohort == nil
      puts "Please add a cohort or a default will be provided"
      month = gets.chop.capitalize
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
    if students.count == 1
      puts "Now we have #{students.count} student"
    else
      puts "Now we have #{students.count} students"
    end
    user_input = gets.chop
  end
    return students
  end

def print(students)
  sorted_by_cohort = {}
  students.each do |person|
    cohort = person[:cohort]
    name = person[:name]
    if sorted_by_cohort[cohort] == nil
      sorted_by_cohort[cohort] = []
    end
  sorted_by_cohort[cohort].push(name)
  end
  puts "Which cohort do you want to look at?"
  user_cohort = gets.chop.capitalize
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
  cohort_pick = months[user_cohort]
  puts "The students of Villains Academy".center(50)
  puts "-------------".center(50)
  sorted_by_cohort[cohort_pick].each do |student|
      puts "#{student}".center(50)
    end
end

def print_footer(names)
  if names.count == 1
    puts "Overall, we have #{names.count} great student.".center(50)
  else
  puts "Overall, we have #{names.count} great students".center(50)
  end
end

students = input_students
print(students)
print_footer(students)

puts students
