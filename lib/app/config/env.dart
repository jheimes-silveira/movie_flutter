class Env {
  static const env = {
    "url_base": "http://www.omdbapi.com",
  };

  static String getUrlBase() {
    return getEnv("url_base");
  }

  static String getEnv(String key) {
    return env[key];
  }
}
