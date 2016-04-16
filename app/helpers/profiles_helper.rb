module ProfilesHelper

  def add_default_image profile
    profile.image = "profiledefault.jpg" if profile.image.blank?
    profile.save
  end
  
end
