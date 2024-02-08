String getGreeting() {
  var now = DateTime.now();
  var hour = now.hour;

  if (hour < 12) {
    return "Good morning! ⛅";
  } else if (hour < 18) {
    return "Good afternoon! ☀️";
  } else {
    return "Good evening! 🌙";
  }
}
