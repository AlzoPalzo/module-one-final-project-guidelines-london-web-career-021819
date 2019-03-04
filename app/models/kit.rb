class Kit < ActiveRecord::Base
    belongs_to :users
    has_many :kitsounds
    has_many :sounds, through: :kitsounds
end