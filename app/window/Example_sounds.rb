class Example_sounds < Gosu::Window

    def self.play_examples(sound)
        sounds = Sound.where('sound_path LIKE ?', '%' + sound + '%').all
        sounds.each_with_index do |example, index|
            s1 = Gosu::Sample.new(example.sound_path)
            puts "Playing #{sound} #{index + 1}"
            sleep(0.3)
            s1.play
            sleep(0.7)
        end  
    end

    def self.all_sounds_test
        sounds = Sound.all
        puts(sounds.length)
        while true
            c = gets.chomp.to_i
            s1 = Gosu::Sample.new(sounds[c].sound_path)
            puts(sounds[c].sound_path)
            sleep(0.4)
            s1.play
            sleep(0.8)
        end
    end
end