def populate
  if Sound.count == 0
        x = Dir.entries("lib/sounds/DrumHits3")
    x.each do |i|
      Sound.create(sound_path: "lib/sounds/DrumHits3/"+i)
    end
  end
end
