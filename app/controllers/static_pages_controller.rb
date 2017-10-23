class StaticPagesController < ApplicationController
	# Returns true if the user is logged in, false otherwise.
   def logged_in?
       !current_user.nil?
  end
	#def home
		#if current_user
      #redirect_to posts_path
	# end
# end

#end

def home
  if 	logged_in?

  redirect_to "/admin"
   end
  end
end
