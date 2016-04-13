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

		// 1. ����
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.163.com");// �洢�����ʼ�����������Ϣ
		props.put("mail.smtp.auth", "true");// ͬʱͨ����֤
		props.put("mail.smtp.port", "25"); // googleʹ��465��587�˿�
		props.put("mail.debug", "true");
		// props.put("mail.smtp.starttls.enable", "true");// ʹ�� STARTTLS��ȫ����
		Session session = Session.getInstance(props, new MyAuthenticator(user, password));// ���������½�һ���ʼ��Ự
		// session.setDebug(true); //�������ӡһЩ������Ϣ��

		// 2. message
		MimeMessage message = new MimeMessage(session);// ���ʼ��Ự�½�һ����Ϣ����
		message.setFrom(new InternetAddress(fromMail));// ���÷����˵ĵ�ַ
		message.setRecipient(Message.RecipientType.TO, new InternetAddress(toMail));// �����ռ���,���������������ΪTO
		message.setSubject(mailTitle);// ���ñ���// �����ʼ���Ϣ���͵�ʱ��
		message.setSentDate(new Date());
		switch (contextType) {
		case "text":
			message.setText(mailContent);
			break; // ���� ���ı� �ʼ�
		case "html":
			message.setContent(mailContent, "text/html;charset=gbk");
			break; // ����HTML�ʼ�
		}
		message.setSentDate(new Date());// ���÷���ʱ��
		message.saveChanges();// �洢�ʼ���Ϣ

		// 3. send
		Transport transport = session.getTransport("smtp");
		transport.connect(user, password);
		transport.sendMessage(message, message.getAllRecipients());// �����ʼ�,���еڶ�����������������õ��ռ��˵�ַ
		transport.close();
	}

	public static void sendMailWithDefaultServer(String toMail, String mailTitle, String mailContent) throws Exception {
		sendMail("wldcadmin@163.com", "wldcadmin", "1a2b3c4d", toMail, mailTitle, mailContent);
	}

	public static void main(String[] args) throws Exception {
		sendMailWithDefaultServer("zhouxueyuan1106@163.com", "Java Mail �����ʼ�", "<a>html Ԫ��</a>:<b>�ʼ�����</b>");
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
