package branchapp;

//import org.springframework.boot.SpringApplication;
//import org.springframework.boot.autoconfigure.SpringBootApplication;
//import org.springframework.context.annotation.Configuration;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@EnableScheduling
@SpringBootApplication
//implements WebServerFactoryCustomizer<ConfigurableServletWebServerFactory>
public class SpringBootWebRun {

    public static void main(String[] args) {
        SpringApplication.run(branchapp.SpringBootWebRun.class, args);
    }
}