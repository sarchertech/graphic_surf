module PostsHelper
  def add_post_picture_link(name)
    link_to_function name do |page|
  		page.insert_html :bottom, :pictures, :partial => 'picture', 
  		                 :object => PostPicture.new
  	end
  end
  
  def blog_image(reference, options = {})
    image_tag(@post.post_pictures.find_by_reference(reference).blog_photo.url, options)
  end
end
