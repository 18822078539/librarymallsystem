package com.library.mall.entity;

import java.io.Serializable;

/**
 * @Author:wangjianlin
 * @Description:
 * @Date:Created in 8:43 2019/5/29
 * @Modified By:
 */
public class SysMsg implements Serializable {
    private Integer sysmsgId;
    private Users sendUser;
    private String askMsg;
    private String answerMsg;


    public SysMsg(Users sendUser, String askMsg, String answerMsg) {
        this.sendUser = sendUser;
        this.askMsg = askMsg;
        this.answerMsg = answerMsg;
    }

    public SysMsg(Integer sysmsgId, Users sendUser, String askMsg, String answerMsg) {
        this.sysmsgId = sysmsgId;
        this.sendUser = sendUser;
        this.askMsg = askMsg;
        this.answerMsg = answerMsg;
    }

    public SysMsg(){

    }

    public Integer getSysmsgId() {
        return sysmsgId;
    }

    public void setSysmsgId(Integer sysmsgId) {
        this.sysmsgId = sysmsgId;
    }

    public Users getSendUser() {
        return sendUser;
    }

    public void setSendUser(Users sendUser) {
        this.sendUser = sendUser;
    }

    public String getAskMsg() {
        return askMsg;
    }

    public void setAskMsg(String askMsg) {
        this.askMsg = askMsg;
    }

    public String getAnswerMsg() {
        return answerMsg;
    }

    public void setAnswerMsg(String answerMsg) {
        this.answerMsg = answerMsg;
    }
}
