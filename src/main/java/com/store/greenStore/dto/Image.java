package com.store.greenStore.dto;

import java.util.Date;

public class Image {
	int id;
	int mid;
	String fileName;
	int fileSize;
	Date fileTime;
	byte[] data;

	public int getMid() {
		return mid;
	}

	public void setMid(int mid) {
		this.mid = mid;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public int getFileSize() {
		return fileSize;
	}

	public void setFileSize(int fileSize) {
		this.fileSize = fileSize;
	}

	public Date getFileTime() {
		return fileTime;
	}

	public void setFileTime(Date fileTime) {
		this.fileTime = fileTime;
	}

	public byte[] getData() {
		return data;
	}

	public void setData(byte[] data) {
		this.data = data;
	}

	public String getMimeType() {
		int index = fileName.lastIndexOf('.');
		if (index > 0) {
			String extension = fileName.substring(index + 1).toLowerCase();
			switch (extension) {
			case "png":
			case "bmp":
			case "gif":
				return "image/" + extension;
			}
		}
		return "image/jpeg";
	}

}
