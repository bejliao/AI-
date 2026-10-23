package com.liaoyq.supplychainai.health;

import java.time.Instant;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HealthController {

    private final String applicationName;
    private final String version;

    public HealthController(@Value("${spring.application.name}") String applicationName,
                            @Value("${app.version:dev}") String version) {
        this.applicationName = applicationName;
        this.version = version;
    }

    @GetMapping("/health")
    public HealthResponse health() {
        return new HealthResponse("UP", applicationName, version, Instant.now());
    }

    public record HealthResponse(String status, String application, String version, Instant timestamp) {
    }
}
