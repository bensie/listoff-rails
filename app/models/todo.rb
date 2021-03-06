class Todo < ActiveRecord::Base
  
  acts_as_list :scope => :user_id
  
  belongs_to :user
  
  has_many :items, :dependent => :destroy
  
  validates_presence_of :name
  
  attr_accessible :name
  
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
    options[:only] = [:id, :name, :items_count, :updated_at, :created_at]
    #options[:methods] = [:spent, :over_amount, :under_amount]
  end

end
