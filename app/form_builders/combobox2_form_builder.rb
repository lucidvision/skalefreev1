class Combobox2FormBuilder < ActionView::Helpers::FormBuilder
  include ActionView::Context # for nested content_tag
  include ActionView::Helpers::FormTagHelper #for sanitize_to_id method access

  def combobox_tag(name, options, opts= {})
     @template.content_tag(:input, :name => "q["+sanitize_to_id(name)+"]", :placeholder => "Double Click for Walls", :id => "wall", :type => "text", :list => opts[:list_id]) do
       content_tag(:datalist, :id => opts[:list_id]) {options}
     end    
  end    
end