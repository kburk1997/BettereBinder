##
#This class stores a collection of documents.
class Tab < ActiveRecord::Base
	##
	#Each tab lives in a binder.
	belongs_to :binder
	has_many :documents
end
