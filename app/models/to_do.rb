class ToDo < ActiveRecord::Base
  validates :desc, presence: true
end
