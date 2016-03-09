# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
group = Group.create(name: "Test Group")

5.times do
	user = User.create(email: Faker::Internet.email, name: Faker::Name.first_name)
	association = group.users_groups.build(group: group, user: user)
	association.save
end

Question.create(
	group_id: 1,
	question_text: "Budget?",
	question_type: "Budget")

	QuestionOption.create(
	question_id: 1,
	option_text: "<RM10")

		Vote.create(
			user_id: 1,
			question_options_id: 1)

	QuestionOption.create(
	question_id: 1,
	option_text: "RM10-20")

		Vote.create(
		user_id: 2,
		question_options_id: 2)

		Vote.create(
		user_id: 3,
		question_options_id: 2)

		Vote.create(
		user_id: 4,
		question_options_id: 2)

	QuestionOption.create(
	question_id: 1,
	option_text: "RM20-30")

		Vote.create(
		user_id: 5,
		question_options_id: 3)