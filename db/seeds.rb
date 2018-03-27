# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(uuid: User.uuid,
            userid: 'gwade',
            name: 'G. Wade Johnson',
            password: 'my_secret_password',
            email: 'gwade@example.com',
           );

User.create(uuid: User.uuid,
            userid: 'fred',
            name: 'Panzifredicopicog',
            password: 'not the Fredmobile',
            email: 'fred@example.com'
           );
