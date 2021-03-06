# Given(/^I have article titled Cincinnati Bengals, Denver Broncos$/) do

# NAO ESQUECER DE RODAR O COMANDO rake db:test:prepare
# Get webrat_steps.rb on https://github.com/railscasts/155-beginning-with-cucumber/blob/master/blog/features/step_definitions/webrat_steps.rb

Given(/^I have article titled "(.+)"$/) do |titles| # (.+) - serve como parametro variavel do bloco ao inves de passar nomes fixos, como Dever Broncos
	titles.split(', ').each do |title| # separa e divide os 'titles'
		Article.create!(:title => title)
		# a = Article.create!(:title => title)
		# puts(a.inspect)
	end
	# puts(Article.all.count)
end

Given(/^I have no articles$/) do
  Article.delete_all
end

Then(/^I should have ([0-9]+) article$/) do |arg1|
  Article.count.should be == arg1.to_i
end

When /^I follow the view link for "(.+)"$/ do |name|
  click_link(name)
end

Then(/^I should confirm a javascript dialog$/) do
  page.driver.browser.switch_to.alert.accept
  # page.driver.browser.switch_to.alert.dismiss
  # page.driver.browser.switch_to.alert.text
end