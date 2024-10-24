import 'dart:convert';
import 'package:web_socket_channel/web_socket_channel.dart';

class OpenClient {
  WebSocketChannel? _channel;
  String url;
  final Map<String, Function> _callbacks = {};
  int _callbackIndex = 0;

  OpenClient(this.url);

  void connect() {
    _channel = WebSocketChannel.connect(Uri.parse(url));
    _channel?.stream.listen(_onMessage, onError: _onError, onDone: _onClose);
  }

  void _onMessage(dynamic message) {
    var msg = jsonDecode(message);
    if (msg['callbackid'] != null) {
      var callbackId = msg['callbackid'];
      var callback = _callbacks.remove(callbackId);
      if (callback != null) {
        callback(msg['error'], msg['response']);
      }
    }
  }

  void _onError(error) {
    print('Connection error: $error');
  }

  void _onClose() {
    print('Connection closed');
  }

  void rpc(Map<String, dynamic> msg, Function callback) {
    var callbackId = (_callbackIndex++).toString();
    msg['callbackid'] = callbackId;
    _callbacks[callbackId] = callback;
    _channel?.sink.add(jsonEncode(msg));
  }

  void close() {
    _channel?.sink.close();
  }
}

/**
 * 
 * 
 * 
 * 
  var client = OpenClient('wss://opendb.yourserver.com/?token=123456');
  client.connect();

  client.rpc({'type': 'find', 'db': 'users'}, (err, response) {
    if (err != null) {
      print('Error: $err');
    } else {
      print('Response: $response');
    }
  });
 */