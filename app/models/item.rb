class Item < ActiveRecord::Base
  
  belongs_to :todo
  
  validates_presence_of :content

  def to_xml(options={})
    default_serialization_options(options)
    super(options)
  end

  def to_json(options={})
    default_serialization_options(options)
    super(options)
  end

protected

  def default_serialization_options(options={})
    options[:only] = [:id, :name, :list_id, :content, :completed, :updated_at, :created_at]
  end

end
