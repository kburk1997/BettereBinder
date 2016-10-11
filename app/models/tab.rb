class Tab < ActiveRecord::Base
	belongs_to :binder
	has_many :documents
end
