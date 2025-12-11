@RestController
public class HelloController {
    @GetMapping("/")
    public String hello() {
        return "Hello from K8s!";
    }
}
