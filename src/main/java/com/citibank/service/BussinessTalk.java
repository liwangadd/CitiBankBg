package com.citibank.service;

import java.util.List;
import java.util.Map;

/**
 * Created by mrtian on 2015/7/23.
 */
public interface BussinessTalk {
    public List<Map<String, Object>> getAllTalker(Map<String, Object> req);

    public boolean uploadingContract(Map<String, Object> req);

    public boolean changeContract(Map<String, Object> req);
}
