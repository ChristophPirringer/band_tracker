class Band < ActiveRecord::Base
  has_and_belongs_to_many(:venues)

  validates :name, :price, :uniqueness => true, :presence => true
  validate :we_hate_nickelback

  def we_hate_nickelback
    if name == "Nickelback"
      errors.add(:name, "i refuse to add Nickelback!")
    end
  end


  before_save(:capitalize_name)

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




end
