module ApplicationHelper
	def control_group_tag(errors, &block)
		if errors.any?
			content_tag :div, capture(&block), class: 'control-group error'
		else
			content_tag :div, capture(&block), class: 'control-group'
		end
	end

	def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def resource_class
  	User
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
