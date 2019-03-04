class Sound < ActiveRecord::Base
    has_many :kitsounds
    has_many :kits, through: :kitsounds
end