class User < ActiveRecord::Base
  has_many :kits

  def default_kit
    default_kit = Kit.create(name: "#{self.name}'s' default", user_id: self.id)
    ks1 = Kitsound.create(kit_id: default_kit.id, sound_id: Sound.all[0].id)
    ks2 = Kitsound.create(kit_id: default_kit.id, sound_id: Sound.all[1].id)
    ks3 = Kitsound.create(kit_id: default_kit.id, sound_id: Sound.all[2].id)
    ks4 = Kitsound.create(kit_id: default_kit.id, sound_id: Sound.all[3].id)
  end

  def my_kits
    Kit.where(user_id: self.id)
  end

  def kit_sound_paths(inkit)
    chosen_kitsounds = Kitsound.where(kit_id: inkit.id)
    chosen_kitsounds.map{|kitsound| Sound.find(kitsound.sound_id).sound_path}
  end

  def user_choice
    puts "Please choose from one of the following kits by number\n Press 'n' to make a new kit\n Type 'exit' to quit."
    my_kits.each_with_index {|kit, index| puts "#{index + 1}: #{kit.name}"}
    gets.chomp
  end


  def play_kit(kit)
    sp_ary = kit_sound_paths(kit)
    My_window.new(self.name, kit.name, sp_ary[0], sp_ary[1], sp_ary[2], sp_ary[3]).show
  end

  def get_chosen_kit
    chosen_kit = nil
    while true
      string_choice = user_choice
      if string_choice == "exit"
        return 0
      end
      if string_choice == "n"
        make_new_kit
      end
      choice = string_choice.to_i
      if choice < 1 || choice.to_i > my_kits.length
        puts "You have made an invalid choice, please try again"
      else
        chosen_kit = my_kits[choice - 1]
        play_kit(chosen_kit)
      end
    end
  end

  def make_new_kit
    puts "Name your kit"
    kit_name = gets.chomp
    new_kit = Kit.create(name: kit_name, user_id: self.id)
    kick_search(new_kit)
  end

  def populate_kit

  end
  def kick_search(new_kit)
    kicks = Sound.where('sound_path LIKE ?','%Kick%').all
    kicks.each_with_index do |kick, index|
      puts "Kick #{index +1}"
    end
    puts "Press P to hear all kicks"
      kick = 0
      kick_choice = 0
    while kick_choice < 1 || kick_choice > kicks.length
       skick_choice = gets.chomp
       if skick_choice.downcase == "p"
       end
       kick_choice = skick_choice.to_i
       if kick_choice < 0 || kick_choice > kicks.length
         puts "You have made an invalid choice, please try again"
      else kick = kicks[kick_choice - 1].id
      end
    end
    save_kick_to_kit(new_kit, kick)
  end

  def save_kick_to_kit(new_kit, kick)
    Kitsound.create(kit_id: new_kit.id, sound_id: kick)
  end
end
