class FavoriteMailer < ApplicationMailer
  default from: 'alexgould17@gmail.com'

  def new_comment(user, post, comment)
    headers['Message-ID'] = "<comments/#{comment.id}@bloccit>"
    headers["In-Reply-To"] = "<post/#{post.id}@bloccit>"
    headers["References"] = "<post/#{post.id}@bloccit>"

    @user = user
    @post = post
    @comment = comment

    mail(to: user.email, subject: "New comment on #{post.title}")
  end

  def new_post(user, post, favorite)
    headers['Message-ID'] = "<favorite/#{favorite.id}@bloccit>"
    headers["In-Reply-To"] = "<post/#{post.id}@bloccit>"
    headers["References"] = "<post/#{post.id}@bloccit>"

    @user = user
    @post = post
    @favorite = favorite

    mail(to: user.email, subject: "You've favorited #{post.title}")
  end
end
