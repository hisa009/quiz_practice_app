class CreateQuizzes < ActiveRecord::Migration[5.2]
  def change
    create_table :quizzes do |t|
      t.text :text, null: false
      t.string :answer, null: false
      t.timestamps
    end
  end
end
