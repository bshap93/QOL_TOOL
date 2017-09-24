module ApplicationHelper

  def current_user
    begin
      return User.find(session[:user_id])
    rescue
      return nil
    end
  end

  def user_signed_in?
    current_user != nil
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    link_to name, "#", onclick: "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")"
  end
end
