package com.example.mute_notification_test

import io.flutter.embedding.android.FlutterActivity

import android.content.Context
import android.media.AudioManager
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val CHANNEL = "notification_sound_channel"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "reduceNotificationSound") {
                reduceNotificationSoundAndVibration()
                result.success(null)
            } else {
                result.notImplemented()
            }
        }
    }

    private fun reduceNotificationSoundAndVibration() {
        val audioManager = getSystemService(Context.AUDIO_SERVICE) as AudioManager
        // Set notification volume to zero
        audioManager.setStreamVolume(AudioManager.STREAM_NOTIFICATION, 0, 0)

    }
}