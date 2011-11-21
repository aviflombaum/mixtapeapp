module ApplicationHelper
  def new_child_fields_template(form_builder, association, options = {})
    options[:object] ||= form_builder.object.class.reflect_on_association(association).klass.new
    options[:partial] ||= "#{association.to_s}/fields"
    options[:form_builder_local] ||= :f
    
    content_tag(:div, :id => "#{association}_fields_template", :style => "display: none") do
      form_builder.fields_for(association, options[:object], :child_index => "new_#{association}") do |f|
        render(:partial => options[:partial], :locals => {options[:form_builder_local] => f})
      end
    end
  end
end
