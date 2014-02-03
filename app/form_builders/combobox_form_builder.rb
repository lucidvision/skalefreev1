class ComboboxFormBuilder < ActionView::Helpers::FormBuilder
  include ActionView::Context # for nested content_tag
  include ActionView::Helpers::FormTagHelper #for sanitize_to_id method access

  def combobox_tag(name, options, opts= {})
     @template.content_tag(:input, :name => "findpost["+sanitize_to_id(name)+"]", :placeholder => "ENGL", :maxlength => 4, :style => "width: 55px;", :type => "text", :list => opts[:list_id]) do
       content_tag(:datalist, :id => opts[:list_id]) {options}
     end    
  end    
end