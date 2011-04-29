#encoding: utf-8
module PagesHelper
  #定义title
  def title
    base_title = '蜗牛网'
    unless @title.nil?
      "#{base_title}--#{@title}"
    else
      base_title
    end
  end
end
