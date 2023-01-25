def input_students
  cohort_months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    puts "Please enter the names of the students"
    puts "To finish, just hit the return twice"
    students =[]     # create an empty array
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
    students << {name: name, cohort: cohort, country: country, hobby: hobby}
    # if statement to print student singular when just 1 student, plural when >1 
    if students.count == 1 
      puts "Now we have #{students.count} student"
    else
      puts "Now we have #{students.count} students"
    end
    puts "Enter another name (or hit enter when you're done): "
    #puts "name",name
    name= gets.chomp
  end
  # return the array of students
  students
end


def print_header
  puts "The students of Villains Academy".center(20)
  puts "-------------".center(20)
end

#Pass hash through of name and cohort
def print(students)
  students.each_with_index do |student, index|
   puts "#{(index +1)}. #{student[:name]}, #{student[:country]} (#{student[:cohort]} cohort) favourite hobby is #{student[:hobby]}"
  end
end



def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end
#nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)

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

# 9) Right now if we have only one student, the user will see a 
# message "Now we have 1 students", whereas it should be "Now we have 
# 1 student". How can you fix it so that it used singular form when 
# appropriate and plural form otherwise? - DONE

# 10) Alternative to chomp() 

# 11) Input file and error check
# Done - file is ruby_fix.rb