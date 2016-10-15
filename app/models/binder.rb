##
#This class is the base for the digital binder.
class Binder < ActiveRecord::Base
	##
	#Each binder belongs to a user and can only be edited by that user.

	belongs_to :user

	##
	#Each binder has a collection of tabs.
	has_many :tabs
	has_many :documents, through: :tabs
end
