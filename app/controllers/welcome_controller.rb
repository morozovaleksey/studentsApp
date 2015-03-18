require 'socket'
class WelcomeController < ApplicationController
  def index
    gon.params = params
    @groups = Group.all
  end

  def create_student
    if Student.where(:id => params[:id]).blank?
      render json: Student.create(get_params)
    else
      student_record = Student.where(:id => params[:id]).limit(1)
      render json: student_record.update(student_record[0].id,:last_name => params[:last_name], :name => params[:name], :group_id => params[:group_id], :email => params[:email], :date_of_birth => params[:date_of_birth])
    end
  end
  def get_ip_address
    #public ip

    headers = { "User-Agent" => "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.37" }
    page = Nokogiri::HTML.parse(HTTParty.get("http://www.iplocation.net/", headers: headers))
    page.xpath(".//*[@id='locator']/p[1]/b").text

    #local ip

    # UDPSocket.open do |s|
    #   s.connect '64.233.187.99', 1
    #   s.addr.last
    # end
  end
  def delete_student
    render json: Student.delete(params[:id])
  end

  def list_students
    render json: Student.select('students.id,students.name,students.last_name, students.email, students.date_of_birth, students.ip_address, groups.group_name,groups.id AS group_id').joins('LEFT OUTER JOIN groups ON students.group_id = groups.id').order('id')

    # render json: Student.joins('LEFT OUTER JOIN groups ON groups.id = students.group_id')
    # render json: Student.order('id_student')

  end
  private
  def get_params
    params[:welcome].merge!(:ip_address => get_ip_address)
    params.require(:welcome).permit(:last_name, :name, :group_id, :email, :date_of_birth, :ip_address)
  end
end
