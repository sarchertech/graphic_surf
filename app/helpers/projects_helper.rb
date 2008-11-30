module ProjectsHelper
  def add_project_picture_link(name)
    link_to_function name do |page|
  		page.insert_html :bottom, :pictures, :partial => 'picture', 
  		                 :object => ProjectPicture.new
  	end
  end
end
