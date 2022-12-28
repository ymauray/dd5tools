import 'package:appwrite/appwrite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Client? _client;
Account? _account;

final appWriteClientProvider = Provider<Client>((ref) {
  if (_client == null) {
    _client = Client();
    _client!
        .setEndpoint('https://appwrite.frenchguy.ch/v1')
        .setProject('630a57e60f0667ce163a');
  }

  return _client!;
});

final appWriteAcccountProvider = Provider<Account>((ref) {
  _account ??= Account(ref.read(appWriteClientProvider));

  return _account!;
});
