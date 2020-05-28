class Dashboard < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: { minimum: 2 }

  acts_as_list
end
