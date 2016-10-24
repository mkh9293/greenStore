package com.store.greenStore.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.store.greenStore.dto.Notice;
import com.store.greenStore.mapper.NoticeImageMapper;
import com.store.greenStore.mapper.NoticeMapper;

@Controller

@RequestMapping("/notice/*")
public class NoticeController {
	@Autowired NoticeMapper noticeMapper;
	@Autowired NoticeImageMapper noticeImageMapper;
	
	@RequestMapping(value="/listAll")
	public String list(Model model) {
		model.addAttribute("list", noticeMapper.listAll());
		return "notice/listAll";
	}

	@RequestMapping(value="/write", method = RequestMethod.GET)
	public String write(Model model, Notice board) {
		return "notice/write";
	}
	
	@RequestMapping(value="/write", method = RequestMethod.POST)
	public String write(HttpServletRequest request, Model model, Notice board) {
		noticeMapper.write(board);
    	return "redirect:/notice/listAll";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String update(Model model, @RequestParam("nkey") int nkey, Notice board) {
		model.addAttribute("board", noticeMapper.selectById(nkey));
		return "notice/update";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(Model model, Notice board) {
		noticeMapper.update(board);
		return "redirect:/notice/listAll";
	}

	@RequestMapping("/delete")
	public String delete(Model model, @RequestParam("nkey") int nkey) {
		noticeMapper.delete(nkey);
		return "redirect:/notice/listAll";
	}
	
	@RequestMapping("/service")
	public String service(Model model) {
		return "notice/service";
	}

/*	@RequestMapping(value = "fileUpload", method = RequestMethod.POST)
	public String fileUpload(Model model, MultipartRequest multipartRequest, HttpServletRequest request) throws IOException{
		MultipartFile imgfile = multipartRequest.getFile("Filedata");
		Calendar cal = Calendar.getInstance();
		String fileName = imgfile.getOriginalFilename();
		String fileType = fileName.substring(fileName.lastIndexOf("."), fileName.length());
		String replaceName = cal.getTimeInMillis() + fileType;  
		
		String path = request.getSession().getServletContext().getRealPath("/")+File.separator+"resources/upload";
		FileUpload.fileUpload(imgfile, path, replaceName);
		model.addAttribute("path", path);
		model.addAttribute("filename", replaceName);
		return "notice/file_upload";
	}
	*/
	//se
/*	@RequestMapping("/{id}/image")
	public void image(@PathVariable("id") int id, HttpServletResponse response) throws IOException {
		Image image = imageMapper.selectById(id);
		if (image == null)
			return;
		String fileName = URLEncoder.encode(image.getFileName(), "UTF-8");
		response.setContentType(image.getMimeType());
		response.setHeader("Content-Disposition", "filename=" + fileName + ";");
		try (BufferedOutputStream output = new BufferedOutputStream(response.getOutputStream())) {
			output.write(image.getData());
		}
	}

	@RequestMapping(value = "/smartEditorUpload", method = RequestMethod.POST)
	public String photoUpload(@RequestParam("callback") String callback,
			@RequestParam("callback_func") String callback_func, @RequestParam("Filedata") MultipartFile uploadedFile)
			throws IOException {
		String r;
		String fname = Paths.get(uploadedFile.getOriginalFilename()).getFileName().toString();
		if (uploadedFile.getSize() > 0) {
			Image image = new Image();

			image.setFileName(fname);
			image.setFileSize((int) uploadedFile.getSize());
			image.setData(uploadedFile.getBytes());
			imageMapper.insert(image);
			r = "&bNewLine=true&sFileName=" + fname + "&sFileURL=/greenStore/notice/" + image.getId() + "/image";
		} else
			r = "&errstr=" + fname;
		String url = callback + "?callback_func=" + callback_func + r;
		return "redirect:" + url;
	}*/
/*
	@RequestMapping(value = "/smartEditorUpload5", method = RequestMethod.POST)
	public void multiplePhotoUpload(HttpServletRequest request, HttpServletResponse response) {
		try {
			String fileName = request.getHeader("file-name");
			int fileSize = Integer.parseInt(request.getHeader("file-size"));
			InputStream input = request.getInputStream();
			int count = 0;
			byte[] data = new byte[fileSize];
			while (count < fileSize)
				count += input.read(data, count, data.length - count);
			Image image = new Image();

			image.setFileName(fileName);
			image.setFileSize(fileSize);
			image.setData(data);
			imageMapper.insert(image);
			String s = "&bNewLine=true&sFileName=" + fileName;
			s += "&sFileURL=/greenStore/notice/" + image.getId() + "/image";
			PrintWriter out = response.getWriter();
			out.print(s);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}*/

}
