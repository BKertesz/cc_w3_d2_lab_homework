require_relative 'model/bounty'

system("clear")

test_hash = {
  'name' => 'Zorg',
  'species' => 'Telomg',
  'bounty_value' => '12000',
  'homeworld' => 'Skri-4'
}

# bounty1 = Bounty.new(test_hash)
# bounty1.name = 'Zekris'
# bounty1.save
all_bounties = Bounty.load
# test_update = all_bounties.first
# test_update.bounty_value = '54000'
# test_update.update()
# test_delete = all_bounties.first
# test_delete.delete

# zorg = Bounty.find_by_name("Zorg")
# p zorg
# test_id_find = Bounty.find('3')
# item =  Bounty.find('3')
# # binding.pry
# p item


puts ""
all_bounties = Bounty.load
puts "All Entries:"
all_bounties.each{|x| puts "#{x.id}.Name:#{x.name} Species:#{x.species} Bounty Value:#{x.bounty_value} Homeworld:#{x.homeworld}"}


# EOF
