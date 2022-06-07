package com.example.fake_spotify
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import android.Manifest
import android.content.pm.PackageManager
import android.os.Bundle
import android.util.Log
import androidx.core.app.ActivityCompat
import androidx.activity.result.contract.ActivityResultContracts
import androidx.core.content.ContextCompat

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.android.FlutterFragmentActivity

class MainActivity: FlutterFragmentActivity() {
//    private var methodResult: MethodChannel.Result? = null
    private var queryLimit: Int = 0

   override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
       super.configureFlutterEngine(flutterEngine)
       val messenger = flutterEngine.dartExecutor.binaryMessenger
       MethodChannel(messenger, "com.spotify.channel")
               .setMethodCallHandler { call, result ->
                   when (call.method) {
                       "getPhotos" -> {
                           Log.d("TAG", "method channel getPhotos")
                           if(hasStoragePermission()) {
                                Log.d("TAG", "already has permission")
                           } else {
                               Log.d("TAG", "not has permission yet")
                           }
                           //    methodResult = result
                           //    queryLimit = call.arguments()
                           // getAudios()
                       }
                    //    "fetchImage" -> fetchImage(call.arguments(), result)
                       else -> result.notImplemented()
                   }
               }
   }

    private fun getAudios() {
        Log.d("THANH", "get audio")
    }

    private fun hasStoragePermission(): Boolean {
        val permission = Manifest.permission.READ_EXTERNAL_STORAGE
        val state = ContextCompat.checkSelfPermission(this, permission)
        if (state == PackageManager.PERMISSION_GRANTED) return true
    
        permissionLauncher.launch(permission)
    return false
}

    private val permissionLauncher = registerForActivityResult(ActivityResultContracts.RequestPermission()) { granted ->
        if (granted) {
            // getPhotos()
            Log.d("TAG", "permission granted")
        } else {
            // methodResult?.error("0", "Permission denied", "")
        }
    }

//    private fun fetchImage(args: Map<String, Any>, result: MethodChannel.Result) {
//        TODO("Not yet implemented")
//    }
}
