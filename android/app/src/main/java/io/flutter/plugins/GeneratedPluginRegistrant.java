package io.flutter.plugins;

import androidx.annotation.Keep;
import androidx.annotation.NonNull;

import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.embedding.engine.plugins.shim.ShimPluginRegistry;

/**
 * Generated file. Do not edit.
 * This file is generated by the Flutter tool based on the
 * plugins that support the Android platform.
 */
@Keep
public final class GeneratedPluginRegistrant {
  public static void registerWith(@NonNull FlutterEngine flutterEngine) {
    ShimPluginRegistry shimPluginRegistry = new ShimPluginRegistry(flutterEngine);
    flutterEngine.getPlugins().add(new io.flutter.plugins.firebase.cloudfirestore.CloudFirestorePlugin());
    flutterEngine.getPlugins().add(new io.flutter.plugins.connectivity.ConnectivityPlugin());
    flutterEngine.getPlugins().add(new io.flutter.plugins.firebase.core.FirebaseCorePlugin());
    flutterEngine.getPlugins().add(new io.flutter.plugins.firebasemessaging.FirebaseMessagingPlugin());
    flutterEngine.getPlugins().add(new zhuoyuan.li.fluttershareme.FlutterShareMePlugin());
      io.github.ponnamkarthik.toast.fluttertoast.FluttertoastPlugin.registerWith(shimPluginRegistry.registrarFor("io.github.ponnamkarthik.toast.fluttertoast.FluttertoastPlugin"));
      com.rioapp.demo.imeiplugin.ImeiPlugin.registerWith(shimPluginRegistry.registrarFor("com.rioapp.demo.imeiplugin.ImeiPlugin"));
    flutterEngine.getPlugins().add(new com.lyokone.location.LocationPlugin());
    flutterEngine.getPlugins().add(new io.flutter.plugins.pathprovider.PathProviderPlugin());
    flutterEngine.getPlugins().add(new io.flutter.plugins.sharedpreferences.SharedPreferencesPlugin());
      com.drenther.upi_pay.UpiPayPlugin.registerWith(shimPluginRegistry.registrarFor("com.drenther.upi_pay.UpiPayPlugin"));
    flutterEngine.getPlugins().add(new io.flutter.plugins.urllauncher.UrlLauncherPlugin());
  }
}
