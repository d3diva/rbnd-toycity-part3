class Transaction

  attr_accessor :id, :customer, :product, :stock, :price, :tran_type

  @@id = 1
  @@transactions = []

  def initialize(customer, product, tran_type)
    @customer = customer
    @product = product
    @id = @@id
    @@id += 1
    @tran_type = tran_type
    if @tran_type == "purchase" # checks type of transaction
      @product.in_stock?? add_transaction : product.out_of_stock
    else
      cancle_transaction
    end
  end

  def self.all
    @@transactions
  end

  def self.find(id) # finds transaction by id
    @@transactions.find{|transaction| transaction.id == id}
  end

  def self.print_transaction_report_header # prints transaction report header
    puts "#{"".ljust(25)}Transaction Report"
    print_line
    puts "#{"Id".ljust(10)} #{"Product".ljust(30)} #{"Customer".ljust(15)} #{"Type".ljust(10)} #{"Price"}"
  end

  def self.print_add_transaction(transaction) # prints purchase transaction
    puts "#{transaction.id.to_s.ljust(2)} #{transaction.product.title.ljust(35)} #{transaction.customer.name.ljust(18)} #{transaction.tran_type.ljust(10)} #{transaction.product.price}"
    @total_sale = @total_sale.to_f + transaction.product.price # adds to total sales
  end

  def self.print_less_transaction(transaction) # prints cancle transaction
    puts "#{transaction.id.to_s.ljust(2)} #{transaction.product.title.ljust(35)} #{transaction.customer.name.ljust(18)} #{transaction.tran_type.ljust(8)} #{"- "}#{transaction.product.price}"
    @total_sale = @total_sale.to_f - transaction.product.price # deducts from total sale
  end

  def self.print_transaction_report # prints transactions report
    @@transactions.each do |transaction|
      transaction.tran_type == "purchase"? print_add_transaction(transaction) : print_less_transaction(transaction)
    end
  end

  def self.print_total_sale_amount # prints total sales amount
    puts "#{"Total Sale Amount".ljust(68)} #{@total_sale.round(2)}"
  end

  def self.print_line
    puts "-" * 75
  end

  def self.transaction_report # print ransaction report
    print_line
    print_transaction_report_header
    print_line
    print_transaction_report
    print_line
    print_total_sale_amount
    print_line
  end

  private

  def add_transaction # add transactions if purchase
    @product.less_stock
    @@transactions << self
  end

  def cancle_transaction # cancle transactions if cancle
    @product.add_stock
    @@transactions << self
  end

end
