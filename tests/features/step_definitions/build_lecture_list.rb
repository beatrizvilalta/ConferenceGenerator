Given('I have a file with lectures') do
    @file_path = "proposals.txt"
end
  
When('I read the file') do
    @result = build_lecture_list(@file_path)
end
  
Then('I should have a Lecture List') do
    expect(@result.count).to eql(19)
end
  
Given('I have an empty file') do
    @file_path = "empty_file.txt"
end
  
Then('I should have an empty list') do    
    expect(@result.empty?).to eql(true)
end