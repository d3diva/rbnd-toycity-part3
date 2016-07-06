class Transaction
  attr_reader :id, :customer, :product

  @@id = 1
  @@transactions = []

  def initialize(customer, product)
    @@customer = customer
    @@product = product
    @id = @@id
    @@id += 1
    @@transactions << self
  end

  def self.all
    @@transactions
  end

  def product
    @@product
  end

  def customer
    @@customer
  end


end
