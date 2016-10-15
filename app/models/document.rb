##
#This class stores a link to an externally hosted document.
#Controller: DocumentsController

# Attributes:
# * id [integer, primary, not null] - primary key
# * created_at [datetime] - creation time
# * description [text] - TODO: document me
# * document_url [string] - TODO: document me
# * tab_id [integer] - belongs to :tab
# * title [string]
# * updated_at [datetime] - last update time
class Document < ActiveRecord::Base
	##
	#Each document lives inside a Tab, which lives inside a Binder.
  belongs_to :tab
  belongs_to :binder
end
