class AcademicReportController < ApplicationController
  def show_report
    gon.params = params
    @subjects = Subject.all
    # @assessments =  Assessment.select('students.id as student_id,students.name as student_name,students.last_name as student_last_name, students.email, students.date_of_birth,
    # students.ip_address, groups.group_name, subjects.subject_name as subject_name, assessments.assessment').joins('LEFT OUTER JOIN students ON students.id = assessments.student_id').
    #                            joins('LEFT OUTER JOIN groups ON students.group_id = groups.id').joins('LEFT OUTER JOIN subjects ON subjects.id = assessments.subject_id')
    #
    # g = PivotTable::Grid.new do |g|
    #   g.source_data  = @assessments
    #   g.column_name  = :subject_name
    #   g.row_name     = :student_last_name
    #   g.value_name   = :assessment
    # end
    # render json: g.build
    # render json: Assessment.select("sum(assessment) as total_assessment, count(assessment) as count_assessment,sum(assessment)/count(assessment) as average").where("student_id = '3'").group("student_id")

  end

  def report_list_students

    @students = Student.all
    @students = @students.as_json
    @students.each_with_index do |student,index|
        @students[index].merge!({:assessment => Assessment.where("student_id = '#{student['id']}'"),
                                 :group => Group.where("id = '#{student['group_id']}'"),
                                :total => Assessment.select("sum(assessment) as total_assessment, count(assessment) as count_assessment,sum(assessment)/count(assessment) as average").where("student_id = '#{student['id']}'").group("student_id")})
    end
    render json: @students
    # render json: Assessment.select('students.id as student_id,students.name,students.last_name, students.email, students.date_of_birth,
    # students.ip_address, groups.group_name, subjects.subject_name, assessments.assessment').joins('LEFT OUTER JOIN students ON students.id = assessments.student_id').
    #     joins('LEFT OUTER JOIN groups ON students.group_id = groups.id').joins('LEFT OUTER JOIN subjects ON subjects.id = assessments.subject_id')

  end

end
