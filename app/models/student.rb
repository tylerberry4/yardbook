class Student < User
  scope :rubyists, -> { where(track: 'RoR') }
end
