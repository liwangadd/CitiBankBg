package com.citibank.service;

import com.citibank.dao.Page;

import java.util.Map;

/**
 * Created by Nikolas on 2015/7/16.
 */
public interface AppointService {
    public Page<Map<String, Object>> getAppoint(Map<String,Object> map);
    public boolean completeReservation(String reserId);
}
