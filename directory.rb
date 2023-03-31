
students = [
    "Dr Hanisha Lecter",
    "Darth Vader",
    "Elon Musk",
    "Jonny Dan",
    "Steven Jonn"
]
#print them
def print_header
  puts "The students of the Academy"
  puts "-----------"
end

def print(names)
    names.each do |name|
        puts name 
    end
end 

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

print_header
print(students)
print_footer(students)