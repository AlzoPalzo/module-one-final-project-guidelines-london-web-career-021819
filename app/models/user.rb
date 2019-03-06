class User < ActiveRecord::Base
  has_many :kits

  def default_kit
    default_kit = Kit.create(name: "#{self.name}'s' default", user_id: self.id)
    ks1 = Kitsound.create(kit_id: default_kit.id, sound_id: Sound.all[3].id)
    ks2 = Kitsound.create(kit_id: default_kit.id, sound_id: Sound.all[0].id)
    ks3 = Kitsound.create(kit_id: default_kit.id, sound_id: Sound.all[1].id)
    ks4 = Kitsound.create(kit_id: default_kit.id, sound_id: Sound.all[5].id)
  end

  def my_kits
    Kit.where(user_id: self.id)
  end

  def delete_kit(num)
    choice = my_kits[num-1].id
    Kitsound.where(kit_id: choice).each do |kitsound|
      kitsound.delete
    end
      Kit.find(choice).delete
  end

  def kit_sound_paths(inkit)
    chosen_kitsounds = Kitsound.where(kit_id: inkit.id)
    chosen_kitsounds.map{|kitsound| Sound.find(kitsound.sound_id).sound_path}
  end

  def user_choice
    puts "Please choose from one of the following kits by number\n Press 'n' to make a new kit\n Press 'd#' to delete a kit\n Type 'exit' to quit."
    my_kits.each_with_index {|kit, index| puts "#{index + 1}: #{kit.name}"}
    i = ""
    while i.empty?
      i = gets.chomp
      if i.empty?
        puts "Input is required"
      end
    end
    i
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
      if string_choice[0].downcase == "d" && string_choice[1].to_i <= my_kits.length
        delete_kit(string_choice[1].to_i)
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
    sound_search(new_kit, "kick")
    sound_search(new_kit, "snare")
    sound_search(new_kit, "hat")
    sound_search(new_kit, "FX")
    # snare_search(new_kit)
    # hat_search(new_kit)
    # fx_search(new_kit)
  end


  def sound_search(new_kit, type)
    sounds = Sound.where('sound_path LIKE ?','%' + type + '%').all
    sounds.each_with_index do |sound, index|
      puts "#{type.capitalize} #{index + 1}"
    end
    puts "Press P to hear all #{type}'s"
      sound = 0
      sound_choice = 0
    while sound_choice < 1 || sound_choice > sounds.length
      s_sound_choice = gets.chomp
      if s_sound_choice.downcase == "p"
        Example_sounds.play_examples(type)
        puts "Press 'p' to listen again"
        next
      end
      sound_choice = s_sound_choice.to_i
      if sound_choice < 0 || sound_choice > sounds.length
      puts "You have made an invalid choice, please try again"
      else 
        sound = sounds[sound_choice - 1].id
      end
    end
    save_sound_to_kit(new_kit, sound)
  end

  def save_sound_to_kit(new_kit, sound)
      Kitsound.create(kit_id: new_kit.id, sound_id: sound)
  end

end