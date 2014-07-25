class StudentSerializer < ActiveModel::Serializer
  attributes :id, :fname, :lname, :blurb, :full_name

  def full_name
    "#{object.fname} #{object.lname}"
  end
end
