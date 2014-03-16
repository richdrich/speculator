class Object
  def self.x_build(classname, instance_vars)
    klass = Object.qualified_const_get(classname.to_s)

    new_obj = klass.allocate
    instance_vars.each do |name, value|
      new_obj.instance_variable_set name, value
    end

    new_obj
  end
end
