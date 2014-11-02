package com;

import java.util.Map;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

import org.apache.log4j.Logger;

import com.resource.Resource;
import com.user.User;

public class PrivilegeTag extends TagSupport {

	private static final long serialVersionUID = -8203428123385783219L;

	private String m_res;

	private static Logger s_logger = Logger.getLogger(PrivilegeTag.class);

	@Override
	public int doStartTag() throws JspException {
		User user = (User) pageContext.getSession().getAttribute("user");
		try {
			if (user != null) {
				Map<String, Resource> res = user.getResources();

				if (res.containsKey(m_res)) {
					return EVAL_BODY_INCLUDE;
				}
			} else {

			}
		} catch (Exception e) {
			s_logger.error(e.getMessage(), e);
			return SKIP_BODY;
		}
		return SKIP_BODY;
	}

	public String getRes() {
		return m_res;
	}

	public void setRes(String res) {
		this.m_res = res;
	}

}
