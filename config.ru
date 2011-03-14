require "./lib/boot.rb"

map "/" do
	run GFI::Public
end

map "/documents" do
	run GFI::Documents
end

map "/account" do
	run GFI::Accounts
end
