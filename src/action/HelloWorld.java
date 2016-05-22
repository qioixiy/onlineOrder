package action;

import com.opensymphony.xwork2.ActionSupport;

public class HelloWorld extends ActionSupport {
	public final static String MESSAGE = "Struts2 is up and running ...";

	private String message;

	/**
	 * @return the message
	 */
	public String getMessage() {
		return message;
	}

	/**
	 * @param message
	 *            the message to set
	 */
	public void setMessage(String message) {
		this.message = message;
	}

	public String execute() throws Exception {
		setMessage(MESSAGE);
		return SUCCESS;
	}
}