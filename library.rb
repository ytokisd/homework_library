require 'yaml'
require './utils.rb'
class Library
  def initialize(datafile)
    @utils = Utils.new(datafile)
  end
  def most_popular_book
    lib = @utils.load_file
    puts lib[:orders].group_by {|orders| orders[:book]}.sort_by {|key, value| value.length}.last.first
  end
  def often_takes_book
    lib = @utils.load_file
    puts lib[:orders].group_by {|orders| orders[:reader]}.sort_by {|key, value| value.length}.last.first
  end
  def three_popular_books
    lib = @utils.load_file
    b =  lib[:orders].group_by {|orders| orders[:book]}.sort_by {|key, value| value.length}.last(3)
    3.times do
      puts "Book #{b.last[0]} was ordered #{b.last[1].length} times"
      b.pop
    end
  end
  def save_to_file(destination)
    @utils.write_file(destination)
  end
  def load_data
    puts @utils.load_file
  end
end
