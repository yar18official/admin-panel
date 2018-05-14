class CreateCourseRegistrations < ActiveRecord::Migration[5.2]
  def change
    create_table :course_registrations do |t|
      t.integer :course_id
      t.integer :student_id

      t.timestamps
    end
    add_index("course_registrations", ['course_id', 'student_id'])
  end
end
