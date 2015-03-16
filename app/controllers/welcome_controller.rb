require 'socket'
class WelcomeController < ApplicationController
  def index
    # @students = Student.paginate(:page => params[:page], :per_page => 10)
  end

  def create_student
    render json: Student.create(get_params)
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
  def show_student
    render json: Student.find(params[:id])
  end

  def list_students
    render json: Student.all
  end
  private
  def get_params
    params[:welcome].merge!(:ip_address => get_ip_address)
    params.require(:welcome).permit(:last_name, :name, :group, :email, :date_of_birth, :ip_address)
  end
end
