package nagano.shunsuke.flutter_wifi_sample

import android.content.Context
import android.os.BatteryManager
import nagano.shunsuke.plugins.Pigeon

class BatteryApi(private val batteryManager: BatteryManager) : Pigeon.BatteryApi {

    override fun call(req: Pigeon.BatteryRequest): Pigeon.BatteryResponse {
        val response = Pigeon.BatteryResponse()

        val batteryLevel = getBatteryLevel()
        if (batteryLevel == -1) {
            response.responseMessage = "UNAVAILABLE Battery level not available."
            return response
        }
        response.responseMessage = "$batteryLevel${req.unit}"

        return response
    }


    private fun getBatteryLevel(): Int {
        return batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)
    }
}