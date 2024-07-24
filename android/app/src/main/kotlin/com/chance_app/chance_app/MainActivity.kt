package com.chance_app.chance_app

import android.content.Intent
import android.net.Uri
import android.util.Log
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

var myEmail: String = ""
var isAppSentData: Boolean = true

class MainActivity : FlutterActivity() {
    private val CHANNELCaller = "caller"
    private val CHANNELLocation = "location_service"
    private val CHANNELLocationDisable = "location_service_disable"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNELCaller).setMethodCallHandler { call, result ->
            if (call.method == "makeCall") {
                val phoneNumber = call.arguments?.toString()
                if (phoneNumber != null) {
                    makeCall(phoneNumber)
                    result.success(null)
                } else {
                    result.error("MISSING_PHONE_NUMBER", "Phone number is missing", null)
                }
            } else {
                result.notImplemented()
            }
        }

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNELLocation).setMethodCallHandler { call, result ->
            if (call.method == "startLocationService") {
                val getMyEmail = call.arguments?.toString()
                if (getMyEmail != null) {
                    isAppSentData = true
                    myEmail = getMyEmail
                    result.success(null)
                    Log.d("LocationService.TAG", "Loading location")
                    println("Loading location")
                    val serviceIntent = Intent(this, LocationService::class.java)
                    // Запускаем службу
                    startService(serviceIntent)
                    result.success("Loading location")
                } else {
                    result.error("MISSING_EMAIL", "Email is missing", null)
                }
                // Создаем интент для запуска службы

            } else {
                result.notImplemented()
            }
        }
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNELLocationDisable).setMethodCallHandler { call, result ->
            if (call.method == "pauseLocationService") {
                val isAppShouldSentLocation: Boolean = call.arguments?.toString().toBoolean()
                isAppSentData = false
                result.success(null)
                Log.d("LocationService.TAG", "Pause location")
                println("Pause location")
                val serviceIntent = Intent(this, LocationService::class.java)
                // Запускаем службу
                if (isAppShouldSentLocation) {
                    stopService(serviceIntent)
                }

                result.success("Location paused")

            } else {
                result.notImplemented()
            }
        }
    }
    private fun makeCall(phoneNumber: String) {
        // Ваша логика для совершения звонка на переданный номер телефона
        // Например:
        val intent = Intent(Intent.ACTION_CALL)
        intent.data = Uri.parse("tel:$phoneNumber")
        startActivity(intent)
    }

}