class Potluck < Sequel::Model

  def to_api
    {
      id: id,
      title: title,
      description: description,
      date: potluck_date
    }
  end


end
