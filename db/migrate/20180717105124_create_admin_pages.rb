class CreateAdminPages < ActiveRecord::Migration[5.0]
  def change
    create_table :admin_pages do |t|

      t.timestamps
    end
  end
end
