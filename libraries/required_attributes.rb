module RequiredAttributes
  def validate_required_attributes(cookbook_name)
    cookbook_name = cookbook_name.to_sym if cookbook_name.is_a? String
    attribs = node[cookbook_name][:required_attributes]
    if attribs.nil?
      Chef::Log.error "required_attributes is nil. If you don't have any this should be empty instead"
      exit(1)
    end
    Chef::Log.debug "Testing for required_attributes: #{attribs.join(", ")}"
    failed_attributes = attribs.map do |attrib|
      attrib unless node[cookbook_name][attrib]
    end
    if failed_attributes.any?
      Chef::Log.error "required_attribute #{failed_attributes.join(", ")} are missing"
      exit(1)
    end
  end
end

class Chef::Recipe
  include RequiredAttributes
end

