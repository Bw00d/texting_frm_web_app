class Contact < ActiveRecord::Base
  validates :name, presence: true
  validates :number, presence: true
  belongs_to :user
end
