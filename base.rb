require 'active_support'

class Base

  #recursion to convert any level of nested objects to hash
  def to_hash
    h = Hash.new

    instance_variables.each do |attribute|
      attribute = attribute.to_s.delete('@')
      instance = send(attribute)
      unless instance.instance_variables.empty?
        h[attribute] = instance.to_hash
      else
        h[attribute] = instance
      end
    end

    h
  end
end
