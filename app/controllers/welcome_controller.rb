class WelcomeController < ApplicationController
  def index
    @people = Person.all
    # Build table.
    @expenses = []
    @people.each do |p|
      elements = Expense.where(person: p).order(created_at: :desc).limit(10).collect {|e| e}
      # Fill up to 10 empty elements.
      rows = Array.new(10 - elements.length, nil)
      if elements.length > 0
        rows += elements
      end
      @expenses << rows
    end
    @expenses = @expenses.transpose
    # Calculate saldo
    sum = @people.inject(0) { |sum, p| sum + p.credit }
    @saldo = { }
    @people.each { |p| @saldo[p] = p.credit - sum / @people.length }
  end
end
