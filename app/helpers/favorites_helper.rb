module FavoritesHelper
  def user_has_favorites?(user)
    user.favorites.count > 0 ? true : false
  end
end
