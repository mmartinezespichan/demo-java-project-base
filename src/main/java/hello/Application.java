package hello;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class Application {

    @RequestMapping("/")
    public String home() {
        return "<html><boby>"
        		+ "<h2>Hello, World! from Trunkbase v.1.0</h2><br /><br /><br />"      
        		+ "<img src=\"/image.png\">"  		
        		+ "</boby></html>";
    }

    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }

}
