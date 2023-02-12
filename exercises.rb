@students = [] # an empty array accessible to all methods

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to a csv file"
  puts "4. Load the list from a csv file"
  puts "9. Exit" # 9 because we'll be adding more items
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
    input_students
  when "2"
    show_students
  when "9"
    exit # this will cause the program to terminate
  when "3"
    save_students
  when "4"
    load_students
  else
    puts "I don't know what you meant, try again"
  end
end

def add_student(name, cohort)
  @students << {name: name, cohort: cohort}
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    #@students << {name: name, cohort: :november}
    add_student(name, :november)
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = STDIN.gets.chomp
  end
end

def show_students
  print_header
  print_student_list
  print_footer
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
  # Ask the user which file they would like to use to save the students?
  puts "Please enter an existing filename which you would like to save the students to: "
  file_request = STDIN.gets.chomp 
  # Loop to check if file exists on the directory, if not, ask the user for a different existing file.
  file_exists = File.exists?(file_request)
  if file_exists == true
    file_open = File.open(file_request, "w")
  else
    puts "This file doesn't exist, please enter a file which already exists."
    file_request
    file_open
  end
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file_open.puts csv_line
  end
  puts "Students have been saved to #{file_request}"
  file_open.close
end

def load_students
  puts "Enter your filename (or press enter to use the default students.csv)"
  provided_filename = STDIN.gets.chomp
  if !provided_filename.empty?
    filename = provided_filename
  else 
    filename = "students.csv"
  end
  if @students.empty?
    file = File.open(filename, "r")
    file.readlines.each do |line|
       name, cohort = line.chomp.split(',')
      add_student(name, cohort.to_sym)
    end
    file.close
    puts "Loaded up #{filename}"
    puts @students
  else
    puts "Loaded up #{filename}"
    puts @students
    return
  end
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  return if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename) # if it exists
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

try_load_students
interactive_menu