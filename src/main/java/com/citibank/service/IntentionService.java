package com.citibank.service;

import java.util.List;
import java.util.Map;
import java.util.Objects;

/**
 * Created by liuhao on 15-7-21.
 */
public interface IntentionService {
    public boolean publishIntention(Map<String,Object> map);
    public Map<String, Object> getInvestorinfoById(String id);
}
