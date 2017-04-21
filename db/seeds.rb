# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create!(email: 'foo@bar.com', password: 'qwerty123', name: 'Foo')
user.update!(api_token: 'foobar')

on_salebeacon = Beacon.create!(major: 0, minor: 0, code: '1234', status: 0)
disabled_beacon = Beacon.create!(major: 1, minor: 1, code: '1234', user: user, status: 1)
