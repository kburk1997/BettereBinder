##
#This class stores a link to an externally hosted document.
class Document < ActiveRecord::Base
	##
	#Each document lives inside a tab, which lives inside a binder.
  belongs_to :tab
  belongs_to :binder
end
