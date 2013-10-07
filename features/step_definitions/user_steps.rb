Given(/^the following user data$/) do |table|
  table.hashes.each do |hash|
  	# puts(hash.inspect)
  	# email = "#{hash["username"]}@email.com"
  	# puts(email)
  	# hash.delete("username")
  	# hash["email"] = email
  	User.create!(hash)
  end
end

Given(/^I am logged with "(.*?)" with password "(.*?)"$/) do |arg1, arg2|
  visit new_user_session_path
  fill_in "Email", with: arg1
  fill_in "Password", with: arg2
  click_button "Sign in"
end

When(/^I visit profile for "(.*?)"$/) do |arg1|
	# user = User.find_by_email!(arg1)
	# visit user_url(user)
  visit admin_index_path
end