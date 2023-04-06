filename = $PROGRAM_NAME

File.open(filename, "r") do |f|
  f.readlines.each do |line|
    puts line 
  end
end    
