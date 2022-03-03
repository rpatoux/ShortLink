require "rails_helper"

RSpec.describe Shortener do

    it "shortens a given URL to a 7 character code" do
        url = "https://www.madeupurl/repo/"
        shortener = Shortener.new(url)
        expect(shortener.lookup_code.length).to eq(7)
    end

    it "gives each URL its own code" do
        url = "https://www.madeupurl/repo/test_1"
        shortener = Shortener.new(url)
        code_1 = shortener.lookup_code

        url = "https://www.madeupurl/repo/test_2"
        shortener = Shortener.new(url)
        code_2 = shortener.lookup_code

        expect(code_2).not_to eq(code_1)
    end

    # OBSOLETE
    # it "always gives the same URL the same code" do
    #     url = "https://www/madeupurl/repo/test_1"
    #     shortener = Shortener.new(url)
    #     code_a = shortener.lookup_code

    #     url = "https://www/madeupurl/repo/test_1"
    #     shortener = Shortener.new(url)
    #     code_b = shortener.lookup_code

    #     expect(code_a).not_to eq(code_b)
    # end


    it "generates a Link record with a unique lookup code" do
        url = "https://www.madeupurl/repo/test_1"
        shortener = Shortener.new(url)
        link_1 = shortener.generate_short_link
        expect(link_1.valid?).to be(true)

        link_2 = shortener.generate_short_link
        expect(link_2.valid?).to be(true)
    end

end 