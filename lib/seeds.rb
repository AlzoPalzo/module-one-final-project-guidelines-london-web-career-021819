def populate
  if Sound.count == 0
    x = Dir["lib/sounds/*.wav"]
    x.each do |i|
      Sound.create(sound_path: i)
    end    
    y = Dir["lib/sounds/*.aif"]
    y.each do |i|
      Sound.create(sound_path: i)
    end

  end
end
