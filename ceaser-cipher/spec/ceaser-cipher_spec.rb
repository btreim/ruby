require 'ceaser-cipher'

describe "#caeser_cipher" do

	it "does nothing with empty string" do 
		expect(caeser_cipher("",4)).to eq("")
	end

	it "returns original string with no shift" do 
		expect(caeser_cipher("test",nil)).to eq("test")
	end

	it "shifts one letter positively" do 
		expect(caeser_cipher("a",1)).to eq("b")
	end

	it "shifts one letter negitively" do 
		expect(caeser_cipher("a",-1)).to eq("z")
	end

	it "loops from 'z' to 'a'" do 
		expect(caeser_cipher("z",1)).to eq("a")
	end

	it "loops from 'y' to 'b'" do 
		expect(caeser_cipher("y",3)).to eq("b")
	end

	it "maintains original case" do 
		expect(caeser_cipher("A",1)).to eq("B")
	end

	it "maintains spaces" do 
		expect(caeser_cipher("What a day",1)).to eq("Xibu b ebz")
	end

	it "disregards non-words" do 
		expect(caeser_cipher("!!?#*$", 3)).to eq("!!?#*$")
	end
end