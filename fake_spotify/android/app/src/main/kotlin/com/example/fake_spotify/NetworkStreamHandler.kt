package com.example.fake_spotify

import android.app.Activity
import android.content.Context
import android.net.ConnectivityManager
import android.net.Network
import android.net.NetworkCapabilities
import android.net.NetworkRequest
import android.os.Build
import android.util.Log

import io.flutter.plugin.common.EventChannel

class NetworkStreamHandler(private var activity: Activity?) : EventChannel.StreamHandler{
    val wifi = 0xFF
    val cellular = 0xEE
    val disconnected = 0xDD
    val unknown = 0xCC

    private var eventSink: EventChannel.EventSink? = null

    override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
        Log.d("THANH", "onListen")
        eventSink = events
        startListeningNetworkChanges()
    }

    override fun onCancel(arguments: Any?) {
        stopListeningNetworkChanges()
        eventSink = null
        activity = null
    }

    private val networkCallback = object : ConnectivityManager.NetworkCallback() {
        override fun onLost(network: Network) {
            super.onLost(network)
            // Notify Flutter that the network is disconnected
            Log.d("THANH", "onLost disconnected")
            activity?.runOnUiThread { eventSink?.success(disconnected) }
        }

        override fun onCapabilitiesChanged(network: Network, netCap: NetworkCapabilities) {
            super.onCapabilitiesChanged(network, netCap)
            // Pick the supported network states and notify Flutter of this new state

            val status =
                when {
                    netCap.hasTransport(NetworkCapabilities.TRANSPORT_WIFI) -> wifi
                    netCap.hasTransport(NetworkCapabilities.TRANSPORT_CELLULAR) -> cellular
                    else -> unknown
                }
            Log.d("THANH", "onCapabilitiesChanged " + status)
            activity?.runOnUiThread { eventSink?.success(status) }
        }
    }

    private fun startListeningNetworkChanges() {
        val manager = activity?.getSystemService(Context.CONNECTIVITY_SERVICE) as? ConnectivityManager
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
            manager?.registerDefaultNetworkCallback(networkCallback)
        } else {
            val request = NetworkRequest.Builder()
                .addCapability(NetworkCapabilities.NET_CAPABILITY_INTERNET)
                .build()
            manager?.registerNetworkCallback(request, networkCallback)
        }
    }

    private fun stopListeningNetworkChanges() {
        val manager = activity?.getSystemService(Context.CONNECTIVITY_SERVICE) as? ConnectivityManager
        manager?.unregisterNetworkCallback(networkCallback)
    }
}