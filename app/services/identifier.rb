class Identifier
  def initialize auth, user=nil
    @auth = Hashie::Mash.new auth
    @user = user
  end

  def resolve
    identity = find_or_create_identity
    user     = ensure_user identity
    link identity, user
    user
  end

private

  def find_or_create_identity
    Identity.where(provider: @auth.provider, uid: @auth.uid).
      create_with(auth_data: @auth).
      first_or_create!
  end

  def ensure_user identity
    @user ||= identity.user
    return @user if @user

    @user = User.where(email: identity.email).
      create_with(
        first_name: identity.first_name,
        last_name:  identity.last_name,
        image_url:  identity.image,
        password:   Devise.friendly_token[0,20],
        gh_name:    identity.github_name
      ).first_or_create!
  end

  def link identity, user
    identity.update_attribute :user, user unless identity.user == user
  end
end
