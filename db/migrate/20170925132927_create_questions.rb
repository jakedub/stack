class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :subject
      t.text :field

      t.timestamps
    end
  end
end
