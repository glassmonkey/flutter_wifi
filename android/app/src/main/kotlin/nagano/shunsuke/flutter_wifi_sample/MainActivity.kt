package nagano.shunsuke.flutter_wifi_sample


import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import nagano.shunsuke.plugins.Pigeon

import android.content.Context
import android.net.ConnectivityManager
import android.os.BatteryManager


class MainActivity : FlutterActivity() {

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        val connectivityManager = context.getSystemService(Context.CONNECTIVITY_SERVICE) as ConnectivityManager
        Pigeon.Api.setup(flutterEngine.dartExecutor.binaryMessenger,  WifiApi(connectivityManager, flutterEngine.dartExecutor.binaryMessenger))
    }
}
