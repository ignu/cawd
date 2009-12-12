class Player
  
  def self.add_action(method_name, &block)
    define_method method_name, block
  end
  
end