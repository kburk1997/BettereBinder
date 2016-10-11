class Binder < ActiveRecord::Base
	belongs_to :user
	has_many :tabs
end
