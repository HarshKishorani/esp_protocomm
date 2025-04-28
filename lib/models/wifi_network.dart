/// Represents a scanned Wi-Fi Network.
class WifiNetworkInfo {
  final String ssid;
  final dynamic instance; // Keep dynamic if instance type is not strictly defined

  WifiNetworkInfo({
    required this.ssid,
    required this.instance,
  });
}
