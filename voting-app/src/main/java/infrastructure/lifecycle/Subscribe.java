package infrastructure.lifecycle;

import domain.Election;
import infrastructure.repository.RedisElectionRepository;
import io.quarkus.redis.datasource.ReactiveRedisDataSource;
import io.quarkus.runtime.Startup;
import io.smallrye.mutiny.Multi;
import io.smallrye.mutiny.infrastructure.Infrastructure;
import jakarta.enterprise.context.ApplicationScoped;
import org.jboss.logging.Logger;

@Startup
@ApplicationScoped
public class Subscribe {
    private static final Logger LOGGER = Logger.getLogger(Subscribe.class);

    public Subscribe(ReactiveRedisDataSource reactiveRedisSource, RedisElectionRepository repository) {
        LOGGER.info("Startup: Subscribe");
        Multi<String> sub = reactiveRedisSource.pubsub(String.class).subscribe("elections");
        sub.emitOn(Infrastructure.getDefaultWorkerPool()).subscribe().with(id -> {
            LOGGER.info("Election event received: " + id);
            Election election = repository.findById(id);
            LOGGER.info("Election " + election.id() + " starting");
        }, failure -> {
            LOGGER.error("Error receiving election event", failure);
        });

    }
}
