class CommentsController < ApplicationController
    before_action :set_post
    
    def create
        @comment = @post.comments.build(comment_params)
        @comment.user_id = current_user.id
       
        if @comment.save
            flash[:success] = "The comment has been submitted successfully!"
            redirect_to root_path
        else
            flash[:danger] = "There was an error submitting the comment"
            redirect_to root_path
        end
    end
    
    def destroy
        @comment = @post.comments.find(params[:id])
        @comment.destroy
        redirect_to root_path
    end
    
    def comment_params
        params.require(:comment).permit(:content)
    end
    
    def set_post  
        @post = Post.find(params[:post_id])
    end  
end
