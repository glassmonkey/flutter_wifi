package nagano.shunsuke.flutter_wifi_sample


import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import nagano.shunsuke.plugins.Pigeon

import android.content.Context
import android.os.BatteryManager
import android.os.Build
import androidx.annotation.RequiresApi


class MainActivity : FlutterActivity() {

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        val batteryManager = if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.LOLLIPOP) {
            getSystemService(Context.BATTERY_SERVICE) as BatteryManager
        } else {
           null
        }
        Pigeon.ButteryApi.setup(flutterEngine.dartExecutor.binaryMessenger, ButteryApi(batteryManager, applicationContext))
    }
}
