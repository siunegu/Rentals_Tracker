Landlord.destroy_all
Tenant.destroy_all
Property.destroy_all
Lease.destroy_all

#### Landlords Seed

	landlord_1 = Landlord.create!(
	 name: 'Landlord Default',
	 email: 'landlord@example.com',
	 password: 'password', # has to be at least 8 characters
	 password_confirmation: 'password'
	)

	landlord_2 = Landlord.create!(
	 name: 'Landlord Chan',
	 email: 'Chan@example.com',
	 password: 'password', # has to be at least 8 characters
	 password_confirmation: 'password'
	)

	tenant_1 = Tenant.create!(
	 name: 'Tenant Default',
	 email: 'tenant@example.com',
	 password: 'password', # has to be at least 8 characters
	 password_confirmation: 'password'
	)

	tenant_2 = Tenant.create!(
	 name: 'Tenant Bob',
	 email: 'bob@example.com',
	 password: 'password', # has to be at least 8 characters
	 password_confirmation: 'password'
	)


#### Properties Seed

	p1 = Property.create!(
		address: '3828 Piermont Dr',
		city: 'Albuquerque,',
		state: 'NM',
		price: 10000,
		description: "A business big enough that it could be listed on the NASDAQ goes belly up. Disappears! It ceases to exist without me. No, you clearly don't know who you're talking to, so let me clue you in. I am not in danger, Skyler. I AM the danger!",
		landlord_id: landlord_1.id
	)

	p2 = Property.create!(
		address: '808 Silver View Lookout',
		city: 'Fake City',
		state: 'FS',
		price: 5000,
		description: "I need support. Me! The almost 40-year old pregnant woman with the surprise baby on the way and the husband with lung cancer who disappears for hours on end. And I don't know where he goes and he barely even speaks to me anymore.",
		landlord_id: landlord_1.id
	)

	p3 = Property.create!(
		address: '906 Park Ave',
		city: 'Albuquerque',
		state: 'NM',
		price: 1000,
		description: "Don't you get it? On the outside it's a nail salon right, on the inside it's the best money laundering a growing boy could ask for. Wait, wait! Come back here. Sit. Come on, come on... humor me here for a second. You know you need to launder your money, right? ",		
		landlord_id: landlord_2.id
	)

	p4 = Property.create!(
		address: '4901 Cumbre Del Sur Ct',
		city: 'Albuquerque',
		state: 'NM',
		price: 1000,
		description: "I have been waiting. I've been waiting all day. Waiting for Gus to send one of his men to kill me. And it's you. Who do you know, who's okay with using children, Jesse? Who do you know... who's allowed children to be murdered... hmm? ",		
		landlord_id: landlord_2.id
	)

#### Lease Seeds

	lease_1 = Lease.create!(
		amount: 200,
		landlord_id: landlord_1.id,
		property_id: p1.id,
		tenant_id: tenant_1.id
	)
