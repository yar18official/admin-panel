class CreateEmployees < ActiveRecord::Migration[5.2]
    def change
        create_table :employees do |t|
            t.string :first_name
            t.string :last_name
            t.date :birthday
            t.integer :salary
            t.string :position
            t.string :education
            t.string :phone_number
            t.string :email

            t.timestamps
        end
    end
end
