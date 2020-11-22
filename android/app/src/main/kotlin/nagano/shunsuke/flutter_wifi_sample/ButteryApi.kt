package nagano.shunsuke.flutter_wifi_sample

import android.content.Context
import android.content.ContextWrapper
import android.content.Intent
import android.content.IntentFilter
import android.os.BatteryManager
import android.os.Build
import nagano.shunsuke.plugins.Pigeon

class ButteryApi(private val batteryManager: BatteryManager?, private val context: Context) : Pigeon.ButteryApi {

    override fun add(req: Pigeon.ButteryRequest): Pigeon.ButteryResponse {
        val response = Pigeon.ButteryResponse()

        val batteryLevel = getBatteryLevel()
        if (batteryLevel == -1) {
            response.responseMessage = "UNAVAILABLE Battery level not available."
            return response
        }
        response.responseMessage = "$batteryLevel${req.unit}"

        return response
    }


    private fun getBatteryLevel(): Int {
        val batteryLevel: Int
        batteryLevel = if (batteryManager !== null && Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)
        } else {
            val intent = ContextWrapper(context).registerReceiver(null, IntentFilter(Intent.ACTION_BATTERY_CHANGED))
            intent!!.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100 / intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1)
        }
        return batteryLevel
    }
}