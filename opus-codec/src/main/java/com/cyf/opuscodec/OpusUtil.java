package com.cyf.opuscodec;

import android.util.Log;

/**
 * Description: opus解码工具类
 * Author: cyf 2020/12/18 14:53
 * Version: 1.0
 */
public class OpusUtil {
    static {
        try {
            System.loadLibrary("opusutil");
        }catch (Exception e){
            Log.d("createvoiceaction", "static initializer: " + e.getMessage());
        }
    }

    public static native long createDecoder(int sampleRateInHz, int channelConfig);
    public static native int decode(long handle, byte[] encoded, short[] lin);
    public static native void destroyDecoder(long handle);
}
