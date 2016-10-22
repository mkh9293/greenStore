package com.store.greenStore.service;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.store.greenStore.dto.Notice;
import com.store.greenStore.mapper.NoticeImageMapper;


@Service
public class BbsService {

    @Autowired NoticeImageMapper noticeImageMapper;
/*
    public boolean isAuthor(Article article) {
        return (UserService.getCurrentUser() != null) &&
               (article.getUserId() == UserService.getCurrentUser().getId());
    }

    public boolean canCreate(int boardId) {
        User user = UserService.getCurrentUser();
        if (user == null) return false;
        if ("관리자".equals(user.getUserType())) return true;
        if ("교수".equals(user.getUserType())) return true;
        return boardId == 2;
    }

    public boolean canEdit(Article article) {
        return isAuthor(article);
    }

    public boolean canDelete(Article article) {
        User user = UserService.getCurrentUser();
        if (user == null) return false;
        if ("관리자".equals(user.getUserType())) return true;
        return isAuthor(article);
    }

    public String validate(Article article) {
        if (StringUtils.isBlank(article.getTitle()))
            return "제목을 입력하세요";
        if (StringUtils.isBlank(article.getBody()))
            return "내용을 입력하세요";
        return null;
    }*/

    public void updateArticleImage(Notice article) {
        noticeImageMapper.delete(article.getNkey());
        String pattern = "greenStore/([0-9]+)/image.do";
        Pattern r = Pattern.compile(pattern);
        Matcher m = r.matcher(article.getNcontent());
        while (m.find()) {
            int imageId = Integer.parseInt(m.group(1));
            noticeImageMapper.insert(article.getNkey(), imageId);
        }
    }

}
