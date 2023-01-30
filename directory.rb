@students = [] # an empty array accessible to all methods

def input_students
  cohort_months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    puts "Please enter the names of the students"
    puts "To finish, just hit the return twice"
    name = gets.chomp
  while !name.empty? do # while name is NOT empty, repeat this code
    puts "What cohort month are you in?"
    cohort = gets.chomp
    # if cohort is empty, return undefined
    if cohort.empty?
      cohort = "Undefined"
    end
    # need to lowercase cohort and cohort_months to be able to see if the cohort input matches the months and no typos
    downcase_cohorts = cohort_months.map {|x| x.downcase}
    cohort_input_downcase = cohort.downcase
    unless downcase_cohorts.include?(cohort_input_downcase)
      puts "Please check your cohort value and enter a full month (EG: November)"
      cohort = gets.chomp
    end
    # ask what country and favourite hobby
    puts "Please enter what country you are from: "
    country = gets.chomp
    puts "What is your most favourite hobby?"
    hobby = gets.chomp
    # push the inputs to the students array using << and symbols name: name,
    @students << {name: name, cohort: cohort, country: country, hobby: hobby}
    # if statement to print student singular when just 1 student, plural when >1 
    puts @students.count == 1 ? "Now we have #{@students.count} student" : "Now we have #{@students.count} students"
    puts "Enter another name (or hit enter when you're done): "
    #puts "name",name
    name= gets.chomp
  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

# Refactor the interactive menu
# Extract the print menu code on its own method

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "9. Exit"
end

# Extract the code that prints the students into a method
def show_students
  print_header
  print_student_list
  # We had this before as print(students) but as student is global vairable, we don't need to call as a parameter
  # instead of just leaving it as print, we can rename it to print_students_list
  print_footer
end

def save_students
  # open file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students to convert hash into an array
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    # Once we have an array, we can now use the join to convert into string
    csv_line = student_data.join(",")
    # file.puts allows us to write using puts to the file
    file.puts csv_line
  end
  file.close
end


# Extract the case selection into new method
def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
  end
end

def print_header
  puts "The students of Villains Academy".center(20)
  puts "-------------".center(20)
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

# Print footer
def print_footer
  puts "Overall, we have #{@students.count} great students"
end

interactive_menu

# students = input_students
# If there are not any students, print no users inputted, otherwise continue printing
# if students.count == 0
 # puts "No users inputted"
#else
#  print_header
#  print(students)
#  print_footer(students)
#end

# Exercises

# 1) Modify the program to print a number before each name of student. 
# EG: 1. Dr. Hannibal Lecter (hint: each_with_index())

# 2) Modify your program to only print students whos name begins
# with a specific letter
#def print(students)
#    students.each {|x| puts x if x[:name].start_with? 'A'}
#end

# 3) Modify your program to only print the students whose
# name is shorter than 12 characters.

#def print(students)
#    students.each {|x| puts x if x[:name].length < 12}
#

# 4) Rewrite the each() method that prints all students using 
# while or until control flow methods.

#def print_while(students)
  # iteration around the students array
 # puts "Displaying students using a WHILE"
 # index = 0
 # while index < students.count do
 #   puts "#{index+1}. #{students[index][:name]} (#{students[index][:cohort]} cohort)"
 #   index += 1
 # end
 # puts
#end

# 5) Add in input for hobby and country

# 6) Research how center works and use it to align code
# It did not work on certain strings such as the print footer?

# 7) Input_students cohort is hard-coded (November). How to make it ask for name
#and cohort.
# What if one of the values is empty? (Can you supply a default value?)
# Input is a string, how to convert to a symbol
# What if the user makes a typo? - DONE

# 8)
# Once you complete the previous exercise, change the way the users 
# are displayed: print them grouped by cohorts. To do this, you'll 
# need to get a list of all existing cohorts (the map() method may 
# be useful but it's not the only option), iterate over it and only 
# print the students from that cohort.


# Pass hash through name and cohort - but group by cohort (exercise 8)
#def print(students))
  # We pass students parameter which takes the input_students
  # grouped_students variable lets us get cohort value first
#  grouped_students = students.group_by{|student| student[:cohort]}
  # use above variable to loop through the cohort element of the grouped_students
 # grouped_students.each do |cohort, students|
  #  puts "Students in the #{cohort} cohort:"
    # inner loop loops through the student element of the grouped students 
   # students.each do |student|
    #  puts student[:name]
   # end
  #end
#end

# 9) Right now if we have only one student, the user will see a 
# message "Now we have 1 students", whereas it should be "Now we have 
# 1 student". How can you fix it so that it used singular form when 
# appropriate and plural form otherwise? - DONE

# 10) Alternative to chomp() 

# 11) Input file and error check
# Done - file is ruby_fix.rb

# 12) If a user doesn't enter students - it will print empty list
# Use if statement to print list if there was one student at least there