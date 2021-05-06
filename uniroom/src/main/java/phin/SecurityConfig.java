package phin;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Autowired
	DataSource dataSource;

	@Autowired
	public void configAuthentication(AuthenticationManagerBuilder auth) throws Exception {
		auth.jdbcAuthentication()
		.dataSource(dataSource)
		.passwordEncoder(passwordEncoder())
		.usersByUsernameQuery("select username, password, enabled from users where username=?")
		.authoritiesByUsernameQuery("select username, name from users u inner join roles r on u.role_id = r.id where username= ?");
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests()
		.antMatchers("/admin/index.html").access("hasAnyRole('ROLE_ADMIN','ROLE_MODIFIER')")
		.antMatchers("/admin/index").access("hasAnyRole('ROLE_ADMIN','ROLE_MODIFIER')")
		.antMatchers("/admin/user/del/**").access("hasRole('ROLE_ADMIN')")
		.antMatchers("/admin/user/edit/**").access("hasAnyRole('ROLE_ADMIN','ROLE_MODIFIER')")
		.antMatchers("/admin/user/index").access("hasAnyRole('ROLE_ADMIN','ROLE_MODIFIER')")
		.antMatchers("/admin/user/add/**").access("hasRole('ROLE_ADMIN')")
		.antMatchers("/admin/guide/edit/**").access("hasAnyRole('ROLE_ADMIN','ROLE_MODIFIER')")
		.antMatchers("/admin/guide/add/**").access("hasAnyRole('ROLE_ADMIN','ROLE_MODIFIER')")
		.antMatchers("/admin/guide/index").access("hasAnyRole('ROLE_ADMIN','ROLE_MODIFIER')")
		.antMatchers("/admin/guide/del/**").access("hasRole('ROLE_ADMIN')")
		.antMatchers("/admin/feedback/del/**").access("hasRole('ROLE_ADMIN')")
		.antMatchers("/admin/feedback/**").access("hasAnyRole('ROLE_ADMIN','ROLE_MODIFIER')")
		.antMatchers("/admin/post/**").access("hasAnyRole('ROLE_ADMIN','ROLE_MODIFIER')")
		.antMatchers("/admin/indexuser/**").access("hasAnyRole('ROLE_ADMIN','ROLE_USER','ROLE_MODIFIER')")
		.antMatchers("/user/**").access("hasAnyRole('ROLE_ADMIN','ROLE_USER','ROLE_MODIFIER')")
		.antMatchers("/admin/**").access("hasAnyRole('ROLE_ADMIN','ROLE_USER','ROLE_MODIFIER')")
		.antMatchers("/").permitAll()
		.and()
		.formLogin()
		.usernameParameter("username")
		.passwordParameter("password")
		.loginPage("/auth/login")
		.loginProcessingUrl("/auth/login")
		.failureUrl("/auth/login?msg=Error")
		.defaultSuccessUrl("/user/index.html", true)
		.and()
		.logout()
		.logoutUrl("/auth/logout")
		.logoutSuccessUrl("/login.html")
		.and()
		.exceptionHandling()
		.accessDeniedPage("/error.html")
		.and().csrf().disable();
	}

	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
}
