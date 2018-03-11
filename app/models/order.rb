class Order < ActiveRecord::Base
  
resourcify
has_many :passports
accepts_nested_attributes_for :passports, :allow_destroy => true
attr_writer :current_step
dragonfly_accessor :image do
      default 'public/images/default.png'
end
#validates_size_of :image, maximum: 5000.kilobytes
  
  def current_step
    @current_step || steps.first
  end
  
  def steps
    %w[first second passport]
  end
  
  def next_step
    self.current_step = steps[steps.index(current_step)+1]
  end
  
  def previous_step
    self.current_step = steps[steps.index(current_step)-1]
  end
  
  def first_step?
    current_step == steps.first
  end
  
  def last_step?
    current_step == steps.last
  end
  
  
  
  def all_valid?
    steps.all? do |step|
      self.current_step = step
      valid?
    end
  end
   
   
    
end
