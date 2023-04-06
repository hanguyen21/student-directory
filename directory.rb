require 'csv'
@students = []


def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    name = STDIN.gets.chomp
    while !name.empty? do
        add_student(name, :november)
        puts "Now we have #{@students.count} students"
        name = STDIN.gets.chomp
    end 
end

def add_student(name, cohort)
    @students << {name: name, cohort: cohort.to_sym}
end 

def save_filename
    puts " Enter the filename to save students: "
    filename = STDIN.gets.chomp 
    filename
end 

def load_filename
    puts "Enter the filename to load students:"
    filename = STDIN.gets.chomp
    filename 
end

def load_students(filename)
  if File.exists?(filename)
    CSV.foreach(filename) do |row|
       name, cohort = row
      add_student(name, cohort)
    end
    puts "Loaded #{@students.count} students from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
  end
end 


def interactive_menu
    loop do 
      print_menu
      process_user_input(STDIN.gets.chomp)
    end   
end 

def print_menu
    puts "1. Add students"
    puts "2. Display students"
    puts "3. Save students to file"
    puts "4. Load students from file"
    puts "9. Exit"
end

def show_students 
    print_header
    print_student_list
    print_footer
end

def process_user_input(selection)
    case selection
    when "1"
        input_students
        puts "Students added sucessfully."
    when "2"
        show_students
    when "3"
        filename = save_filename
        save_students(filename)
        puts "Students saved to file sucessfully."
    when "4"
        filename = load_filename
        load_students(filename)
        puts "Students loaded from file sucessfully"
    when "9"
        puts "Exit the program."
        exit
    else
        puts "Invalid input, please try again "
    end
end

def print_header
    puts "The students of the Academy"
    puts "---------------"
end

def print_student_list
    @students.each do |student|
        puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
end

def print_footer
    puts "Total students: #{@students.count}"
end

def save_students(filename)
    CSV.open(filename, "w") do |csv|
    @students.each do |student|
      csv << [student[:name], student[:cohort]]
    end
    end
    puts "Saved #{@students.count} students to #{filename}"
end

def try_load_students
    filename = ARGV.first || filename
    return if filename.nil?
    if File.exist?(filename)
        load_students(filename)
         puts "Loaded #{@students.count} from #{filename}"
    else
        puts "Sorry, #{filename} doesn't exist."
        exit 
    end
end 

try_load_students
interactive_menu
