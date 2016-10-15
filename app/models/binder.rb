##
#This class is the base for the digital binder.
#Controller: BindersController

# Attributes:
# * id [integer, primary, not null] - primary key
# * created_at [datetime] - creation time
# * description [text] - TODO: document me
# * title [string]
# * updated_at [datetime] - last update time
class Binder < ActiveRecord::Base
	##
	#Each binder belongs to a User and can only be edited by that user.

	belongs_to :user

	##
	#Each binder has a collection of tabs (see Tab).
	has_many :tabs
	has_many :documents, through: :tabs
end
