class User_kit
    def initialize(ks1, ks2, ks3, ks4)
        @s1 = Gosu::Sample.new(Sound.find(ks1.sound_id).sound_path)
        @s2 = Gosu::Sample.new(Sound.find(ks2.sound_id).sound_path)
        @s3 = Gosu::Sample.new(Sound.find(ks3.sound_id).sound_path)
        @s4 = Gosu::Sample.new(Sound.find(ks4.sound_id).sound_path)        
    end

    def play_s1
        @s1.play
    end

    def play_s2
        @s2.play
    end

    def play_s3
        @s3.play
    end

    def play_s4
        @s4.play
    end
end

class My_window < Gosu::Window
    def initialize(username, kit_name, ks1, ks2 ,ks3 ,ks4)
        super 640, 480
        self.caption = "#{username}'s #{kit_name}"

        @user_kit = User_kit.new(ks1, ks2, ks3, ks4)
    end

    def update
         if Gosu.button_down? Gosu::KB_A
             @user_kit.play_s1
         end

         if Gosu.button_down? Gosu::KB_D
             @user_kit.play_s2
         end

         if Gosu.button_down? Gosu::KB_H
             @user_kit.play_s3
         end

         if Gosu.button_down? Gosu::KB_K
             @user_kit.play_s4
         end         
         if Gosu.button_down? Gosu::KB_ESCAPE
             close
         end
    end

    def draw

    end
end