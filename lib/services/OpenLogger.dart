// Service OpenLogger
import 'dart:convert';
import 'dart:developer' as developer;
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:device_info_plus/device_info_plus.dart';

class OpenLogger {
  final String token;
  final String url;
  final bool autoConfig;

  OpenLogger({
    required this.token,
    required this.url,
    this.autoConfig = false,
  }) {
    if (url.isEmpty || token.isEmpty) {
      throw ArgumentError('URL und Token dürfen nicht leer sein');
    }
  }

  Future<String> _getIpAddress() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty) {
        return result.first.address;
      }
    } catch (_) {}
    return 'Unknown';
  }

  Future<String> _getUserAgent() async {
    if (kIsWeb) {
      return 'WebApp';
    }
    return 'FlutterApp/${Platform.operatingSystem}';
  }

  Future<String> _getDeviceName() async {
    final deviceInfo = DeviceInfoPlugin();
    try {
      if (Platform.isAndroid) {
        final androidInfo = await deviceInfo.androidInfo;
        return androidInfo.model;
      } else if (Platform.isIOS) {
        final iosInfo = await deviceInfo.iosInfo;
        return iosInfo.name;
      }
    } catch (_) {
      return 'Unknown Device';
    }
    return 'Unknown Device';
  }

  String _getCallerInfo() {
    final stackTrace = StackTrace.current.toString().split('\n')[2];
    final match = RegExp(r'(\S+)\s+\(.*:(\d+):\d+\)').firstMatch(stackTrace);
    if (match != null) {
      final fileName = match.group(1) ?? 'Unknown file';
      final lineNumber = match.group(2) ?? 'Unknown line';
      return '$fileName:$lineNumber';
    }
    return 'Unknown source';
  }

  Future<void> log({
    required String type,
    required String message,
    Map<String, dynamic>? data,
    String? app,
    String? url,
    String? userid,
    String? username,
    String? schema,
    String? reference,
  }) async {
    final callerInfo = _getCallerInfo();
    final logData = {
      'type': type,
      'data': jsonEncode(data ?? {}),
      'app': app ?? 'Total.js OpenLogger Dart/Flutter Client',
      'url': url,
      'userid': userid,
      'username': username ?? (autoConfig ? await _getDeviceName() : null),
      'schema': schema,
      'reference': reference,
      'message': message,
      'ua': autoConfig ? await _getUserAgent() : null,
      'ip': autoConfig ? await _getIpAddress() : null,
      'caller': callerInfo,  // Verwenden der callerInfo
    };

    try {
      final uri = Uri.parse('${this.url}/?token=$token');
      final response = await http.post(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(logData),
      );

      if (response.statusCode != 200) {
        developer.log('Failed to send log. Status code: ${response.statusCode}', name: 'OpenLogger');
      } else {
        developer.log('Log sent successfully.', name: 'OpenLogger');
      }
    } catch (error) {
      developer.log('Error occurred while sending log: $error', name: 'OpenLogger');
    }
  }
}
