class Section < ActiveRecord::Base
  validates :name, :presence => true
  validates :number, :presence => true


  has_many :lessons
end
