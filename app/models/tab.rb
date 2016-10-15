##
#This class stores a collection of documents.
#Controller: TabsController

# Attributes:
# * id [integer, primary, not null] - primary key
# * binder_id [integer] - belongs to :binder
# * created_at [datetime] - creation time
# * description [text] - TODO: document me
# * title [string]
# * updated_at [datetime] - last update time
class Tab < ActiveRecord::Base
	##
	#Each tab lives in a Binder.
	belongs_to :binder

	##
	#Each tab stores a collection of documents (see Document).
	has_many :documents
end
