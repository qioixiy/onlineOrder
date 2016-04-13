package misc;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Date;
import java.util.Properties;

public class SendMail {
	public static void sendMail(String fromMail, String user, String password, String toMail, String mailTitle,
			String mailContent) throws Exception {
		String contextType = "html";// text or html

		// 1. 配置
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.163.com");// 存储发送邮件服务器的信息
		props.put("mail.smtp.auth", "true");// 同时通过验证
		props.put("mail.smtp.port", "25"); // google使用465或587端口
		props.put("mail.debug", "true");
		// props.put("mail.smtp.starttls.enable", "true");// 使用 STARTTLS安全连接
		Session session = Session.getInstance(props, new MyAuthenticator(user, password));// 根据属性新建一个邮件会话
		// session.setDebug(true); //有他会打印一些调试信息。

		// 2. message
		MimeMessage message = new MimeMessage(session);// 由邮件会话新建一个消息对象
		message.setFrom(new InternetAddress(fromMail));// 设置发件人的地址
		message.setRecipient(Message.RecipientType.TO, new InternetAddress(toMail));// 设置收件人,并设置其接收类型为TO
		message.setSubject(mailTitle);// 设置标题// 设置邮件消息发送的时间
		message.setSentDate(new Date());
		switch (contextType) {
		case "text":
			message.setText(mailContent);
			break; // 发送 纯文本 邮件
		case "html":
			message.setContent(mailContent, "text/html;charset=gbk");
			break; // 发送HTML邮件
		}
		message.setSentDate(new Date());// 设置发信时间
		message.saveChanges();// 存储邮件信息

		// 3. send
		Transport transport = session.getTransport("smtp");
		transport.connect(user, password);
		transport.sendMessage(message, message.getAllRecipients());// 发送邮件,其中第二个参数是所有已设好的收件人地址
		transport.close();
	}

	public static void sendMailWithDefaultServer(String toMail, String mailTitle, String mailContent) throws Exception {
		sendMail("wldcadmin@163.com", "wldcadmin", "1a2b3c4d", toMail, mailTitle, mailContent);
	}

	public static void main(String[] args) throws Exception {
		sendMailWithDefaultServer("zhouxueyuan1106@163.com", "Java Mail 测试邮件", "<a>html 元素</a>:<b>邮件内容</b>");
	}
}

class MyAuthenticator extends Authenticator {
	String userName = "";
	String password = "";

	public MyAuthenticator() {

	}

	public MyAuthenticator(String userName, String password) {
		this.userName = userName;
		this.password = password;
	}

	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication(userName, password);
	}
}
