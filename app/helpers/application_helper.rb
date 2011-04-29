module ApplicationHelper
  #设置Logo方法，便于调用
  def logo
    logo = image_tag("logo.png", :alt => 'Snail Logo', :class => 'logo')
  end

end
