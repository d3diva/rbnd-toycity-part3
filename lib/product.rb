class Product
  attr_reader :title

  @@products = []

  def initialize(options={})
    @title = options[:title]
    add_to_products
  end

  def self.all
    @@products
  end

  private

 def add_to_products
   # hmm...
  if @@products.map {|product| product.title}.include?(@title)
     raise DuplicateProductError, "there."
     puts "found"
  else
    puts "not found"
    @@products << self
  end
 end

end
