class Customer #< Addrecords
  attr_accessor :name

  @@customers = []

  def initialize(options={})
    @name = options[:name]
    #super(@@customers, @name)
    add_to_customers
  end

  def self.all
    @@customers
  end

  def self.find_by_name(cname)
    @@customers.find{|customer| customer.name == cname}
  end



  private

  def add_to_customers
    customer_exist(@name)?  duplicate_error : add_customer
  end

  def customer_exist(title)
    @@customers.map {|customer| customer.name}.include?(name)
  end

  def duplicate_error
    begin
      raise DuplicateCustomerError, "Error : '#{@name}' already exists"
      rescue => error
      puts error
    end
  end

  def add_customer
    @@customers << self
  end
end
