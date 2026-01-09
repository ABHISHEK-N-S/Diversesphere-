import 'package:diversesphere/app.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://dfqmsocxpokvplzuwblj.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRmcW1zb2N4cG9rdnBsenV3YmxqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njc2OTE3MDEsImV4cCI6MjA4MzI2NzcwMX0.Tkq9o5YJMsvRtrAaNPnAvtC57nwoZqij7c-4d7Y3GwQ',
  );

  runApp(const MyApp());
}
