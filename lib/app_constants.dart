class AppConstant {
  static const baseUrl = "https://apiuserstg.ridealike.com";
  static const loginUrl = baseUrl + "/v1/user.UserService/Login";

  //profile
  static const profileBaseUrl = "https://api.profile.stg.ridealike.com";
  static const getProfileUrl =
      profileBaseUrl + "/v1/profile.ProfileService/GetProfile";

  static const updateEmailUrl = baseUrl + "/v1/user.UserService/UpdateEmail";
}
