def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit the return twice"
    students =[]     # create an empty array
    name = gets.chomp # get the first name
    while !name.empty? do # while name is NOT empty, repeat this code
      puts "Please enter what country you are from: "
      country = gets.chomp
      puts "What is your most favourite hobby?"
      hobby = gets.chomp
      students << {name: name, cohort: :november, country: country, hobby: hobby}
        puts "Now we have #{students.count} students"
      puts "Enter another name: "  
      name = gets.chomp
    end
    # return the array of students
    students
end


def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

#Pass hash through of name and cohort
def print(students)
    students.each_with_index do |student, index|
     puts "#{index +1}. #{student[:name]}, #{student[:country]} (#{student[:cohort]} cohort) favourite hobby is #{student[:hobby]}"
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