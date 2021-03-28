Given('I have a {string}') do |exmaple_line|
    @line = exmaple_line
end

When('I separate it by title and duration') do
    @lecture = buildLecture(@line)
end

Then('I should have a lecture with the right {string} and {int}') do |string, int|
    expect(@lecture.title).to eql(string)
    expect(@lecture.duration).to eql(int)
end