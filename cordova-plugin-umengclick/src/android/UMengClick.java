package org.apache.cordova.umengclick;

import android.content.Context;
import android.util.Log;

import com.umeng.analytics.MobclickAgent;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaInterface;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CordovaWebView;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class UMengClick extends CordovaPlugin {

    private Context mContext;

    @Override
    public void initialize(CordovaInterface cordova, CordovaWebView webView) {
        super.initialize(cordova, webView);
        mContext = this.cordova.getActivity().getApplicationContext();
    }

    @Override
    public boolean execute(String action, JSONArray data, CallbackContext callbackContext) throws JSONException {
        if ("clickEvent".equals(action)) {
            onEvent(data);
            return true;
        }
        return false;
    }

    private void onEvent(JSONArray data) {
        try {
            JSONObject object = data.getJSONObject(0);
            MobclickAgent.onEvent(mContext,object.getString("eventId"), object.getString("eventName"));
            Log.d("click",data.toString());
        } catch (JSONException e) {
            //参数错误
        }
    }

}