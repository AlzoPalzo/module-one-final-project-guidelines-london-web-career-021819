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

  def delete_kit
    choice = user_choice.to_i
    kit_choice = my_kits[choice-1].id
    Kitsound.where(kit_id: kit_choice).each do |kitsound|
      kitsound.delete
    end
      Kit.find(kit_choice).delete
  end


  def kit_sound_paths(inkit)
    chosen_kitsounds = Kitsound.where(kit_id: inkit.id)
    chosen_kitsounds.map{|kitsound| Sound.find(kitsound.sound_id).sound_path}
  end

  def user_choice
    puts "\nPlease choose from one of the following kits by number\n"
    my_kits.each_with_index {|kit, index| puts " #{index + 1}: #{kit.name}"}
    ch = ""
    while ch.empty?
      ch = gets.chomp
      if ch.empty?
        puts "Input is required"
      elsif ch.to_i < 1 || ch.to_i > my_kits.length
        puts "You have made an invalid choice, please try again"
        ch = ""
      end
    end
    ch.to_i
  end

  def user_choice_menu
    prompt = TTY::Prompt.new
    prompt.select('Select an Option') do |menu|
      menu.choice name: 'Make new kit',  value: 1
      menu.choice name: 'Load saved kits',  value: 2
      menu.choice name: 'Delete kit', value: 3
      menu.choice name: 'Exit', value: 4
    end
  end

  def user_choice_menu_method
    while true
      case user_choice_menu
      when 1
          make_new_kit
      when 2
          get_chosen_kit
      when 3
          delete_kit
      when 4
          return 0
      end
    end
  end

  def play_kit(kit)
    sp_ary = kit_sound_paths(kit)
    My_window.new(self.name, kit.name, sp_ary[0], sp_ary[1], sp_ary[2], sp_ary[3]).show
  end

  def get_chosen_kit
    uc = user_choice
    play_kit(my_kits[uc-1])
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
    puts "Select sound by number\n"
    sounds = Sound.where('sound_path LIKE ?','%' + type + '%').all
    sounds.each_with_index do |sound, index|
      puts "#{type.capitalize} #{index + 1}"
    end
    puts "Press P to hear all #{type}s"
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
