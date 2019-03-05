require_relative '../config/environment'
require 'pry'

def greeting
  puts "Hello, please enter your name"
  print ":"
end

def get_username
  name = gets.chomp
  puts "Hello #{name}"
  name
end

def initialize_user
  this_user = nil
  user_name = get_username
  all_users = User.all.map {|user| user.name}
  a = true
  while a == true
    if all_users.include?(user_name)
      puts "Sorry, that name is taken.  Try again."
      print ":"
      user_name = get_username
    else
      a = false
      this_user = User.create(name: user_name)
      this_user
    end
  end
  this_user.default_kit
end
binding.pry
"oioioioi"


# greeting
# initialize_user
# class ASound < Gosu::Window
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

# ali = User.create(name: "Ali")
# charlotte = User.create(name: "Charlotte")

# kit1 = Kit.create(user_id: ali.id, name: "kit1")
# kit2 = Kit.create(user_id: charlotte.id, name: "kit2")
#
# #

#
#
# 0


# kit1 = Kit.first
# sound1 = Sound.first
# ks1 = Kitsound.first

# class ASound < Gosu::Window
#     def initialize(ks)
#         @s1 =Gosu::Sample.new(Sound.find(ks.sound_id).sound_path)
#     end

#     def play_sound
#         @s1.play
#     end
# end

# def button_a(id)
#     case id
#     when Gosu::KB_A
#         @sound
#     end

# end
#pry
0
