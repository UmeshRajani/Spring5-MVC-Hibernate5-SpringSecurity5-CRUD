package com.umesh.myfixer.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

  @Autowired
  private UserDetailsService userDetailsService;
  
  @Bean
  public BCryptPasswordEncoder passwordEncoder() {
    return new BCryptPasswordEncoder();
  };
  
  @Override
  protected void configure(AuthenticationManagerBuilder auth) throws Exception {
    auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());
  }

  @Override
  protected void configure(HttpSecurity http) throws Exception {
	  http.authorizeRequests()
		 .antMatchers("/webrst/**").hasAnyRole("ADMIN","USER") // Restrict Only urls having webrst in path
		 .antMatchers("/resources/**").permitAll() // Makes static resources accessible 
	     .and()
	     .formLogin().loginPage("/").loginProcessingUrl("/loginAction").permitAll() // On login action and on logout it will redirect to index
	     .and()
	     .logout().permitAll() // Permitted to all user
	     .and()
	     .csrf().disable().exceptionHandling().accessDeniedPage("/access-denied");
  }
}
