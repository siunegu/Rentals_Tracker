Landlord.destroy_all
Tenant.destroy_all

Landlord.create(
 name: 'Landlord Chan',
 email: 'landlord@example.com',
 password: 'password', # has to be at least 8 characters
 password_confirmation: 'password'
)

Tenant.create(
 name: 'Tenant Jones',
 email: 'tenant@example.com',
 password: 'password', # has to be at least 8 characters
 password_confirmation: 'password'
)

Property.create(
	address: '123 Fake Street',
	city: 'Fake City',
	state: 'FS',
	price: 10000,
	landlord_id: 1
)

Property.create(
	address: '808 Silver View Lookout',
	city: 'Fake City',
	state: 'FS',
	price: 5000,
	landlord_id: 1
)

Property.create(
	address: 'Fallen Log Plaza',
	city: 'Fake City',
	state: 'FS',
	price: 1000,
	landlord_id: 2
)

Property.create(
	address: '555 Shit House',
	city: 'Fake City',
	state: 'FS',
	price: 1000,
	landlord_id: 2
)