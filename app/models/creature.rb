class Creature < ActiveRecord::Base
  has_and_belongs_to_many :tags

  validates :name, presence: true, uniqueness: true, numericality: false
  validates :desc, presence: true, length: { minimum: 10, maximum: 255 }

end
