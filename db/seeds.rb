Landlord.destroy_all
Tenant.destroy_all
Property.destroy_all
Lease.destroy_all
Message.destroy_all
CreditCard.destroy_all

#### Landlords Seeds

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

#### Tenants Seeds

	tenant_1 = Tenant.create!(
	 name: 'Tenant Default',
	 email: 'tenant@example.com',
	 password: 'password', # has to be at least 8 characters
	 password_confirmation: 'password'
	)

	tenant_2 = Tenant.create!(
	 name: 'Tenant Rich',
	 email: 'rich@example.com',
	 password: 'password', # has to be at least 8 characters
	 password_confirmation: 'password'
	)

	tenant_3 = Tenant.create!(
	 name: 'Tenant Poorman',
	 email: 'poorman@example.com',
	 password: 'password', # has to be at least 8 characters
	 password_confirmation: 'password'
	)


#### Properties Seeds

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
		landlord_id: landlord_2.id
	)

	p3 = Property.create!(
		address: '906 Park Ave',
		city: 'Albuquerque',
		state: 'NM',
		price: 1000,
		description: "Don't you get it? On the outside it's a nail salon right, on the inside it's the best money laundering a growing boy could ask for. Wait, wait! Come back here. Sit. Come on, come on... humor me here for a second. You know you need to launder your money, right? ",		
		landlord_id: landlord_1.id
	)

	p4 = Property.create!(
		address: '4901 Cumbre Del Sur Ct',
		city: 'Albuquerque',
		state: 'NM',
		price: 1000,
		description: "I have been waiting. I've been waiting all day. Waiting for Gus to send one of his men to kill me. And it's you. Who do you know, who's okay with using children, Jesse? Who do you know... who's allowed children to be murdered... hmm? ",		
		landlord_id: landlord_2.id
	)

	p5 = Property.create!(
		address: '384 Cumbre Del Sur Ct',
		city: 'Albuquerque',
		state: 'NM',
		price: 1000,
		description: "The blowfish puffs himself up four, five times larger than normal and why? Why does he do that? So that it makes him intimidating, that's why. ",		
		landlord_id: landlord_2.id
	)	

#### Lease Seeds

	lease_1 = Lease.create!(
		name: tenant_1.name,
		description: "I have been waiting. I've been waiting all day. Waiting for Gus to send one of his men to kill me. And it's you. Who do you know, who's okay with using children, Jesse? Who do you know... who's allowed children to be murdered... hmm? ",				
		amount: 290000,
		interval: 1,
		landlord_id: landlord_1.id,
		property_id: p1.id,
		tenant_id: tenant_1.id,
		approved: true
	)

	lease_2 = Lease.create!(
		name: tenant_2.name,
		description: "I have been waiting. I've been waiting all day. Waiting for Gus to send one of his men to kill me. And it's you. Who do you know, who's okay with using children, Jesse? Who do you know... who's allowed children to be murdered... hmm? ",		
		amount: 93000,
		interval: 1,
		landlord_id: landlord_1.id,
		property_id: p1.id,
		tenant_id: tenant_2.id,
		approved: false
	)

	lease_3 = Lease.create!(
		name: tenant_3.name,
		description: "I have been waiting. I've been waiting all day. Waiting for Gus to send one of his men to kill me. And it's you. Who do you know, who's okay with using children, Jesse? Who do you know... who's allowed children to be murdered... hmm? ",				
		amount: 100000,
		interval: 1,
		landlord_id: landlord_1.id,
		property_id: p1.id,
		tenant_id: tenant_3.id,
		approved: true
	)

	lease_4 = Lease.create!(
		name: tenant_3.name,
		description: "I have been waiting. I've been waiting all day. Waiting for Gus to send one of his men to kill me. And it's you. Who do you know, who's okay with using children, Jesse? Who do you know... who's allowed children to be murdered... hmm? ",				
		amount: 120000,
		interval: 1,
		landlord_id: landlord_2.id,
		property_id: p2.id,
		tenant_id: tenant_3.id,
		approved: false
	)

#### Messages Seeds

	message_1 = Message.create!(
		to: "tenant_example.com",
		from: "landlord_example.com",
		subject: "Your Lease is now Subscribed to a Card",
		body: "Thanks for the information.",
		landlord_id: landlord_1.id
	)

	message_2 = Message.create!(
		to: "tenant_example.com",
		from: "landlord_example.com",
		subject: "Your Lease is now Subscribed to a Card",
		body: "Subscribe your rent to your Property Securely through Stripe. We do not store your information.",
		landlord_id: landlord_1.id
	)	

#### Credit Card Seeds

	card_1 = CreditCard.create!(
		stripe_id: "test_234238472934",
		tenant_id: tenant_1.id
	)	