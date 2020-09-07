package com.test.flutter_drm_sample

import android.content.Context
import android.graphics.Color
import android.os.Build
import android.os.Bundle
import android.os.Handler
import android.os.PersistableBundle
import android.os.Process
import android.util.Log
import android.view.*
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant
import java.io.File

class MainActivity: FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        if (!setSecureSurfaceView(true)) {
            Log.e("MainActivity", "Could not secure the MainActivity!")
            // React as appropriate.
        }
    }

    private fun setSecureSurfaceView(status: Boolean): Boolean {
        val content = findViewById<ViewGroup>(android.R.id.content)
        if (!isNonEmptyContainer(content)) {
            return false
        }
        val splashView = content.getChildAt(0)
        if (!isNonEmptyContainer(splashView)) {
            return false
        }
        val flutterView = (splashView as ViewGroup).getChildAt(0)
        if (!isNonEmptyContainer(flutterView)) {
            return false
        }
        val surfaceView = (flutterView as ViewGroup).getChildAt(0)
        if (surfaceView !is SurfaceView) {
            return false
        }
        if(status) {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN_MR1) {
                surfaceView.setSecure(true)
            }
        }else{
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN_MR1) {
                surfaceView.setSecure(false)
            }

        }
        return true
    }
    private fun isNonEmptyContainer(view: View): Boolean {
        if (view !is ViewGroup) {
            return false
        }
        if (view.childCount < 1) {
            return false
        }
        return true
    }
}
