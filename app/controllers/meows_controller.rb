class MeowsController < ApplicationController
  # /posts/:post_id/meows
  def create
    # Find the Post that we're "meowing" at
    post = Post.find(params[:post_id])
    # Build a Meow by the current user for the post
    meow = current_user.meows.build(post: post)

    respond_to do |format|
      if meow.save
        meows = post.meows.count
        format.html { redirect_to :back, notice: "We heard your Meow!" }
        format.json { render json: { meow: meow, meows: meows } }
      else
        format.html { redirect_to :back }
        format.json { render json: meow.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    post = Meow.find(params[:id]).post

    current_user.meows.destroy(params[:id])

    meows = post.meows.count

    respond_to do |format|
    # Respond the same way we were before if the request format is html
    format.html do
      flash[:notice] = "All evidence of your meowing has been destroyed!"
      redirect_to :back
    end

    # Respond with a "204 No Content" to signify that the request has been
    # fulfilled
    format.json { render json: meows }
  end
  end
end
