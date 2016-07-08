class Transaction

  attr_accessor :id, :customer, :product, :stock

  @@id = 1
  @@transactions = []

  def initialize(customer, product)
    if product.stock < 1
      out_of_stock(product.stock)
    else
      @customer = customer
      @product = product
      @id = @@id
      @@id += 1
      add_transaction
    end
  end

  def self.all
    @@transactions
  end

  def self.find(id)
    @@transactions.find{|transaction| transaction.id == id}
  end

  private

  def add_transaction
    @product.less_stock
    @@transactions << self
  end

  def out_of_stock(stock)
    begin
      raise OutOfStockError, "Error : '#{stock}' is out of stock."
      rescue => error
      puts error
    end
  end


end
