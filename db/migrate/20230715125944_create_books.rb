class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :status
      t.string :checked_out_by
      t.integer :library_zone_id

      t.timestamps
    end
  end
end
