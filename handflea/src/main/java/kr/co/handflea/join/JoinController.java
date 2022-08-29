package kr.co.handflea.join;

import java.io.PrintWriter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.handflea.util.dto.MemberDTO;

@Controller
@RequestMapping( value = "/join" )
public class JoinController {

	private static final Logger logger = LoggerFactory.getLogger(JoinController.class);

	@Autowired
	private JoinService service;

	@RequestMapping( value = "/", method = RequestMethod.POST )
	public void join( MemberDTO dto, PrintWriter out ) {
		int successCount = 0;
		successCount = service.join( dto );
		out.print(successCount);
		out.close();
	}//join

	@RequestMapping( value = "/id_chk", method = RequestMethod.GET )
	public void idCheck( String mem_email, PrintWriter out ) {
		int isYN = 0;
		isYN = service.idCheck( mem_email );
		out.print(isYN);
		out.close();
	}//idCheck

	@RequestMapping( value = "/form", method = RequestMethod.GET )
	public String joinForm() {
		return "/join/join_form";//jsp file name
	}//joinForm

}//class

/*
drop table member;

create database handfleatest;

CREATE TABLE `member` (
	`mem_no`	int(11)	primary key auto_increment,
	`mem_name`	Varchar(100)	NOT NULL,
	`mem_email`	Varchar(255)	NOT NULL,
	`mem_pwd`	Varchar(255)	NOT NULL,
	`mdate` datetime not null,
    `post_code`	Varchar(100)	NOT NULL,
	`add_1`	Varchar(100)	NOT NULL,
	`add_2`	Varchar(100)	NOT NULL,
	`pnum`	Varchar(100)	NOT NULL,
	`mem_photo`	Varchar(100)	,
	`mem_photopath`	Varchar(255)	,
	`account_no`	Varchar(100)	,
	`seller_yn`	int(1)	NOT NULL	DEFAULT 0,
	`bank_no`	int(11)
);
*/
