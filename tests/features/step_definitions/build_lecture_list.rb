Given('I have a {string}') do |exmaple_line|
    @line = exmaple_line
end

When('I separate it by title and duration') do
    @lecture = build_lecture(@line)
end

Then('I should have a lecture with the right {string} and {int}') do |string, int|
    expect(@lecture.title).to eql(string)
    expect(@lecture.duration).to eql(int)
end

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