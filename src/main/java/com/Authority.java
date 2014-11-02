package com;

public enum Authority {
	Login("relogin"),

	NoAuth("noAuth");

	private String m_name;

	private Authority(String name) {
		m_name = name;
	}

	public String getName() {
		return m_name;
	}

}