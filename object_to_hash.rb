module ObjectToHash

  #recursion to convert any level of nested objects to hash
  def to_hash
    h = Hash.new

    instance_variables.each do |attribute|
      attribute = attribute.to_s.delete('@')
      instance = send(attribute)

      # ignore if assigned self instance
      next if instance == self

      unless instance.instance_variables.empty?

        unless instance.respond_to? :to_hash
          instance.extend ::ObjectToHash
        end

        h[attribute] = instance.to_hash
      else
        h[attribute] = instance
      end
    end

    h
  end
end


