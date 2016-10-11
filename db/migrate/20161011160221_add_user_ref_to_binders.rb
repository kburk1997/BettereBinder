class AddUserRefToBinders < ActiveRecord::Migration
  def change
  	    add_reference :binders, :user, foreign_key: true
  end
end
