class User < ActiveRecord::Base
  has_many :kits

  def default_kit
    default_kit = Kit.create(name: "#{self.name}'s' default", user_id: self.id)
    ks1 = Kitsound.create(kit_id: default_kit.id, sound_id: Sound.all[0].id)
    ks2 = Kitsound.create(kit_id: default_kit.id, sound_id: Sound.all[1].id)
    ks3 = Kitsound.create(kit_id: default_kit.id, sound_id: Sound.all[2].id)
    ks4 = Kitsound.create(kit_id: default_kit.id, sound_id: Sound.all[3].id)
  end

  def choose_kit_prompt
    puts "Choose a drumkit to play or type exit to close"
    puts "1: #{Kit.find_by_user_id(self.id).name}"
  end

  def choose_kit
    choose_kit_prompt
    gets.chomp
  #add the code that starts the window with interactive keys
  end

  def my_kits
      Kit.where(user_id: self.id)
  end

  def kitsounds_from_kit(this_kit)
    Kitsound.where(kit_id: this_kit.id)
  end

  def play_kit
    user_choice = ""
    while user_choice != "exit"
      user_choice = choose_kit
      if user_choice == "1"
        kit = my_kits[0]
        my_kitsounds = kitsounds_from_kit(kit)
        ks1 = my_kitsounds[0]
        sp1 = Sound.find(ks1.sound_id).sound_path
        ks2 = my_kitsounds[1]
        sp2 = Sound.find(ks2.sound_id).sound_path
        ks3 = my_kitsounds[2]
        sp3 = Sound.find(ks3.sound_id).sound_path
        ks4 = my_kitsounds[3]
        sp4 = Sound.find(ks4.sound_id).sound_path
        # binding.pry
        My_window.new(self.name, kit.name, sp1, sp2, sp3, sp4).show
      end
    end
  end
end
