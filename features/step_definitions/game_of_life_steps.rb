Given(/^the following setup$/) do |table|
  @game = GameOfLife.new
  @game.setup_generation(table.raw)
end

When(/^I evolve the board$/) do
  @game.next_generation
end

Then(/^the center cell should be dead$/) do
  expect(@game.generation.population.center_cell.alive?).to be false
end

Then(/^the center cell should be alive$/) do
  expect(@game.generation.population.center_cell.alive?).to be true
end

Then(/^I should see the following board$/) do |table|
  expect(@game.generation.population.to_a).to eql(table.raw)
end
