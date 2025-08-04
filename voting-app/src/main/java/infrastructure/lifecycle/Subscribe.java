package infrastructure.lifecycle;

import infrastructure.repository.RedisElectionRepository;
import io.quarkus.redis.datasource.ReactiveRedisDataSource;
import io.quarkus.runtime.Startup;
import io.smallrye.mutiny.infrastructure.Infrastructure;
import jakarta.enterprise.context.ApplicationScoped;
import org.jboss.logging.Logger;

@Startup
@ApplicationScoped
public class Subscribe {
    private static final Logger LOGGER = Logger.getLogger(Subscribe.class);

    public Subscribe(ReactiveRedisDataSource reactiveRedisSource, RedisElectionRepository repository) {
        LOGGER.info("Startup: Subscribe");
        reactiveRedisSource.pubsub(String.class)
                .subscribe("elections").
                emitOn(Infrastructure.getDefaultWorkerPool())
                .subscribe()
                .with(id -> {
                    LOGGER.info("Election event received: " + id);
                    LOGGER.info("Election " + repository.findById(id) + " starting");
                }, failure -> {
                    LOGGER.error("Error receiving election event", failure);
                });

    }
}
