module ApplicationHelper
    def get_registration(course_id, student_id)
        return CourseRegistration.find_by(course_id: course_id, student_id: student_id)
    end
end
