package com.citibank.entity;

import org.springframework.stereotype.Repository;

/**
 * Created by liuhao on 15-7-15.
 */
@Repository
public class Information {
    /**
     * 标记文件类型0:政策资讯
     * 1:市场资讯
     * 2:中心公告
     * 3:信用监管报告
     * 4:备案发信公告
     * 5:转让交易报告
     * 6:定期报告
     * 7:临时报告
     * 8:信用报告
     */
    private int flag;
    private String path;//文件路径
}
