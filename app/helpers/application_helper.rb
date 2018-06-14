module ApplicationHelper
    def get_registration(course_id, student_id)
        return CourseRegistration.find_by(course_id: course_id, student_id: student_id)
    end

    def get_student(id)
        Student.find(id)
    end

    def get_instructor(id)
        Instructor.find_by(user_id: id)
    end
    def get_courses(id)
        Course.where(instructor_id: id)
    end
    def get_cohorts(id)
        Cohort.where(instructor_id: id)
    end
end
