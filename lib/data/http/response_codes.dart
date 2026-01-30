class ResponseCodes {
  static String response(var code) {
    switch (code) {
      case 500:
        return "Sorry for the inconveniences, there was a server error. Kindly try again at a later time";
      case 504:
        return "Sorry, the request timed out";
      case 404:
        return "This request to the Server cannot be established."; //Server api not found
      case 401:
        return "Unauthorised request.";
      default:
        return "An unknown error occurred.";
    }
  }
}
