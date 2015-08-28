class Venue < ActiveRecord::Base
  has_and_belongs_to_many(:bands)

  validates :name, :price, :uniqueness => true, :presence => true

  before_save(:capitalize_name, :add_letter)

    scope(:not_done, -> do
      where({:done => false})
    end)

  private

    define_method(:capitalize_name) do
      input_string = self.name.split(" ")

      input_string.each() do |word|
        word.capitalize!()
      end
      self.name=input_string.join(" ")
    end


    define_method(:add_letter) do
      input_string = self.name.split(" ")

       if input_string.length() == 1
         input_string[0].concat(" Man!")
         self.name=input_string[0]
       end
       self.name()
    end


end
