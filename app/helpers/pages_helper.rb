module PagesHelper
	def category_status courses_list_id, user_id
		CategoriesCourse.find_by(course_id: courses_list_id, user_id: user_id)
	end

	def count_result question_ids
		count = 0
  	anwsers = Answer.joins(:results).where(question_id: 1).select("answers.correct_status, results.choose_user")
  	anwsers.map{|answer| answer.choose_user == true && answer.correct_status == true ? count += 1 : count}
  	return count
	end

	def name_course pr_cours_id
		Course.find_by(id: pr_cours_id).name
	end

	def list_answer_wid wordlist_id
		answers = Answer.where(question_id: wordlist_id)
	end

	def result question_id, user_id
		Result.find_by(question_id: question_id, user_id: user_id)
		# a = result[answer_id]
		# byebug
	end

	def wordlist_learn
		course_learn = Course.list_course_learnd(current_user.id).select("id")
		count_word_list = Wordlist.where(course_id: course_learn)
	end
	def laycourse
		
	end

	def wordlist
		course_learn = Course.list_course(current_user.id).select("id")
		count_word_list = Wordlist.where(course_id: course_learn)
	end

	def new_word
		course_learn = Course.list_course_learnd(current_user.id).select("id")
		count_word_list = Wordlist.where.not(course_id: course_learn)
	end

	def user
		user_id = current_user.id
	end
end
