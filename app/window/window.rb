class User_kit
    def initialize(sp1, sp2 ,sp3, sp4)
        @s1 = Gosu::Sample.new(sp1)
        @s2 = Gosu::Sample.new(sp2)
        @s3 = Gosu::Sample.new(sp3)
        @s4 = Gosu::Sample.new(sp4)
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
    def initialize(username, kit_name, sp1, sp2, sp3, sp4)
        super 640, 480
        self.caption = "#{username}'s #{kit_name}"
        @user_kit = User_kit.new(sp1, sp2, sp3, sp4)
    end

    def update
         if Gosu.button_down? Gosu::KB_A
             @user_kit.play_s1
             sleep(0.2)
         end

         if Gosu.button_down? Gosu::KB_D
             @user_kit.play_s2
             sleep(0.2)
         end

         if Gosu.button_down? Gosu::KB_H
             @user_kit.play_s3
             sleep(0.2)
         end

         if Gosu.button_down? Gosu::KB_K
             @user_kit.play_s4
             sleep(0.2)
         end
         if Gosu.button_down? Gosu::KB_ESCAPE
             close
         end
    end
    def draw   
    end
    def needs_cursor?
        true
    end
end
