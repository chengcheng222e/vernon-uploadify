package com.vernon.uploadify.core;

import java.io.File;
import java.io.FileInputStream;
import java.io.Serializable;
import java.net.URL;
import java.net.URLDecoder;
import java.util.Enumeration;
import java.util.Properties;

/**
 * 全局常量定义
 *
 * @author Vernon.Chen
 * @date 2012-11-22
 */
public class Constant implements Serializable {

    // ************************* 网站路径配置 *************************

    public static String IMG_URI = "/Users/chenyuan/Data/resources/images";

    private static Properties properties = new Properties();

    static {
        try {
            Enumeration<URL> urls = Thread.currentThread().getContextClassLoader().getResources("constant.properties");
            if (urls == null || !urls.hasMoreElements()) {
                System.out.println("no constant config find! please put constant.properties  in your classpath");
            }
            if (urls.hasMoreElements()) {
                String filepath = urls.nextElement().getFile();
                filepath = URLDecoder.decode(filepath, "utf-8");
                System.out.println("constant filepath:" + filepath);

                properties.load(new FileInputStream(new File(filepath)));

                if (properties.getProperty("IMG_URI") != null) {
                    IMG_URI = properties.getProperty("IMG_URI");
                    System.out.println("init constant.IMG_URI=" + IMG_URI);
                }
                System.out.println("constant init success!!!");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 更具Key获取Value
     *
     * @param key
     * @return
     */
    public static String getProperty(String key) {
        return getProperty(key, "");
    }

    /**
     * 更具Key获取Value, 没有取到给默认值
     *
     * @param key
     * @param defaultValue
     * @return
     */
    public static String getProperty(String key, String defaultValue) {
        return properties.getProperty(key, defaultValue);
    }

}
