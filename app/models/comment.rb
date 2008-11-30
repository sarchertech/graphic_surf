class Comment < ActiveRecord::Base
  belongs_to :post
  
  include Splam
  
  splammable :body
  
  attr_accessor :content
  
  validates_presence_of :body, :on => :create, :message => "can't be blank"   
end
