package nagano.shunsuke.flutter_wifi_sample


import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import nagano.shunsuke.plugins.Buttery

import android.content.Context
import android.content.ContextWrapper
import android.content.Intent
import android.content.IntentFilter
import android.os.BatteryManager
import android.os.Build.VERSION
import android.os.Build.VERSION_CODES


class MainActivity : FlutterActivity() {

    private class ButteryApi(_batteryManager: BatteryManager, context: Context) : Buttery.ButteryApi {

        val batteryManager: BatteryManager = _batteryManager

        val context = context

        override fun add(req: Buttery.ButteryRequest): Buttery.ButteryResponse {
            val response = Buttery.ButteryResponse()

            val batteryLevel = getBatteryLevel()
            if (batteryLevel == -1) {
                response.responseMessage = "UNAVAILABLE Battery level not available."
                return response
            }
            response.responseMessage = "${batteryLevel.toString()}${req.unit}"

            return response
        }

        private fun getBatteryLevel(): Int {
            val batteryLevel: Int
            if (VERSION.SDK_INT >= VERSION_CODES.LOLLIPOP) {
                batteryLevel = batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)
            } else {
                val intent = ContextWrapper(context).registerReceiver(null, IntentFilter(Intent.ACTION_BATTERY_CHANGED))
                batteryLevel = intent!!.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100 / intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1)
            }
            return batteryLevel
        }
    }


    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        val batteryManager = getSystemService(Context.BATTERY_SERVICE) as BatteryManager
        Buttery.ButteryApi.setup(flutterEngine.dartExecutor.binaryMessenger, ButteryApi(batteryManager, applicationContext))
    }




}
