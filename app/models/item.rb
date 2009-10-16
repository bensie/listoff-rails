class Item < ActiveRecord::Base
  
  belongs_to :todo, :counter_cache => true
  
  validates_presence_of :content
  
  attr_accessible :content, :todo_id

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
    options[:only] = [:id, :todo_id, :content, :completed, :updated_at, :created_at]
  end

end
