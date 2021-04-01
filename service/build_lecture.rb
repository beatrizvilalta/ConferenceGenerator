module BuildLecture
    
    def build_lecture_list(file_path)
        lecture_list = Array.new
    
        File.foreach(file_path) do |line| 
    
            lecture = build_lecture(line)
    
            lecture_list.push(lecture)
        end
    
        return lecture_list
    end

    private
    def build_lecture(line)

        if line.include? "lightning"
            line.sub!("lightning", "5min")
        end

        splittig = line.split(/(\d+)(?=\s*min)/) 
        title = splittig[0].strip!
        duration = splittig[1].to_i
    
        lecture = Lecture.new(title, duration)
    
        return lecture
    end
end