class Expense < ApplicationRecord
  belongs_to :person

  before_create do
    person.update(credit: person.credit + price)
  end

  before_update do
    if person_id != person_id_was or price != price_was
      person_was = Person.find(person_id_was)
      person_was.update(credit: person_was.credit - price_was)
      person = Person.find(person_id)
      person.update(credit: person.credit + price)
    end
  end
  
  before_destroy do
    person.update(credit: person.credit - price)
  end

end
