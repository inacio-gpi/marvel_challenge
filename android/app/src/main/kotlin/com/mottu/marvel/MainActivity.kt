package com.mottu.marvel

import android.os.AsyncTask
import android.util.Log
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.io.IOException
import java.net.InetSocketAddress
import java.net.Socket

class MainActivity: FlutterActivity() {

  private val CHANNEL = "unique.identifier.method/network"

   override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
     super.configureFlutterEngine(flutterEngine)
 
     MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
       call, result ->
       if(call.method == "verifyInternet"){
           InternetCheck(object : InternetCheck.Consumer {
               override fun accept(internet: Boolean?) {
                   Log.d("InternetCheck", "${internet}");
                   result.success(internet);
               }
           })
       } else {
           result.notImplemented()
       }
     }
   }
 }

internal class InternetCheck(private val mConsumer: Consumer) : AsyncTask<Void, Void, Boolean>() {
    interface Consumer {
        fun accept(internet: Boolean?)
    }

    init {
        execute()
    }

    override fun doInBackground(vararg voids: Void): Boolean? {
        try {
            val sock = Socket()
            sock.connect(InetSocketAddress("8.8.8.8", 53), 1500)
            sock.close()
            return true
        } catch (e: IOException) {
            return false
        }

    }

    override fun onPostExecute(internet: Boolean?) {
        mConsumer.accept(internet)
    }
}