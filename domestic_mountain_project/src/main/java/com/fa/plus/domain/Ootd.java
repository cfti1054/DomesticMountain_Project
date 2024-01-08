package com.fa.plus.domain;

import org.springframework.web.multipart.MultipartFile;

public class Ootd {
	
	// 게시물
	private long post_num;              
	private long community_category_num;
	private String post_title;          
	private String post_content;        
	private long post_reg_id;           
	private String post_reg_date;       
	private String post_update_date;    
	private long post_hit_count;        
	private long post_visible;          
	private long post_gather;           
	
	// 추가이미지
	private long file_num;              
	// private int post_num;            
	private String saveFilename;        
	private String originalFilename;    
	
	// 댓글
	private long reply_num;
	//private long post_num;
	private long reply_secret;
	private String reply_content;
	private long reply_reg_id;
	private String reply_reg_date;
	private String reply_update_date;
	private int reply_report_count;
	private int reply_visible;
	
	
	// 이 밑에는 뭐임 진영? 맨위에 넘하나는 그냥 가를라고 만든건가 
	private MultipartFile selectFile;

	private String user_name;
	
	//private long reply_num;
	private long replyCount;
	 
	private long post_fileCount;

	}
