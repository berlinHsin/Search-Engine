class IndexController < ApplicationController
	def index 
	end
	def upload 
	end
	def search
	end
	def child
		id = params[:id]
		@Tags = Tag.where(:parent=>id)
		render :json => @Tags
	end
	def tagging
		@Tags = Tag.where(:parent=>0)
	end
	def addTag
		parents = params[:parents]
		label  = params[:tag]
		if not parents
			@nTag = Tag.new(:label=>label,:parent=>0) 
			@nTag.save()
		elsif
			for parent in parents 
				@nTag = Tag.new(:label=>label,:parent=>parent) 
				@nTag.save()
			end
		end
		flash[:notice] = "已加入標籤"
		redirect_to(:action=>'tagging')
	end

end
