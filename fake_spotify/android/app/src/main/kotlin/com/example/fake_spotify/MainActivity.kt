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
import android.database.Cursor
import android.net.Uri
import android.provider.MediaStore
import android.content.Context
import com.google.gson.*;
import java.util.*;

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.android.FlutterFragmentActivity

class MainActivity: FlutterFragmentActivity() {
//    private var methodResult: MethodChannel.Result? = null
    private var queryLimit: Int = 0
    lateinit var results: MethodChannel.Result

   override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
       super.configureFlutterEngine(flutterEngine)
       val messenger = flutterEngine.dartExecutor.binaryMessenger
       MethodChannel(messenger, "com.spotify.channel")
               .setMethodCallHandler { call, result ->
               results = result
                   when (call.method) {
                       "getAudios" -> {
                           Log.d("TAG", "method channel getAudios")
                           if(hasStoragePermission()) {
                               getAllAudioFromDevice(MainActivity@this, result)
                                Log.d("TAG", "already has permission")
                           } else {
                               Log.d("TAG", "not has permission yet")
                           }

                       }
                       else -> result.notImplemented()
                   }
               }
   }

    fun getAllAudioFromDevice(context: Context, results: MethodChannel.Result) {
        val tempAudioList: MutableList<AudioModel> = ArrayList()
        val uri: Uri = MediaStore.Audio.Media.EXTERNAL_CONTENT_URI
        val projection = arrayOf(
            MediaStore.Audio.AudioColumns.DATA,
            MediaStore.Audio.AudioColumns.TITLE,
            MediaStore.Audio.AudioColumns.ALBUM,
            MediaStore.Audio.ArtistColumns.ARTIST
        )
        val c: Cursor? = context.getContentResolver().query(
            uri,
            projection,
            null,
            null,
            null
        )
        if (c != null) {
            while (c.moveToNext()) {
                val audioModel = AudioModel()
                val path: String = c.getString(0)
                val name: String = c.getString(1)
                val album: String = c.getString(2)
                val artist: String = c.getString(3)
                audioModel.setaName(name)
                audioModel.setaAlbum(album)
                audioModel.setaArtist(artist)
                audioModel.setaPath(path)
                // Log.e("TAG", " name :$name")
                tempAudioList.add(audioModel)
            }
            c.close()
        }

        val gson = Gson()
        val jsonString = gson.toJson(tempAudioList)
        // val jsonObj = JsonObject();
        // var jsonAudio: JsonArray = Gson().toJsonTree(tempAudioList).getAsJsonArray();
        // jsonObj.add("jsonAudio", jsonAudio);
        results.success(jsonString.toString())
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
            getAllAudioFromDevice(MainActivity@this, results)
            Log.d("TAG", "permission granted")
        } else {
            // methodResult?.error("0", "Permission denied", "")
        }
    }


   private fun fetchImage(args: Map<String, Any>, result: MethodChannel.Result) {
       TODO("Not yet implemented")
   }
}
