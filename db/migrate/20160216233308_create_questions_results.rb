class CreateQuestionsResults < ActiveRecord::Migration
  def self.up
    create_table :questions_results, :id => false do |t|
      t.references :result
      t.references :question
    end
    add_index :questions_results, [:result_id, :question_id]
    add_index :questions_results, :question_id
  end


  def self.down
    drop_table :questions_results
  end
end