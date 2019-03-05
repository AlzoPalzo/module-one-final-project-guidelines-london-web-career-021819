class User < ActiveRecord::Base
    has_many :kits

    def default_kit
      default_kit = Kit.create(name: "#{self.name}'s' default", user_id: self.id)
      ks1 = Kitsound.create(kit_id: default_kit.id, sound_id: Sound.all[0].id)
      ks2 = Kitsound.create(kit_id: default_kit.id, sound_id: Sound.all[1].id)
      ks3 = Kitsound.create(kit_id: default_kit.id, sound_id: Sound.all[2].id)
      ks4 = Kitsound.create(kit_id: default_kit.id, sound_id: Sound.all[3].id)
    end

end
