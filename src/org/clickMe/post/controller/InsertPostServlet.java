package org.clickMe.post.controller;

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
import org.clickMe.common.model.dto.ImgFileDTO;
import org.clickMe.common.model.dto.PostDTO;
import org.clickMe.common.model.dto.UserDTO;
import org.clickMe.post.model.service.PostService;

import net.coobird.thumbnailator.Thumbnails;

@WebServlet("/post/insert")
public class InsertPostServlet extends HttpServlet {
	private static final long serialVersionUID = 3327419458982078019L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println(InsertPostServlet.class.getName() + " is successfully called.");
		
		String forwardingPath = "/WEB-INF/views/post/insertPostForm.jsp";
		
		request.getRequestDispatcher(forwardingPath).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PostService postService = new PostService();
		
		/* 게시글 관련 사진이 저장될 곳의 경로 */
		final String originalSavePath = "/resource/upload/post/original/";
		final String thumbnailSavePath = "/resource/upload/post/thumbnail/";
		
		System.out.println(InsertPostServlet.class.getName() + " is successfully called.");
		
		if (ServletFileUpload.isMultipartContent(request)) {	// form태그의 encType 속성 체크
			String rootPath = getServletContext().getRealPath("/");
			int maxFileSize = 1024 * 1024 * 10;
			String encodingType = "UTF-8";
			
			System.out.println("파일 저장 ROOT 경로 : " + rootPath);
			System.out.println("최대 업로드 파일 용량 : " + maxFileSize);
			System.out.println("인코딩 방식 : " + encodingType);
			
			String fileUploadDirectoryPath = rootPath + originalSavePath;
			String thumbnailDirectoryPath = rootPath + thumbnailSavePath;
			System.out.println("fileUploadDirectoryPath : " + fileUploadDirectoryPath);
			System.out.println("thumbnailDirectoryPath : " + thumbnailDirectoryPath);
			
			File originalDirectory = new File(fileUploadDirectoryPath);
			File thumbnailDirectory = new File(thumbnailDirectoryPath);
			
			if(!originalDirectory.exists() || !thumbnailDirectory.exists()) {	// 위에서 지정한 파일 저장경로가 존재하지 않는 경우
				/* 디렉토리를 한 개만 생성할거면 mkdir, 존재하지 않는 부모 디렉토리도 생성하려면 mkdirs를 이용한다. */
				System.out.println("===== 파일 저장경로가 존재하지 않습니다. =====");
				System.out.println("폴더 생성 : " + originalDirectory.mkdirs());
				System.out.println("폴더 생성 : " + thumbnailDirectory.mkdirs());
			}
			
			/* 이게 최종적으로 request를 parsing하고 파일을 저장한 뒤 필요한 내용을 담을 리스트와 맵이다.
			 * 파일에 대한 정보는 리스트에, 다른 파라미터의 정보는 모두 맵에 담을 것이다.
			 * */
			Map<String, String> parameter = new HashMap<>();
			List<Map<String, String>> fileList = new ArrayList<>();
			
			/* 파일을 업로드할 시 최대 크기나 임시 저장할 폴더의 경로 등을 포함하기 위한 인스턴스이다. */
			DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
	        fileItemFactory.setRepository(new File(fileUploadDirectoryPath));
	        fileItemFactory.setSizeThreshold(maxFileSize);
	        
	        /* 서블릿에서 기본 제공하는거 말고 꼭 commons fileupload 라이브러이에 있는 클래스로 임포트 해야 한다. */
	        ServletFileUpload fileUpload = new ServletFileUpload(fileItemFactory);	// import org.apache.commons.fileupload.servlet.ServletFileUpload;
	        
	        try {
				List<FileItem> fileItems = fileUpload.parseRequest(request);		// import org.apache.commons.fileupload.FileItem;
				
				System.out.println("fileItems List 확인용 출력 - size : " + fileItems.size());
				for (FileItem item : fileItems) {
					System.out.println(item);
				}
				
				/* 위에서 출력해본 모든 item들을 다 처리할 것이다. */
				for (int i = 0; i < fileItems.size(); i++) {
					FileItem item = fileItems.get(i);
					
					/* 
					 * < isFormField() 메소드에 대해... >
					 *   - true : FileItem 객체가 단순 form 필드임을 나타낼 때
					 *   - false : FileItem 객체가 업로드 된파일임을 나타낼 때
					 */
					if (!item.isFormField()) {	// item 객체가 업로드 된 파일일 때
						if (item.getSize() > 0) {	// 파일 사이즈가 0보다 클 때 = 전송된 파일이 존재한다.
													// 해당 if()문의 else() 블록은 없다! 파일이 아닌 경우에 대한 로직은 없다!
							/* 1. 저장할 파일 이름 생성 */
							/* 1.1. 업로드된 파일의 이름 추출 */
							String fieldName = item.getFieldName();		// form 필드 이름
							String originalFileName = item.getName();	// 클라이언트 PC의 파일 시스템상의 파일의 원본 이름
							
							/* 1.2. 업로드된 파일의 확장자명 추출 */
							int dotIndex = originalFileName.lastIndexOf(".");
							String extension = originalFileName.substring(dotIndex);
							
							/* 1.3. 랜덤 파일명 생성 */
							String randomFileName = UUID.randomUUID().toString().replace("-", "") + extension;
							
							/* 2. 저장하고자 하는 경로에 파일 저장 */
							/* 2.1. 앞에서 생성한 저장 경로와 랜덤 이름으로 파일 인스턴스를 생성 */
							File storeFile = new File(fileUploadDirectoryPath + "/" + randomFileName);
							
							/* 2.2. 파일 저장 */
							item.write(storeFile);	// 최상위 예외인 Exception을 예외 처리
							
							/* 3. Collection에 하나의 파일에 대한 정보를 저장 */
							Map<String, String> fileMap = new HashMap<>();
							fileMap.put("fieldName", fieldName);
							fileMap.put("origName", originalFileName);
							fileMap.put("uuidName", randomFileName);
							fileMap.put("origPath", fileUploadDirectoryPath);
							
							/* 4. 썸네일 이미지 생성 */
							/* 4.1. 대표 이미지와 일반 이미지를 구별하여 썸네일 이미지로 변환할 크기를 지정한다. */
							int width = 0;
							int height = 0;
							if("thumbnailImg1".equals(fieldName)) {	// 대표 이미지일 경우
								fileMap.put("imgType", "REPRESENTATIVE");
								width = 350;
								height = 200;
							} else {	// 일반 이미지일 경우
								fileMap.put("imgType", "NORMAL");
								width = 120;
								height = 100;
							}
							
							/* 4.2. 썸네일 변환 후 저장 */
							Thumbnails.of(fileUploadDirectoryPath + randomFileName)			// 파일 이름과
							.size(width, height)											// 사이즈로
							.toFile(thumbnailDirectoryPath + "thumbnail_" + randomFileName);	// 썸네일 저장
							
							/* 4.3. 게시판 목록에서 대표 이미지를 썸네일로 보기 위해 썸네일 이미지의 저장 경로도 함께 저장  */
							fileMap.put("thumbPath", thumbnailSavePath + "thumbnail_" + randomFileName);
							
							fileList.add(fileMap);
							/* < fileMap에 저장된 하나의 사진 파일에 대한 정보들 >
							 * - fieldName : 필드 이름
							 * - origName : 업로드된 원본 사진파일 이름
							 * - uuidName : 암호화되어 저장된 파일 이름
							 * - origPath : 원본 파일 저장 경로
							 * - imgType : 대표 이미지 여부
							 * - thumbPath : 썸네일 파일 저장 경로
							 */
						}
						
					} else {	// item 객체가 단순 form 데이터일 때 = 파일이 아닌 데이터일 때
						/* 전송된 폼의 name은 getFieldName()으로 받아오고, 해당 필드의 value는 getString()으로 받아온다. 
						 * 하지만 인코딩 설정을 하더라도 전송되는 파라미터는 ISO-8859-1로 처리된다.
						 * 별도로 ISO-8859-1로 해석된 한글을 UTF-8로 변경해주어야 한다.
						 * */
						
						/* 파일이 아닌 데이터들은 Map에 저장한다. */
						parameter.put(item.getFieldName(), new String(item.getString().getBytes("ISO-8859-1"), "UTF-8"));
						/* < parameter에 저장될 파일이 아닌 input 태그들 >
						 *   - title : 게시글 제목
						 *   - catCode : 게시글 카테고리
						 *   - authCode : 게시글 감정신청
						 *   - itemPrice : 상품 가격
						 *   - content : 게시글 내용
						 *   - 주의! 게시글 작성자는 밑에서 session을 통해 얻는다!
						 */
					}
					
				}	// for() loop의 종료
				
				System.out.println("Map<String, String> parameter : " + parameter);
				System.out.println("List<Map<String, String>> fileList : " + fileList);
				
				/* PostDTO에 작성할 게시물의 정보를 담는다.*/
				PostDTO post = new PostDTO();
				post.setTitle(parameter.get("title"));
				post.setCatCode(Integer.valueOf(parameter.get("catCode")));
				post.setAuthCode(Integer.valueOf(parameter.get("authCode")));
				post.setItemPrice(Integer.valueOf(parameter.get("itemPrice")));
				post.setContent(parameter.get("content"));
				post.setSellerCode(((UserDTO) request.getSession().getAttribute("loginUser")).getCode());
				
				post.setImgFileList(new ArrayList<ImgFileDTO>());		// ImgFileDTO 내부의 List타입 멤버변수 imgFileList 
				List<ImgFileDTO> imgFileList = post.getImgFileList();
				for (int i = 0; i < fileList.size(); i++) {
					Map<String, String> file = fileList.get(i);
					
					ImgFileDTO imgFileInfo = new ImgFileDTO();
					imgFileInfo.setOrigName(file.get("origName"));
					imgFileInfo.setUuidName(file.get("uuidName"));
					imgFileInfo.setOrigPath(file.get("origPath"));
					imgFileInfo.setImgType(file.get("imgType"));
					imgFileInfo.setThumbPath(file.get("thumbPath"));
					
					imgFileList.add(imgFileInfo);
				}
				
				System.out.println("post : " + post);
				
				String forwardingPath = "";
				if (postService.insertPost(post)) {
					forwardingPath = "/WEB-INF/views/common/success.jsp";
					request.setAttribute("successCode", "insertPost");
				} else {
					forwardingPath = "/WEB-INF/views/common/failed.jsp";
					request.setAttribute("errorCode", "insertPost");
				}
				
				request.getRequestDispatcher(forwardingPath).forward(request, response);
				
			} catch (Exception e) {
				//어떤 종류의 Exception이 발생 하더라도실패 시 파일을 삭제해야 한다.
				int cnt = 0;
				for (int i = 0; i < fileList.size(); i++) {
					Map<String, String> file = fileList.get(i);
					
					File deleteFile = new File(fileUploadDirectoryPath + "/" + file.get("uuidName"));
					boolean isDeleted = deleteFile.delete();
					
					if (isDeleted) {
						cnt++;
					}
				}
				
				if(cnt == fileList.size()) {
					System.out.println("업로드에실패한 모든 사진 삭제 완료!");
					e.printStackTrace();
				} else {
					System.out.println("업로드에실패한 모든 사진 삭제 실패!");
					e.printStackTrace();
				}
			}
		}
	}

}
