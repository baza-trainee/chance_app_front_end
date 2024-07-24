package com.chance_app.chance_app

import android.Manifest
import android.annotation.SuppressLint
import android.app.*
import android.content.Context
import android.content.Intent
import android.content.pm.PackageManager
import android.location.Location
import android.location.LocationListener
import android.location.LocationManager
import android.location.LocationProvider
import android.os.Binder
import android.os.Build
import android.os.Bundle
import android.os.IBinder
import android.util.Log
import androidx.annotation.RequiresApi
import io.github.jan.supabase.SupabaseClient
import io.github.jan.supabase.createSupabaseClient
import io.github.jan.supabase.postgrest.Postgrest
import io.github.jan.supabase.postgrest.from
import kotlinx.coroutines.GlobalScope
import kotlinx.coroutines.launch
import java.text.SimpleDateFormat
import java.util.*

class LocationService : Service(), LocationListener {

    private lateinit var locationManager: LocationManager
    private lateinit var supabase: SupabaseClient
    private val binder: IBinder = LocalBinder()

    inner class LocalBinder : Binder() {
        fun getService(): LocationService = this@LocationService
    }

    override fun onBind(intent: Intent?): IBinder? {
        return binder
    }


    override fun onCreate() {
        super.onCreate()
        locationManager = getSystemService(Context.LOCATION_SERVICE) as LocationManager
        supabase = createSupabaseClient(
                supabaseUrl = "https://tnvxszbqdurbkpnvjvgz.supabase.co",
                supabaseKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRudnhzemJxZHVyYmtwbnZqdmd6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTA4NDU5NjUsImV4cCI6MjAyNjQyMTk2NX0.I_Tf2UAA5Qo05EOSR2HXkv9yMun2NyixOZtCyr3OvoA"
        ) {
            install(Postgrest)
        }
        Log.d(TAG, "Starting loading location")
    }

    @RequiresApi(Build.VERSION_CODES.O)
    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        requestLocationUpdates()
        startForeground()

        return START_STICKY
    }

    override fun onLocationChanged(location: Location) {
        println("Latitude: ${location.latitude}, Longitude: ${location.longitude}")
        Log.d(TAG, "Latitude: ${location.latitude}, Longitude: ${location.longitude}")
        Log.d(TAG, "myEmail: ${myEmail}")
        if (isAppSentData) {
            try {

                GlobalScope.launch {

                    supabase.from("ward_location").update(
                            {
                                set("latitude", location.latitude)
                                set("longitude", location.longitude)
                                set("when", SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSSZ", Locale.getDefault()).format(Date()))
                            }
                    ) {
                        filter {
                            eq("myEmail", myEmail)
                        }
                    }
                }
            } catch (e: Exception) {
                Log.e(TAG, "Error in onLocationChanged: ${e.message}")
                e.printStackTrace()
            }
        }
    }


    @Deprecated("Deprecated in Java")
    override fun onStatusChanged(provider: String?, status: Int, extras: Bundle?) {
        when (status) {
            LocationProvider.OUT_OF_SERVICE -> {
                Log.d(TAG, "Location provider $provider is out of service")
            }

            LocationProvider.TEMPORARILY_UNAVAILABLE -> {
                Log.d(TAG, "Location provider $provider is temporarily unavailable")
            }

            LocationProvider.AVAILABLE -> {
                Log.d(TAG, "Location provider $provider is available again")
            }
        }
    }


    @SuppressLint("MissingPermission")
    private fun requestLocationUpdates() {
        if (checkSelfPermission(Manifest.permission.ACCESS_FINE_LOCATION) != PackageManager.PERMISSION_GRANTED
                && checkSelfPermission(Manifest.permission.ACCESS_COARSE_LOCATION) != PackageManager.PERMISSION_GRANTED) {
            Log.d(TAG, "location not granted")
            return
        }
        Log.d(TAG, "location granted")
        locationManager.requestLocationUpdates(
                LocationManager.GPS_PROVIDER,
                MIN_TIME_BW_UPDATES,
                MIN_DISTANCE_CHANGE_FOR_UPDATES,
                this
        )
    }

    @RequiresApi(Build.VERSION_CODES.O)
    private fun startForeground() {
        val channelId =
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                    createNotificationChannel("my_service", "My Background Service")
                } else {
                    ""
                }

        val notificationBuilder = Notification.Builder(this, channelId)
        val notification = notificationBuilder.setOngoing(true)
                .setContentTitle("Chance App")
                .setContentText("Щоб програма працювала корректно, вам потрібно дозволити використовувати цей дозвіл")
                .setPriority(Notification.PRIORITY_MIN)
                .setCategory(Notification.CATEGORY_SERVICE)
                .build()

        startForeground(101, notification)
        Log.d(TAG, "startForeground")
    }

    @RequiresApi(api = Build.VERSION_CODES.O)
    private fun createNotificationChannel(channelId: String, channelName: String): String {
        val chan = NotificationChannel(channelId,
                channelName, NotificationManager.IMPORTANCE_NONE)
        chan.lightColor = 0x066CFF
        chan.lockscreenVisibility = Notification.VISIBILITY_PRIVATE
        val service = getSystemService(NOTIFICATION_SERVICE) as NotificationManager
        service.createNotificationChannel(chan)
        return channelId
    }

    companion object {
        private const val TAG = "LocationService"
        private const val MIN_TIME_BW_UPDATES = 60000L // 1 minute
        private const val MIN_DISTANCE_CHANGE_FOR_UPDATES = 0f
    }
}