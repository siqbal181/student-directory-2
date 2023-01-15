def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit the return twice"
    # create an empty array
    students =[]
    # get the first name
    name = gets.chomp
    # while the name is NOT empty, repeat this code
    while !name.empty? do
        students << {name: name, cohort: :november}
        puts "Now we have #{students.count} students"
        # get another name from the user
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
    students.each do |student|
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
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