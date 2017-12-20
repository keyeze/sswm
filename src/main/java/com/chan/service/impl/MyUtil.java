package com.chan.service.impl;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

/**
 * Created by keyez on 2017/4/22.
 */
public class MyUtil {
    public static void writeTo(InputStream inputStream, FileOutputStream outputStream) throws IOException {
        byte[] bytes = new byte[1000];
        int i;
        while ((i = inputStream.read(bytes)) != -1) {

            outputStream.write(bytes, 0, i);
            outputStream.flush();

        }


    }
}
