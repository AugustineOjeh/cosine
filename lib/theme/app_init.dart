import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseInit {
  static final prod = _Production();
  static final dev = _Development();
  static final instance = Supabase.instance.client;
}

/// Production creds
class _Production {
  // TODO: Change production keys before launch
  String url = 'https://ilosexvvijazznwlevyt.supabase.co';
  String key =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imlsb3NleHZ2aWphenpud2xldnl0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDAyMzEyNjAsImV4cCI6MjA1NTgwNzI2MH0.XKKph_9nQoY7ezjt18fajjUhHnhKjJ5W9qwnDPvJSIw';
}

/// Development creds
class _Development {
  String url = 'https://ilosexvvijazznwlevyt.supabase.co';
  String key =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imlsb3NleHZ2aWphenpud2xldnl0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDAyMzEyNjAsImV4cCI6MjA1NTgwNzI2MH0.XKKph_9nQoY7ezjt18fajjUhHnhKjJ5W9qwnDPvJSIw';
}
