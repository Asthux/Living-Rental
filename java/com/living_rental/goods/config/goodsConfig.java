package com.living_rental.goods.config;

import java.io.IOException;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.FileSystemResource;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

@Configuration
public class goodsConfig {

	/*
    <beans:bean id="multipartResolver" class="org.springframework.web.multipart.commons.CommonsMultipartResolver"> 
		<beans:property name="maxUploadSize" value="52428800"/><!-- 50MB --> 
	</beans:bean>
	
	servelt-context.xml 에서 CommonsMultipartResolver 객체 생성 후 파일 업로드 사이즈 지정을 @Bean 객체로 아래와 같이 설정 가능
	메소드의 이름은 id, class는 반환 데이터, property는 setter
	 */
	@Bean
	public CommonsMultipartResolver multipartResolver() throws IOException {
		CommonsMultipartResolver mr = new CommonsMultipartResolver();
		mr.setMaxUploadSize(1024 * 1024 * 10);//10MB
		mr.setDefaultEncoding("utf-8");
		mr.setUploadTempDir(new FileSystemResource("C:\\tmp"));
		return mr;
	}
}
