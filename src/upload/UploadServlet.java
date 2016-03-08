package upload;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class UploadServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// ���ñ����ʽΪutf-8
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		// ��ȡsession��������Ⱥ��ϴ�������ϴ������ʼֵΪNOK����ΪOk��ʾ�ϴ����
		HttpSession session = request.getSession();
		session.setAttribute("prog", "0");
		session.setAttribute("result", "NOK");
		session.setAttribute("error", "");
		String error = "";
		// ���ϴ����ļ���һ�����ֵ�������ǲ��ó���50MB
		int maxSize = 50 * 1024 * 1024;
		// ��������������ļ��ϴ�����
		DiskFileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		try {
			// �����ϴ�����
			List items = upload.parseRequest(request);
			Iterator itr = items.iterator();

			while (itr.hasNext()) {
				FileItem item = (FileItem) itr.next();
				// �ж��Ƿ�Ϊ�ļ���
				if (!item.isFormField()) {
					if (item.getName() != null && !item.getName().equals("")) {
						// ��ȡ�ϴ��ļ���С���ļ�����
						long upFileSize = item.getSize();
						String fileName = item.getName();

						System.out.println("fileName:" + fileName + ",upFileSize:" + upFileSize);

						if (upFileSize > maxSize) {
							error = "���ϴ����ļ�̫���ˣ���ѡ�񲻳���50MB���ļ�!";
							break;
						}
						
						// ��ʱ�ļ��ݴ��ڷ��������ڴ��У�������ʱ����
						//File tempFile = new File(fileName);
						// ָ���ļ��ϴ���������Ŀ¼���ļ�����
						//File file = new File("/upload", tempFile.getName());
						
						String savePath = this.getServletContext().getRealPath("/images/thumb");
						System.out.println(savePath);
						File file = new File(savePath);
						// �ж��ϴ��ļ��ı���Ŀ¼�Ƿ����
						if (!file.exists() && !file.isDirectory()) {
							System.out.println(savePath + "Ŀ¼�����ڣ���Ҫ����");
							// ����Ŀ¼
							file.mkdir();
						}
						String filename = fileName.substring(fileName.lastIndexOf("\\") + 1);
						// �������������ļ�
						InputStream is = item.getInputStream();
						int length = 0;
						byte[] by = new byte[1024];
						double persent = 0;
						FileOutputStream fos = new FileOutputStream(savePath + "\\" + filename/* file*/);
						PrintWriter out = response.getWriter();
						System.out.println("start");
						while ((length = is.read(by)) != -1) {
							// �����ļ�����
							persent += length / (double) upFileSize * 100D;
							fos.write(by, 0, length);
							session.setAttribute("prog", Math.round(persent) + "");
							Thread.sleep(1);
							System.out.println(".");
						}
						System.out.println("done");
						fos.close();
					} else {
						error = "ûѡ���ϴ��ļ���";
					}
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
			error = "�ϴ��ļ����ִ���:" + e.getMessage();
		}
		if (!error.equals("")) {
			session.setAttribute("error", error);
		} else {
			session.setAttribute("result", "OK");
		}
	}
}