2.times  do
	user = User.create({
		name: Faker::Name.name,  
		email: Faker::Internet.email
  })
  
  3.times do
    account = Account.create({
      user: user,
      description: Faker::Company.name,
      current_balance: 0
    })

    4.times do 
      account.add_account_entry(entry_type: :in, amount: Faker::Number.decimal(2))
      account.save!
    end
  end
end