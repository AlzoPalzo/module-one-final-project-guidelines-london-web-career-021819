require_relative '../config/environment'
require 'pry'

# class Sound < Gosu::Window
#     def initialize
#         @s1 =Gosu::Sample.new("lib/sounds/Kits/01/Bass.wav")
#         @s2 =Gosu::Sample.new("lib/sounds/Kits/01/BassStab.wav")
#     end

#     def play_sound
#         @sound.play
#     end
# end

# def button_a(id)
#     case id
#     when Gosu::KB_A
#         @sound
#     end
    
# end


# class Play_sounds
#     def initialize
#         @s1 =Gosu::Sample.new("lib/sounds/Kits/01/Bass.wav")
#         @s2 =Gosu::Sample.new("lib/sounds/Kits/01/BassStab.wav")
#     end

#     def play_s1
#         @s1.play
#     end

#     def play_s2
#         @s2.play
#     end
# end

# class My_window < Gosu::Window
#     def initialize
#         super 640, 480
#         self.caption = "Tutorial Game"

#         @play_sounds = Play_sounds.new
#     end

#     def update
#         if Gosu.button_down? Gosu::KB_A
#             @play_sounds.play_s1
#         end

#         if Gosu.button_down? Gosu::KB_S
#             @play_sounds.play_s2
#         end
#     end
    
#     def draw
#     # ...
#     end
# end

# My_window.new.show
# puts "HELLO WORLD"


ali = User.new(name: "Ali")
charlotte = User.new(name: "Charlotte")

kit1 = Kit.new(user_id: ali.id)
kit2 = Kit.new(user_id: charlotte.id)




