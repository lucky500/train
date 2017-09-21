class City
  attr_reader(:name, :time, :id)

def initialize(attributes)
  @name = attributes.fetch(:name)
  @id
end

end
