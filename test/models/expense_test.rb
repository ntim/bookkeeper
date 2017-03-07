require 'test_helper'

class ExpenseTest < ActiveSupport::TestCase
  test "lifecycle" do
    p = Person.create(name: "time", credit: 1.5, password: "foo", password_confirmation: "foo")
    # Create expense.
    e = Expense.create(person: p, price: 1.0, description: "groceries")
    p = Person.find(p.id)
    assert_equal 2.5, p.credit
    # Update price.
    e.update(price: 1.5)
    p = Person.find(p.id)
    assert_equal 3.0, p.credit
    # Destroy.
    e.destroy
    p = Person.find(p.id)
    assert_equal 1.0, p.credit
  end
end
