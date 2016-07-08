#require_relative "lib/errors"

class Product #< Addrecords
  attr_accessor :title, :price, :stock

  @@products = []

  def initialize(options={})
    @title = options[:title]
    @price = options[:price]
    @stock = options[:stock]
    #title = "title"
    #super(@@products, @title, title)
    add_to_products
  end

  def self.all
    @@products
  end

  def self.find_by_title(ptitle)
    @@products.find{|product| product.title == ptitle}
  end


  def in_stock?
    @stock > 0
  end

  def self.in_stock
    @@products.select {|product| product.in_stock?}
  end

  private

  def add_to_products
    product_exist(@title)?  duplicate_error : add_product
  end

  def product_exist(title)
    @@products.map {|product| product.title}.include?(title)
  end

  def duplicate_error
    begin
      raise DuplicateProductError, "Error : '#{@title}' already exists"
      rescue => error
      puts error
    end
  end

  def add_product
    @@products << self
  end



end
