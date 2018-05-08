class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.date :birthday
      t.string :education
      t.string :email
      t.string :phone_number
      t.integer :cohort_id

      t.timestamps
    end
  end
end
