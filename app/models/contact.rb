class Contact < ActiveRecord::Base
  validates :name, presence: true
  validates :number, presence: true,
                     uniqueness: true
  belongs_to :user

  def is_unique(new_number)
    Contact.all.each do |number|
      if number == new_number
        return false
      else
        true
      end
    end
  end
end
