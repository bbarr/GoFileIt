require "./lib/boot.rb"

map "/" do
	run GFI::Public
end

map "/documents" do
	run GFI::Documents
end

map "/user" do
	run GFI::Users
end

map "/dashboard" do
	run GFI::Dashboard
end
