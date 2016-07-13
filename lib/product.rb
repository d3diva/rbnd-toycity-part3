#require_relative "lib/errors"

class Product #< Addrecords
  attr_accessor :title, :price, :stock

  @@products = []

  def initialize(options={})
    @title = options[:title]
    @price = options[:price]
    @stock = options[:stock]
    #super(@@products, @title)
    add_to_products # adds new product
  end

  def self.all
    @@products
  end

  def self.find_by_title(ptitle) # finds product by title
    @@products.find{|product| product.title == ptitle}
  end


  def in_stock? # checks if product in stock
    @stock > 0
  end

  def self.in_stock # check in perticular product in stock
    @@products.select {|product| product.in_stock?}
  end

  def less_stock # deducts stock after purchase
    if in_stock?
      @stock -= 1
      check_stock
    else
      out_of_stock
    end
  end

  def add_stock # adds stock after product return
    @stock += 1
    check_stock
  end

  def check_stock # check if stock is less than 10
    if @stock < 10
      less_stock_error
    end
  end

  def self.print_stock_report_header # prints header for stock report
    puts "#{"".ljust(25)}Stock Report"
    print_line
    puts "#{"Product".ljust(35)} #{"Stock".ljust(35)}"
  end

  def self.print_stock_report # prints stock
    @@products.each do |product|
      puts "#{product.title.ljust(35)} #{product.stock}"
    end
  end

  def self.print_line # prints - line
    puts "-" * 50
  end

  def self.stock_report # prints stock report
    print_line
    print_stock_report_header
    print_line
    print_stock_report
    print_line
  end

  def out_of_stock
    # raise OutOfStockError, "Error : '#{@title}' is out of stock."
  end

  private

  def add_to_products # checks for duplicate
    product_exist(@title)?  duplicate_error : add_product
  end

  def product_exist(title) # finds product by title
    @@products.map {|product| product.title}.include?(title)
  end

  def duplicate_error # riase product dulplcate error
    #  raise DuplicateProductError, "Error : '#{@title}' already exists"
  end

  def less_stock_error # raise less stock error
    #  raise LessStockError, "Error : '#{@title}' stock in reserve"
  end

  def add_product # adds to porduct
    @@products << self
  end
end
