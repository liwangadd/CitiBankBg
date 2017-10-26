package com.citibank.entity;

import org.springframework.stereotype.Repository;

/**
 * Created by liuhao on 15-7-15.
 */
@Repository
public class Attention {
    private int investorId;//己方id
    private int companyId;//对方id
    /**
     * 关注状态0:互不关注
     * 1:一方关注
     * 2:互相关注
     */
    private int attentionState;
    private int stockCreditorId;//股权id外键
    private int productType;//产品类型
    private int flag;//标记是企业还是投资者

    public int getAttentionState() {
        return attentionState;
    }

    public void setAttentionState(int attentionState) {
        this.attentionState = attentionState;
    }

    public int getStockCreditorId() {
        return stockCreditorId;
    }

    public void setStockCreditorId(int stockCreditorId) {
        this.stockCreditorId = stockCreditorId;
    }

    public int getProductType() {
        return productType;
    }

    public void setProductType(int productType) {
        this.productType = productType;
    }
}
