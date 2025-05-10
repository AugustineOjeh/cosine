import 'dart:async';
import 'dart:io';
import 'package:cosine/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseRequest {
  static Future<T?> req<T>(BuildContext context, Future<T> req) async {
    try {
      return await req;
    } on PostgrestException catch (e) {
      CustomSnackbar.main(context, 'Database error: ${e.message}');
      return null;
    } on SocketException {
      CustomSnackbar.main(
          context, 'No internet connection. Check your network.');
      return null;
    } on TimeoutException {
      CustomSnackbar.main(context, 'Request timed out. Please try again.');
      return null;
    } on HttpException catch (e) {
      CustomSnackbar.main(context, 'HTTP error: ${e.message}');
      return null;
    } catch (e) {
      CustomSnackbar.main(context,
          'Something unexpected went wrong. Please, report this to us.');
      return null;
    }
  }

  static Future<bool> auth(BuildContext context, Future<dynamic> req) async {
    try {
      await req;
      return true;
    } on PostgrestException catch (e) {
      if (!context.mounted) return false;
      CustomSnackbar.main(context, 'Database error: ${e.message}');
      return false;
    } on SocketException {
      if (!context.mounted) return false;
      CustomSnackbar.main(
          context, 'No internet connection. Check your network.');
      return false;
    } on TimeoutException {
      if (!context.mounted) return false;
      CustomSnackbar.main(context, 'Request timed out. Please try again.');
      return false;
    } on HttpException catch (e) {
      if (!context.mounted) return false;
      CustomSnackbar.main(context, 'HTTP error: ${e.message}');
      return false;
    } on AuthApiException catch (e) {
      if (!context.mounted) return false;
      CustomSnackbar.main(context, e.message.toString());
      return false;
    } catch (e) {
      if (!context.mounted) return false;
      CustomSnackbar.main(context,
          'Something unexpected went wrong. Please, report this to us.');
      return false;
    }
  }
}
