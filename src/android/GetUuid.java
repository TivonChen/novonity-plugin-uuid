package com.novonity.plugin.getdevice;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.PluginResult;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import android.content.Context;

import java.util.UUID;
import android.telephony.TelephonyManager;

import android.widget.Toast;

import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.preference.PreferenceManager;

public class GetUuid extends CordovaPlugin {

	public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
		if(action.equals("get")) {
			SharedPreferences sp = PreferenceManager.getDefaultSharedPreferences(cordova.getActivity());
			String uuid = sp.getString("uuid", "");
			if(uuid != null && !uuid.equals("")){
				try {
					callbackContext.success(uuid);
				} catch (JSONException e) {
					e.printStackTrace();
				}
			}else{
				TelephonyManager tm = (TelephonyManager) cordova.getActivity().getSystemService(Context.TELEPHONY_SERVICE);
                final String tmDevice, tmSerial, androidId;
                tmDevice = "" + tm.getDeviceId();
                tmSerial = "" + tm.getSimSerialNumber();
                androidId = ""
                        + android.provider.Settings.Secure.getString(
                        cordova.getActivity().getContentResolver(),
                        android.provider.Settings.Secure.ANDROID_ID);

                UUID deviceUuid = new UUID(androidId.hashCode(),
                        ((long) tmDevice.hashCode() << 32) | tmSerial.hashCode());

                String uniqueId = deviceUuid.toString();
				Editor editor = sp.edit();
				editor.putString("uuid",uniqueId);
				editor.commit();
				try {
					callbackContext.success(uniqueId);
				} catch (JSONException e) {
					e.printStackTrace();
				}
			}
			return true;
		}
		return false;
	}
}
