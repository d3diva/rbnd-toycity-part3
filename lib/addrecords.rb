#require_relative "/errors"

class Addrecords
  def initialize(records, record, title)
    @records = records
    @record = record
    @title = title
    puts
    add_record
  end

  def add_record
    record_exist?? duplicate_error : new_record
  end

  def record_exist?
    @records.map {|record| record.'#{@title}'}.include?(@record)
  end

  def duplicate_error
    begin
      raise DuplicateCustomerError, "Error : '#{@record}' already exists"
      rescue => error
      puts error
    end
  end

  def new_record
    @records << self
  end
end
