package com.living_rental.board.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

@Configuration
public class FileConfig {
	/*
    <beans:bean id="multipartResolver" class="org.springframework.web.multipart.commons.CommonsMultipartResolver"> 
		<beans:property name="maxUploadSize" value="52428800"/><!-- 50MB --> 
	</beans:bean>
	
	servelt-context.xml 에서 CommonsMultipartResolver 객체 생성 후 파일 업로드 사이즈 지정을 @Bean 객체로 아래와 같이 설정 가능
	메소드의 이름은 id, class는 반환 데이터, property는 setter
 */
	@Bean
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver mr = new CommonsMultipartResolver();
		mr.setMaxUploadSize(52428800);//50MB
		mr.setDefaultEncoding("utf-8");
		return mr;
	}
}
