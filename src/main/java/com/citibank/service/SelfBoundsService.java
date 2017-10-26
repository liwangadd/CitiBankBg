package com.citibank.service;

import com.citibank.dao.Page;

import java.util.Map;

/**
 * Created by Nikolas on 2015/7/16.
 */
public interface SelfBoundsService {
    public Page<Map<String, Object>> getSelfBounds(String userId, int pageIndex, String queryContent, int userType);
}
