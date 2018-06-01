module ApplicationHelper
    def get_registration(course_id, student_id)
        return CourseRegistration.find_by(course_id: course_id, student_id: student_id)
    end
    def registration_record(student_id, course_id)
        CourseRegistration.find(student_id: student_id, course_id: course_id)
    end
end
