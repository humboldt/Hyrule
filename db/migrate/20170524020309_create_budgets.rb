class CreateBudgets < ActiveRecord::Migration[5.0]
  def change
    create_table :budgets do |t|
      t.references :trip, foreign_key: true
      t.integer :value
      t.text :comment

      t.timestamps
    end
  end
end
