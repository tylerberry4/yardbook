class StudentSerializer < ActiveModel::Serializer
  attributes :id, :fname, :lname, :blurb, :full_name, :profile_url,  :profile_pic

  def full_name
    "#{object.fname} #{object.lname}"
  end

  def profile_url
    "http://0.0.0.0:3000#{object.profile_pic.url}"
  end
end
