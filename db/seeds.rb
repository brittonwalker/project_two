# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(email:'bboy@dada.com', password:'bboysdada', password_confirmation:'bboysdada')
Post.create(title:'First Post', body:'First post body here it goes.....', user_id: 1)
Comment.create(content:'Wait what???', post_id: 1, user_id: 1)
