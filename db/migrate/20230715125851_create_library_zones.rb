class CreateLibraryZones < ActiveRecord::Migration[5.1]
  def change
    create_table :library_zones do |t|
      t.string :name

      t.timestamps
    end
  end
end
