package com.yanmai.test;

import org.junit.Test;

/**
 * Created by admin on 2017/4/26.
 */
public class testEventKey {

    @Test
    public void replaceStr(){

        String eventKey = "qrscene_sa";

        String oepnid = eventKey.replace("qrscene_","");

        System.out.println(oepnid.length());

    }
}
