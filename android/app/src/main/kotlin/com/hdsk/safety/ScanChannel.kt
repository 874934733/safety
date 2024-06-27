package com.hdsk.safety

import android.content.Context
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class ScanChannel(flutterEngine: BinaryMessenger, context: Context) :
    MethodChannel.MethodCallHandler {

    private val batteryChannelName = "com.hdsk.safety/shell"
    private var channel: MethodChannel? = null
    private var mContext: Context? = null

    init {
        channel = MethodChannel(flutterEngine, batteryChannelName)
        channel!!.setMethodCallHandler(this)
        mContext = context
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            //获取设备版本
            "prohibitScreenshots" -> {
                prohibitScreenshots(result)
            }

            else -> {
                result.notImplemented()
            }
        }
    }


    /**
     * 获取系统版本
     */
    private fun prohibitScreenshots(result: MethodChannel.Result?) {
        result?.success(0)
    }
}