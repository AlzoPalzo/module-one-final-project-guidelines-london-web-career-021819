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

end
