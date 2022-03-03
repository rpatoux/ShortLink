require "rails_helper"

# RSpec.describe Link do

#     it "always has an original URL and a lookup code" do
#         link = Link.new(
#             original_url: "https://www/madeupurl/repo/test_1",
#             lookup_code: "1234567"
#         )
#         link.save
#     end

# end

RSpec.describe Link, type: :model do 
    it "it is valid if it has an original URL and a lookup code" do
        link = Link.new(
            original_url: "https://www/madeupurl/repo/test_1",
            lookup_code: "1234567"
    )
    expect(link.valid?).to be(true)
    end

    it "it is invalid if it does not have a lookup code" do
        link = Link.new(
            original_url: "https://www/madeupurl/repo/test_1"
    )
    expect(link.valid?).to be(false)
    end

    it "it is invalid if it does not have an original_url" do
        link = Link.new(
            lookup_code: "1234567"
    )
    expect(link.valid?).to be(false)
    
    end

    it "it is invalid if the lookup code already exists" do
        link_1 = Link.new(
            original_url: "https://www/madeupurl/repo/test_1",
            lookup_code: "1234567"
        )
        link_1.save

        link_2 = Link.new(
            original_url: "https://www/madeupurl/repo/test_2",
            lookup_code: "1234567"
        )
    expect(link_2.valid?).to be(false)
    end

    it "is invalid if not formatted properly" do
      link = Link.new(
          original_url: "zkahjdzbjbaja",
          lookup_code: "1234567"
      )
      expect(link.valid?).to be(false)
    end

end