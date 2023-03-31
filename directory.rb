
students = [
    {name: "Dr Hanisha Lecter", cohort: :april},
    {name:"Darth Vader", cohort: :april},
    {name:"Elon Musk", cohort: :april},
    {name:"Jonny Dan", cohort: :april},
    {name:"Steven Jonn", cohort: :april}
]
#print them
def print_header
  puts "The students of the Academy"
  puts "-----------"
end

def print(students)
    students.each do |student|
        puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
end 

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

print_header
print(students)
print_footer(students)