class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  scope :admin, -> { where(role: 'admin') }
  scope :student, -> { where(role: 'student') }

  self.inheritance_column = :role

end
