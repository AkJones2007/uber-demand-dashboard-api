# Markets
ri_providence = Market.create!( country: 'United States', region: 'Rhode Island', city: 'Providence' )
ma_boston = Market.create!( country: 'United States', region: 'Massachusetts', city: 'Boston' )
me_portland = Market.create!( country: 'United States', region: 'Maine', city: 'Portland' )
me_greater_maine = Market.create!( country: 'United States', region: 'Maine', city: 'Greater Maine' )

# Areas

# Providence
[{ name: 'Providence - Downtown', latitude: '41.8238572', longitude: '-71.4163414' },
 { name: 'Providence - College Hill', latitude: '41.8292731', longitude: '-71.4058434' },
 { name: 'Providence - Federal Hill', latitude: '41.8203997', longitude: '-71.4369277' },
 { name: 'Providence - Elmwood', latitude: '41.7996497', longitude: '-71.4267767' },
 { name: 'Providence - Elmhurst/PC', latitude: '41.8428216', longitude: '-71.4507607' },
 { name: 'Providence - Rhode Island College', latitude: '41.8426417', longitude: '-71.4690479' },
 { name: 'Providence - Rhode Island Hospital', latitude: '41.811901', longitude: '-71.411148' },
 { name: 'TF Green Airport', latitude: '41.7274446', longitude: '-71.4443578' },
 { name: 'Cranston', latitude: '41.7685216', longitude: '-71.5383547' },
 { name: 'Pawtucket', latitude: '41.8773936', longitude: '-71.41318' },
 { name: 'East Providence', latitude: '41.7984692', longitude: '-71.3910396' },
 { name: 'North Providence', latitude: '41.8578387', longitude: '-71.4740499' },
 { name: 'Cumberland', latitude: '41.9559941', longitude: '-71.4693081' },
 { name: 'Woonsocket', latitude: '41.9977106', longitude: '-71.534084' },
 { name: 'Twin River Casino', latitude: '41.887', longitude: '-71.449407' },
 { name: 'Bryant University', latitude: '41.921526', longitude: '-71.541253' },
 { name: 'Warwick', latitude: '41.645649', longitude: '-71.5592217' },
 { name: 'North Kingstown', latitude: '41.5760177', longitude: '-71.5217023' },
 { name: 'South Kingstown/URI', latitude: '41.4853379', longitude: '-71.5312367' },
 { name: 'Greater Washington County', latitude: '41.479142', longitude: '-71.7765228' },
 { name: 'Bristol County', latitude: '41.7250016', longitude: '-71.2861992' },
 { name: 'Newport', latitude: '41.4861087', longitude: '-71.3422778' },
 { name: 'Portsmouth', latitude: '41.6009035', longitude: '-71.3667486' },
 { name: 'Jamestown', latitude: '41.5112383', longitude: '-71.393241' }]
.each do |area|
  ri_providence.areas.create!(area)
end
