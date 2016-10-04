class AddBinderIdToTabs < ActiveRecord::Migration
  def change
    add_column :tabs, :binder_id, :integer
  end
end
