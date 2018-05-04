class CreateCourseEnrollments < ActiveRecord::Migration[5.2]
    def up
        create_table :course_enrollments do |t|
            t.integer "course_id"
            t.integer "student_id"
            t.integer "absent"
            t.decimal "grade"
            t.timestamps
        end
        add_index("course_enrollments", ["course_id", "student_id"])
    end

    def down
        drop_table :courses_students
    end
end
