class Lesson < ActiveRecord::Base
  validates :name, :presence => true
  validates :text, :presence => true
  validates :number, :presence => true
  validates :section_id, :presence => true

  belongs_to :section
end
