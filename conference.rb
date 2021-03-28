# Você está planejando uma grande conferencia de programação e recebeu diversas propostas de palestras, 
# mas você está com problemas para organizá-las de acordo com as restrições de tempo do dia - existem tantas possibilidades! 
# Então, você decide escrever um programa para fazer isso por você.

#     A conferencia tem várias tracks, cada qual tendo uma sessão pela manhã e outra pela tarde.
#     Cada sessão contém várias palestras.
#     Sessões pela manhã começam às 9h e devem terminar às 12h, para o almoço.
#     Sessões pela tarde começam às 13h e devem terminar a tempo de realizar o evento de networking.
#     O evento de networking deve começar depois das 16h, mas antes das 17h.
#     Nenhum dos nomes das palestras possui números.
#     A duração de todas as palestras são fornecidas em minutos ou definidas como lightning (palestras de 5 minutos).
#     Os palestrantes serão bastante pontuais, então não há a necessidade de intervalos entre as palestras.

# TODO:
# 1 - ler arquivo - Done
# 2 - separar o texto e o tempo - in progress
# 3 - botar em uma lista com texto e tempos separados
# 4 - organizar a lista de acordo as sessões


class Lecture

    def initialize(title, duration)
        @title = title
        @duration = duration
    end

    attr_reader :title, :duration
    
end

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

def build_lecture_list(file_path)
    lecture_list = Array.new

    File.foreach(file_path) do |line| 

        lecture = build_lecture(line)

        lecture_list.push(lecture)
    end

    return lecture_list
end


