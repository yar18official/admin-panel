class CreateCourseRosters < ActiveRecord::Migration[5.2]
  def change
    create_table :course_rosters do |t|
      t.integer :course_id
      t.integer :student_id

      t.timestamps
    end
  end
end
