class User_kit
    def initialize(sp1, sp2 ,sp3, sp4, sp5, sp6)
        @s1 = Gosu::Sample.new(sp1)
        @s2 = Gosu::Sample.new(sp2)
        @s3 = Gosu::Sample.new(sp3)
        @s4 = Gosu::Sample.new(sp4)
        @s5 = Gosu::Sample.new(sp5)
        @s6 = Gosu::Sample.new(sp6)
        @image = Gosu::Image.new("lib/Images/Drum_kit.png")
        @x = @y = @angle = 0.0
    end

    def warp(x, y)
        @x, @y = x, y
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

    def play_s5
        @s5.play
    end

    def play_s6
        @s6.play
    end

    def draw
        @image.draw_rot(@x, @y, 1, @angle)
    end
end

class Drum_kick
    attr_reader :x, :y
    def initialize
        @image = Gosu::Image.new("lib/Images/Kick_effect.png")
        @x = @y = @angle = 0.0
    end

    def warp(x, y)
        @x, @y = x, y
    end

    def draw
        @image.draw_rot(@x, @y, 2, @angle)
    end
end


class Drum_hat
    attr_reader :x, :y
    def initialize
        @image = Gosu::Image.new("lib/Images/Crash.png")
        @x = @y = @angle = 0.0
    end

    def warp(x, y)
        @x, @y = x, y
    end

    def draw
        @image.draw_rot(@x, @y, 2, @angle)
    end
end

class Drum_snare
    attr_reader :x, :y
    def initialize
        @image = Gosu::Image.new("lib/Images/Clap.png")
        @x = @y = @angle = 0.0
    end

    def warp(x, y)
        @x, @y = x, y
    end

    def draw
        @image.draw_rot(@x, @y, 2, @angle)
    end
end

class Drum_tom
    attr_reader :x, :y
    def initialize
        @image = Gosu::Image.new("lib/Images/Doo.png")
        @x = @y = @angle = 0.0
    end

    def warp(x, y)
        @x, @y = x, y
    end

    def draw
        @image.draw_rot(@x, @y, 2, @angle)
    end
end

class My_window < Gosu::Window
    def initialize(username, kit_name, sp1, sp2, sp3, sp4, sp5 ,sp6)
        super 640, 480
    
        self.caption = "User: #{username}      Kit: #{kit_name}"
        @background_image = Gosu::Image.new("lib/Images/Drum_background.jpg", :tileable => true)
        @user_kit = User_kit.new(sp1, sp2, sp3, sp4, sp5, sp6)
        @user_kit.warp(350, 350)
        @dkick = false
        @drum_kick = Drum_kick.new
        @drum_kick.warp(440, 370)
        @drum_hat = Drum_hat.new
        @drum_hat.warp(400, 240)
        @dhat = false
        @drum_snare = Drum_snare.new
        @drum_snare.warp(240, 290)
        @dsnare = false
        @drum_tom = Drum_tom.new
        @drum_tom.warp(320, 260)
        @dtom = false
    end

    def update

        if Gosu.button_down? Gosu::KB_A
            @user_kit.play_s1
            @dkick = true

        end

        if Gosu.button_down? Gosu::KB_D
             @user_kit.play_s2
             @dsnare =true
        end

        if Gosu.button_down? Gosu::KB_H
             @user_kit.play_s3
             @dhat = true
        end

        if Gosu.button_down? Gosu::KB_K
             @user_kit.play_s4
        end

        if Gosu.button_down? Gosu::KB_W
             @user_kit.play_s5
             @dtom = true
        end

        if Gosu.button_down? Gosu::KB_U
             @user_kit.play_s6
             @dtom = true
        end

        if Gosu.button_down? Gosu::KB_ESCAPE
             close
        end
    end

    def draw
        @user_kit.draw
        if @dkick == true  
            @drum_kick.draw
        end

        if @dhat == true
            @drum_hat.draw
        end

        if @dsnare == true
            @drum_snare.draw
        end

        if @dtom == true
            @drum_tom.draw
        end

        sleep(0.09)
        @dkick = false
        @dhat = false
        @dsnare = false
        @dtom = false
        @background_image.draw(0, 0, 0) 
    end

    def needs_cursor?
        true
    end
end
