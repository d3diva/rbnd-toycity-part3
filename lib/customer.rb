class Customer #< Addrecords
  attr_accessor :name

  @@customers = []

  def initialize(options={})
    @name = options[:name]
    #super(@@customers, @name)
    add_to_customers # adds new customer
  end

  def self.all
    @@customers
  end

  def self.find_by_name(cname) # finds customer by name
    @@customers.find{|customer| customer.name == cname}
  end

  def purchase(product) # customer purchase if product avaliable
    product.in_stock?? Transaction.new(self, product, tran_type = "purchase") : product.out_of_stock
  end

  def cancle(product) # customer returns product
    Transaction.new(self, product, tran_type = "cancle")
  end

  private

  def add_to_customers # adds new customer after checking for duplicate
    customer_exist(@name)?  duplicate_error : add_customer
  end

  def customer_exist(title) # finds customer by name
    @@customers.map {|customer| customer.name}.include?(name)
  end

  def duplicate_error # raises error if duplicate customer
    #    raise DuplicateCustomerError, "Error : '#{@name}' already exists"
  end

  def add_customer # adds if customer unique
    @@customers << self
  end
end
