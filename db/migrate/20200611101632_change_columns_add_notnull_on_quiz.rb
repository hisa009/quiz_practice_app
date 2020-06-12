class ChangeColumnsAddNotnullOnQuiz < ActiveRecord::Migration[5.2]
  def change
    change_column_null :quizzes, :user_id, false
  end
end
