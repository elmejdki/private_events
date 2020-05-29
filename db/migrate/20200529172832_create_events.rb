class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.date :date
      t.string :title
      t.string :body
      t.string :place

      t.timestamps
    end
  end
end
