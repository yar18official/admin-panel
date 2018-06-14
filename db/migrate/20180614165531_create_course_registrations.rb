class CreateCourseRegistrations < ActiveRecord::Migration[5.2]
  def change
    create_table :course_registrations do |t|
      t.references :course, foreign_key: true
      t.references :student, foreign_key: true
      t.timestamps
    end
    add_index("course_registrations", ['course_id', 'student_id'])
  end
end
