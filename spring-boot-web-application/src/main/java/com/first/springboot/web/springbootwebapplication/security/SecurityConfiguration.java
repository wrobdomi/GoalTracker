package com.first.springboot.web.springbootwebapplication.security;

import java.util.Arrays;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.ldap.DefaultSpringSecurityContextSource;


@EnableGlobalMethodSecurity
@Configuration
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {
	
	
			// Permit all users to login, permit to see H2-console ( debugging )
			@Override
			protected void configure(HttpSecurity http) throws Exception {
			http.authorizeRequests().antMatchers("/login", "/h2-console/**").permitAll()
					.antMatchers("/", "/*todo*/**", "/*motivation/**").fullyAuthenticated().and()
					.formLogin().loginPage("/login");
		
			
			// for getting access to h2 console  
			http.csrf().disable();
			http.headers().frameOptions().disable();
	}
	



	    @Override
	    public void configure(AuthenticationManagerBuilder auth) throws Exception {
	        auth
	                .ldapAuthentication()
	                .userDnPatterns("uid={0},ou=people")
	                .groupSearchBase("ou=groups")
	                .contextSource(contextSource())
	                .passwordCompare()
	                .passwordAttribute("userPassword");
	    }

	    @Bean
	    public DefaultSpringSecurityContextSource contextSource() {
	        return new DefaultSpringSecurityContextSource(Arrays.asList("ldap://localhost:8389/"), "dc=springframework,dc=org");
	    }
	    
	}
	
