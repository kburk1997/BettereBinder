class Binder < ActiveRecord::Base
	belongs_to :user
	has_many :tabs
	has_many :documents, through: :tabs
end
