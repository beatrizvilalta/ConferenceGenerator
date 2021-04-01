Given('I have a file with lectures') do
    @file_path = File.join(File.dirname(__FILE__), '../../../proposals.txt')
end
  
When('I read the file') do
    @result = build_lecture_list(@file_path)
end
  
Then('I should have a Lecture List') do
    expect(@result.count).to eq(19)
end
  
Given('I have an empty file') do
    @file_path = File.join(File.dirname(__FILE__), '../../../empty_file.txt')
end
  
Then('I should have an empty list') do    
    expect(@result.empty?).to eq(true)
end