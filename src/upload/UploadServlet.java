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
		// 设置编码格式为utf-8
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		// 获取session，保存进度和上传结果，上传结果初始值为NOK，当为Ok表示上传完成
		HttpSession session = request.getSession();
		session.setAttribute("prog", "0");
		session.setAttribute("result", "NOK");
		session.setAttribute("error", "");
		String error = "";
		// 给上传的文件设一个最大值，这里是不得超过50MB
		int maxSize = 50 * 1024 * 1024;
		// 创建工厂对象和文件上传对象
		DiskFileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		try {
			// 解析上传请求
			List items = upload.parseRequest(request);
			Iterator itr = items.iterator();

			while (itr.hasNext()) {
				FileItem item = (FileItem) itr.next();
				// 判断是否为文件域
				if (!item.isFormField()) {
					if (item.getName() != null && !item.getName().equals("")) {
						// 获取上传文件大小和文件名称
						long upFileSize = item.getSize();
						String fileName = item.getName();

						System.out.println("fileName:" + fileName + ",upFileSize:" + upFileSize);

						if (upFileSize > maxSize) {
							error = "您上传的文件太大了，请选择不超过50MB的文件!";
							break;
						}
						
						// 此时文件暂存在服务器的内存中，构造临时对象
						//File tempFile = new File(fileName);
						// 指定文件上传服务器的目录及文件名称
						//File file = new File("/upload", tempFile.getName());
						
						String savePath = this.getServletContext().getRealPath("/images/thumb");
						System.out.println(savePath);
						File file = new File(savePath);
						// 判断上传文件的保存目录是否存在
						if (!file.exists() && !file.isDirectory()) {
							System.out.println(savePath + "目录不存在，需要创建");
							// 创建目录
							file.mkdir();
						}
						String filename = fileName.substring(fileName.lastIndexOf("\\") + 1);
						// 构造输入流读文件
						InputStream is = item.getInputStream();
						int length = 0;
						byte[] by = new byte[1024];
						double persent = 0;
						FileOutputStream fos = new FileOutputStream(savePath + "\\" + filename/* file*/);
						PrintWriter out = response.getWriter();
						System.out.println("start");
						while ((length = is.read(by)) != -1) {
							// 计算文件进度
							persent += length / (double) upFileSize * 100D;
							fos.write(by, 0, length);
							session.setAttribute("prog", Math.round(persent) + "");
							//Thread.sleep(1);
							System.out.println(".");
						}
						System.out.println("done");
						fos.close();
					} else {
						error = "没选择上传文件！";
					}
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
			error = "上传文件出现错误:" + e.getMessage();
		}
		if (!error.equals("")) {
			session.setAttribute("error", error);
		} else {
			session.setAttribute("result", "OK");
		}
	}
}