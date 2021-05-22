require "character"

describe "user_name" do
    context "given user input for a name" do
        it "returns their name" do
            expect(Character.user_name("").to be_a(String)
end