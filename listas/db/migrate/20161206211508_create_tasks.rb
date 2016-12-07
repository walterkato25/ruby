class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :description
      t.string :state
      t.string :priority
      t.date :validation_start
      t.date :validation_end
      t.float :percentage
      t.references :list, foreign_key: true

      t.timestamps
    end
  end
end
