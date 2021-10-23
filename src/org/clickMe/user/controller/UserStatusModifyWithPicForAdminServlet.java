package org.clickMe.user.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.clickMe.common.model.dto.UserDTO;
import org.clickMe.user.service.UserService;

import net.coobird.thumbnailator.Thumbnails;

/**   
	* @packageName : org.clickMe.user.controller
	* @Class : UserStatusModifyWithPicForAdminServlet
    * @Comment : 프로필사진 Attach기능 넣은 회원정보 수정 서블렛
	* @fileName : UserStatusModifyWithPicForAdminServlet.java 
	* @author : Hansoo Lee
    * @History : 2021.10.22 Hansoo Lee 처음 작성함 
*/
@WebServlet("/user/statusModifyWithPicForAdmin")
public class UserStatusModifyWithPicForAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserService userService = new UserService();
		
		String rootLocation = getServletContext().getRealPath("/");
		int maxFileSize = 1024 * 1024 * 10;
		String encodingType = "UTF-8";
		
		System.out.println("파일 저장 ROOT 경로 : " + rootLocation);
		System.out.println("최대 업로드 파일 용량 : " + maxFileSize);
		System.out.println("인코딩 방식 : " + encodingType);
		
		String profilePicTempUploadDirectory = rootLocation + "/resource/upload/profile/temp/";
		String profileThumbUploadDirectory = rootLocation + "/resource/upload/profile/thumbnail/";
		
		File directory = new File(profilePicTempUploadDirectory);
		File directory2 = new File(profileThumbUploadDirectory);
		
		/* 파일 저장경로가 존재하지 않는 경우 디렉토리를 생성한다. */
		if(!directory.exists() || !directory2.exists()) {
			/* 폴더를 한 개만 생성할거면 mkdir, 상위 폴더도 존재하지 않으면 한 번에 생성하란 의미로 mkdirs를 이용한다. */
			System.out.println("폴더 생성 : " + directory.mkdirs());
			System.out.println("폴더 생성 : " + directory2.mkdirs());
		}
		
		/* 이게 최종적으로 request를 parsing하고 파일을 저장한 뒤 필요한 내용을 담을 리스트와 맵이다.
		 * 파일에 대한 정보는 리스트에, 다른 파라미터의 정보는 모두 맵에 담을 것이다.
		 * */
		Map<String, String> parameter = new HashMap<>();
		List<Map<String, String>> fileList = new ArrayList<>();
		
		/* 파일을 업로드할 시 최대 크기나 임시 저장할 폴더의 경로 등을 포함하기 위한 인스턴스이다. */
		DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
        fileItemFactory.setRepository(new File(profilePicTempUploadDirectory));
        fileItemFactory.setSizeThreshold(maxFileSize);
		
        /* 서블릿에서 기본 제공하는거 말고 꼭 commons fileupload 라이브러이에 있는 클래스로 임포트 해야 한다. */
        ServletFileUpload fileUpload = new ServletFileUpload(fileItemFactory);
        
        System.out.println(fileItemFactory);
    	/* request를 파싱하여 데이터 하나 하나를 FileItem 인스턴로 반환한다. */
        System.out.println("여기까지 오나?");
        System.out.println(request);
		try {
			List<FileItem> fileItems = fileUpload.parseRequest(request);
			
			for(FileItem item : fileItems) {
				System.out.println( "아이템 있어?" + item);
			}
			
			/* 위에서 출력해본 모든 item들을 다 처리할 것이다. */
			for(int i = 0; i < fileItems.size(); i++) {
				FileItem item = fileItems.get(i);
				
				/* 폼 데이터는 isFormField 속성이 true이고, 파일은 isFormField 속성이 false이다. */
				if(!item.isFormField()) {
					
					/* 파일 데이터인 경우 */
					if(item.getSize() > 0) {
						
						/* 파일의 사이즈가 0보다 커야 전송된 파일이 있다는 의미이다. 
						 * 전송된 파일이 있는 경우에만 처리하고, 0인 경우에는 무시하도록 로직을 작성한다.
						 * */
//						String fieldName = item.getFieldName();
						String originFileName = item.getName();
						
						int dot = originFileName.lastIndexOf(".");
						String ext = originFileName.substring(dot);
						
//						System.out.println("input태그의 name : " + fieldName);
						System.out.println("올린 파일의 이름 : " + originFileName);
						
						
						String randomFileName = UUID.randomUUID().toString().replace("-", "") + ext;
						
						/* 저장할 파일 정보를 담은 인스턴스를 생성하고 */
						File storeFile = new File(profilePicTempUploadDirectory + "/" + randomFileName);
						
						item.write(storeFile);
						
						
						/* 썸네일로 변환 후 저장한다. */
						Thumbnails.of(storeFile)
								.size(225, 225)
								.toFile(profileThumbUploadDirectory + "Profile_" + randomFileName);
						
						System.out.println("썸네일 변환 성공!");
						
						/* 프로필사진은 썸네일로 저장된 사진만 필요 하므로 원본은 삭제*/
						storeFile.delete();
						
						String imgPath = "/resource/upload/profile/thumbnail/Profile_" + randomFileName;
						
						/* 필요한 정보를 Map에 담는다. */
						Map<String, String> fileMap = new HashMap<>();
						fileMap.put("profileOrigName", originFileName);
						fileMap.put("profileUUIDName", "Profile_" + randomFileName);
						fileMap.put("imgPath", imgPath);

						/* 나중에 웹서버에서 접근 가능한 경로 형태로 썸네일의 저장 경로도 함께 저장한다. */
						
						fileList.add(fileMap);
						
					}
					
				} else {
					/* 폼 데이터인 경우 */
					/* 전송된 폼의 name은 getFiledName()으로 받아오고, 해당 필드의 value는 getString()으로 받아온다. 
					 * 하지만 인코딩 설정을 하더라도 전송되는 파라미터는 ISO-8859-1로 처리된다.
					 * 별도로 ISO-8859-1로 해석된 한글을 UTF-8로 변경해주어야 한다.
					 * */

					System.out.println("input 태그의 name : " + item.getFieldName());
					
					/* 기존에 encType이 multipart/form-data가 아닌 경우 getParameter()로 뽑던 것들 */
					System.out.println("input 태그의 value : " + new String(item.getString().getBytes("ISO-8859-1"), "UTF-8"));

					parameter.put(item.getFieldName(), new String(item.getString().getBytes("ISO-8859-1"), "UTF-8"));
					
				}
			}
			
			System.out.println(parameter);
			System.out.println(fileList);
			
			
			System.out.println(Integer.valueOf(parameter.get("code")));
			System.out.println(Integer.valueOf(parameter.get("deposit")));
			
			
			System.out.println(parameter);
			
			
			
			System.out.println("parameter : " + parameter);
			
			
			int code = Integer.valueOf(parameter.get("code"));
			String email = parameter.get("email");
			/*사용자가 '-'기호를 이용하여 전화번호를 입력하는 경우 통일시키기 위해서 replace 이용함 */
			String phone = parameter.get("phoneNum").replace("-", "");
			String name = parameter.get("name");
			java.sql.Date bdate = java.sql.Date.valueOf(parameter.get("bdate"));
			System.out.println(phone);
			int deposit = Integer.valueOf(parameter.get("deposit"));

			UserDTO statusModifyUser = new UserDTO();
			
			String page = "";
			
			statusModifyUser.setCode(code);
			statusModifyUser.setEmail(email);
			statusModifyUser.setPhone(phone);
			statusModifyUser.setName(name);
			statusModifyUser.setDate(bdate);
			statusModifyUser.setDeposit(deposit);


			if (!fileList.isEmpty()) {
				
			statusModifyUser.setProfileOrigName(fileList.get(0).get("profileOrigName"));
			statusModifyUser.setProfileUuidName(fileList.get(0).get("profileUUIDName"));
			statusModifyUser.setProfileImgPath(fileList.get(0).get("imgPath"));
			
			}

			
			System.out.println(statusModifyUser+"DTO");
			
			
			if (userService.modifyUserInforPicAdmin(statusModifyUser)) {
				
				page = "/WEB-INF/views/user/result.jsp";
				System.out.println("입력성공");
				request.setAttribute("message", "업로드 성공");
				request.setAttribute("user1Pic", statusModifyUser);

			} else {

				page = "/WEB-INF/views/user/result.jsp";
				System.out.println("입력실패");
				request.setAttribute("message", "업로드 실패!");
			}

			request.getRequestDispatcher(page).forward(request, response);
	
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		
		
		//어떤 종류의 Exception이 발생 하더라도실패 시 파일을 삭제해야 한다.
		int cnt = 0;
		for(int i = 0; i < fileList.size(); i++) {
			Map<String, String> file = fileList.get(i);
			
			File deleteFile = new File(profileThumbUploadDirectory + "/" + file.get("savedFileName"));
			boolean isDeleted = deleteFile.delete();
			
			if(isDeleted) {
				cnt++;
			}
		}
		
		if(cnt == fileList.size()) {
			System.out.println("업로드에 실패한 모든 사진 삭제 완료!");
			e.printStackTrace();
		} else {
			e.printStackTrace();
		}
		
		}
        
	}

}
