def input_students
    puts "Please enter the names and cohorts"
    puts "To finish, just hit return twice"

    students = []
    #Define a default cohort value
    default_cohort = :november

    # Get the name from the user
    puts "Enter the name of the student:"
    name = gets.chomp
    while !name.empty? do
        puts "Enter the cohort of the student: "
        cohort = gets.chomp

        cohort = default_cohort if cohort.empty? || !is_valid_cohort?(cohort)
        cohort = cohort.to_sym
        students << {name: name, cohort: cohort}
        if students.count > 1
            puts "Now we have #{students.count} students" 
        elsif student.count == 1 
            puts "Now we have 1 student"   
        else
            break  
        end

        name = gets.chomp 
    end
    students
end 

def is_valid_cohort?(cohort)
    valid_cohorts = %w[january february march april may june july august september october november december ]
    valid_cohorts.include?(cohort.downcase)
end
def print_header
    puts "The students of the Academy".center(60)
    puts "------------".center(60)
end

def print(students)
    students.each_with_index do |student,index|
        puts "#{index+1}.#{student[:name]} (#{student[:cohort]} cohort)"
    end
end

def group(students)
    cohorts = students.map {|student| student[:cohort]}
    cohorts.each do |cohort|
        puts "Students from the #{cohort} cohort: "
        students.each do |student|
            if student[:cohort] == cohort
                puts "#{student[:name]} (#{student[:cohort]} cohort)"
            end
        end 
        puts "-----------"
    end 
end 


def print_with_while_loop(students)
   index = 0
   while index < students.length
    student = students[index]
    puts "#{index +1}. #{student[:name]} (#{student[:cohort]} cohort, hobbies #{student[:hobbies]}, country #{student[:country]}. )"
    index += 1
   end
end 

def print_initial_names(students, initial)
    initial_names = students.select { |student| student[:name][0].upcase == initial.upcase }
    if initial_names.empty?
        puts "No students found with initial names is #{initial}. "
    else
        puts " Students found with initial character #{initial} :"
        initial_names.each do |student|
            puts "#{student[:name]}".center(60)
        end
    end
end

def print_short_names(students, max_length)
    filter_students = students.select { |student| student[:name].length < max_length }
    
    if filter_students.empty?
        puts "No students found with names shorter than #{max_length}. "    
    else
        puts "Students with names shorter than #{max_length}: "
        filter_students.each do |student|
            puts "#{student[:name]}".center(60)
        end 
    end
end

def print_footer(students)
    if students.count > 1
      puts "Overall, we have #{students.count} great students"
    elsif students.count == 1
      puts "Overal, we have 1 great student"
    else
    end
end

students = input_students
print_header
print(students)
group(students)

initial = "h" 
print_initial_names(students, initial)

max_length = 12
print_short_names(students, max_length)
print_footer(students)
