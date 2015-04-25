class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.references :registered_application, index: true

      t.timestamps null: false
    end
    add_foreign_key :events, :registered_applications
  end
end
