package com.library.mall.entity;

/**
 * @Author:wangjianlin
 * @Description:
 * @Date:Created in 14:14 2019/6/5
 * @Modified By:
 */
public class BaseConfig {
    private String configId;
    private String configName;
    private String configCode;
    private Integer configState;

    public BaseConfig() {
    }

    public BaseConfig(String configId, String configName, String configCode,Integer configState) {
        this.configId = configId;
        this.configName = configName;
        this.configCode = configCode;
        this.configState = configState;
    }

    public BaseConfig(String configName, String configCode,Integer configState) {
        this.configName = configName;
        this.configCode = configCode;
        this.configState = configState;
    }

    public String getConfigId() {
        return configId;
    }

    public void setConfigId(String configId) {
        this.configId = configId;
    }

    public String getConfigName() {
        return configName;
    }

    public void setConfigName(String configName) {
        this.configName = configName;
    }

    public String getConfigCode() {
        return configCode;
    }

    public void setConfigCode(String configCode) {
        this.configCode = configCode;
    }

    public Integer getConfigState() {
        return configState;
    }

    public void setConfigState(Integer configState) {
        this.configState = configState;
    }
}
