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
    snare_search(new_kit)
    hat_search(new_kit)
    fx_search(new_kit)
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
    save_sound_to_kit(new_kit, kick)
  end

  def snare_search(new_kit)
    snares = Sound.where('sound_path LIKE ?','%Snare%').all
    snares.each_with_index do |snare, index|
      puts "Snare #{index +1}"
    end
    puts "Press P to hear all snares"
      snare = 0
      snare_choice = 0
    while snare_choice < 1 || snare_choice > snares.length
       ssnare_choice = gets.chomp
       if ssnare_choice.downcase == "p"
       end
       snare_choice = ssnare_choice.to_i
       if snare_choice < 0 || snare_choice > snares.length
         puts "You have made an invalid choice, please try again"
      else snare = snares[snare_choice - 1].id
      end
    end
    save_sound_to_kit(new_kit, snare)
  end

  def hat_search(new_kit)
    hats = Sound.where('sound_path LIKE ?','%Hat%').all
    hats.each_with_index do |hat, index|
      puts "Hat #{index +1}"
    end
    puts "Press P to hear all snares"
      hat = 0
      hat_choice = 0
    while hat_choice < 1 || hat_choice > hats.length
       shat_choice = gets.chomp
       if shat_choice.downcase == "p"
       end
       hat_choice = shat_choice.to_i
       if hat_choice < 0 || hat_choice > hats.length
         puts "You have made an invalid choice, please try again"
      else hat = hats[hat_choice - 1].id
      end
    end
    save_sound_to_kit(new_kit, hat)
  end

  def fx_search(new_kit)
    fxs = Sound.where('sound_path LIKE ?','%FX%').all
    fxs.each_with_index do |fx, index|
      puts "FX #{index +1}"
    end
    puts "Press P to hear all FX"
      fx = 0
      fx_choice = 0
    while fx_choice < 1 || fx_choice > fxs.length
       sfx_choice = gets.chomp
       if sfx_choice.downcase == "p"
       end
       fx_choice = sfx_choice.to_i
       if fx_choice < 0 || fx_choice > fxs.length
         puts "You have made an invalid choice, please try again"
      else fx = fxs[fx_choice - 1].id
      end
    end
    save_sound_to_kit(new_kit, fx)
  end


  def save_sound_to_kit(new_kit, sound)
      Kitsound.create(kit_id: new_kit.id, sound_id: sound)
  end

end
