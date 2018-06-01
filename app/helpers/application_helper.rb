module ApplicationHelper
    def get_registration(course_id, student_id)
        return CourseRegistration.find_by(course_id: course_id, student_id: student_id)
    end

    def get_student(id)
        Student.find(id)
    end
end
