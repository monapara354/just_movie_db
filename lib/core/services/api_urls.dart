class ApiUrl {
  /// Authentication
  static const socialLogin = "api/auth/social-auth/";
  static const registerUser = "api/auth/register/";
  static const loginUser = "api/auth/login/";
  static const verifyEmailOtp = "api/auth/verify-email/";
  static const resendOtp = "api/auth/resend-otp/";
  static const resetPasswordOtpSend = "api/auth/reset-password/";
  static const setNewPassword = "api/auth/set-password/";
  static const refreshToken = "api/auth/refresh-token/";

  /// users
  static const updateProfile = "api/auth/users/current-user/update-profile/";
  static const getUser = "api/auth/users/";

  /// posts
  static const postPreview = "api/posts/metadata/preview/";
  static const posts = "api/posts/";
  static const timeline = "api/timeline";

  /// Bookmarks
  static const addBookmark = "api/posts/bookmark/";
  static const myBookmark = "api/posts/bookmark/my-bookmarks/";
}
