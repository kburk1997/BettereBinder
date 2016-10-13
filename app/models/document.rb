class Document < ActiveRecord::Base
  belongs_to :tab
  belongs_to :binder
end
