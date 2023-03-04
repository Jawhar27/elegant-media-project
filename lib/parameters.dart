bool isDev = true;

class ApiConstants {
  static String baseUrl = isDev ? "https://dl.dropboxusercontent.com/" : "";

  // Get All Hotel Data
  static String getAllHotelData = "${baseUrl}s/6nt7fkdt7ck0lue/hotels.json";
}
