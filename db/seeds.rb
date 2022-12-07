@user = User.new(
  first_name: "Tom",
  last_name: "Nook",
  email: "tom.nook@example.com",
  location: "Austin, TX"
)

# this is not deployed anywhere and seeds are dev only, it's fine
@user.password = "test123"
@user.save!

Device.create(
  name: "Tom Nook's laptop",
  os_name: "Mac",
  kind: "desktop",
  preferred_browser: "Chrome",
  user_id: @user.id
)
