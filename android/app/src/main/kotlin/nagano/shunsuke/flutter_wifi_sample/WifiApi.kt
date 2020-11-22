package nagano.shunsuke.flutter_wifi_sample

import android.net.ConnectivityManager
import android.net.Network
import android.net.NetworkCapabilities
import android.net.NetworkRequest
import android.os.Handler
import android.os.Looper
import io.flutter.plugin.common.BinaryMessenger
import nagano.shunsuke.plugins.Pigeon

class WifiApi(private val connectivityManager: ConnectivityManager, private val binaryMessenger: BinaryMessenger): Pigeon.WifiApi {

    var isWifi = false;
    var isMobile = false;

    val callback = Pigeon.WifiCallbackApi(binaryMessenger)

    val mainHandler = Handler(Looper.getMainLooper())

    init {

        val request = NetworkRequest
                .Builder()
                .addTransportType(NetworkCapabilities.TRANSPORT_WIFI)
                .addTransportType(NetworkCapabilities.TRANSPORT_CELLULAR)
                .build()

        val networkCallback = object : ConnectivityManager.NetworkCallback() {
            override fun onAvailable(network: Network?) {
                super.onAvailable(network)
                // ネットワークが使用可能になったときの処理
                val capabilities = connectivityManager.getNetworkCapabilities(network)
                isWifi = capabilities?.hasTransport(NetworkCapabilities.TRANSPORT_WIFI) ?: false
                isMobile = capabilities?.hasTransport(NetworkCapabilities.TRANSPORT_CELLULAR)
                        ?: false
                mainHandler.post {
                    val response = call()
                    callback.apply(response) {}
                }

            }

            override fun onLost(network: Network?) {
                super.onLost(network)
                val capabilities = connectivityManager.getNetworkCapabilities(network)
                isWifi = capabilities?.hasTransport(NetworkCapabilities.TRANSPORT_WIFI) ?: false
                isMobile = capabilities?.hasTransport(NetworkCapabilities.TRANSPORT_CELLULAR)
                        ?: false
                // ネットワークの接続が切れたときの処理
                mainHandler.post {
                    val response = call()
                    callback.apply(response) {}
                }

            }

            override fun onUnavailable() {
                super.onUnavailable()
                isWifi = false
                isMobile = false
                mainHandler.post {
                    val response = call()
                    callback.apply(response) {}
                }

            }
        }
        connectivityManager.requestNetwork(request, networkCallback)
    }

    override fun call(): Pigeon.WifiResponse {
        val response = Pigeon.WifiResponse()
        response.availableWifi = isWifi
        response.availableMobile = isMobile
        return response;
    }
}
