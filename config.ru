require "./lib/boot.rb"

map "/" do
	run GFI::Public
end

map "/dashboard" do
	run GFI::Dashboard
end

map "/fields" do
	run GFI::Fields
end

map "/documents" do
	run GFI::Documents
end

map "/forms" do
	run GFI::Forms
end

map "/user" do
	run GFI::Users
end
