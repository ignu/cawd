class Player
  self.add_action(method_name, &block)
    send :define_method, method_name, block
  end
  
end