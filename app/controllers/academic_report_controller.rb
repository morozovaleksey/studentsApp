class AcademicReportController < ApplicationController
  def show_report
    gon.params = params
    @subjects = Subject.all

  end
end
