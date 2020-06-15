class CreateCorrectnesses < ActiveRecord::Migration[5.2]
  def change
    create_table :correctnesses do |t|
      t.boolean :answer_flg, null: false, default: false
      t.references :quiz, null:false, foreign_key: true
      t.timestamps
    end
  end
end
