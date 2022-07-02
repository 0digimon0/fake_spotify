class NetworkStreamHandler {
    private var eventSink: EventChannel.EventSink? = null

    private val networkCallback = object : ConnectivityManager.NetworkCallback() {
        override fun onLost(network: Network) {
            super.onLost(network)
            // Notify Flutter that the network is disconnected
            activity?.runOnUiThread { eventSink?.success(Constants.disconnected) }
        }

        override fun onCapabilitiesChanged(network: Network, netCap: NetworkCapabilities) {
            super.onCapabilitiesChanged(network, netCap)
            // Pick the supported network states and notify Flutter of this new state
            val status =
                when {
                    netCap.hasTransport(NetworkCapabilities.TRANSPORT_WIFI) -> Constants.wifi
                    netCap.hasTransport(NetworkCapabilities.TRANSPORT_CELLULAR) -> Constants.cellular
                    else -> Constants.unknown
                }
            activity?.runOnUiThread { eventSink?.success(status) }
        }
    }
}