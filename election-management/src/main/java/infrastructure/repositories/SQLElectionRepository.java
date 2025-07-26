package infrastructure.repositories;

import domain.ElectionRepository;
import infrastructure.repositories.entities.Election;
import infrastructure.repositories.entities.ElectionCandidate;

import javax.enterprise.context.ApplicationScoped;
import javax.persistence.EntityManager;
import javax.transaction.Transactional;

@ApplicationScoped
public class SQLElectionRepository implements ElectionRepository {
    private final EntityManager entityManager;

    public SQLElectionRepository(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    @Override
    @Transactional
    public void submit(domain.Election election) {
        entityManager.merge(Election.fromDomain(election));

        election.votes().entrySet().stream().map(entry -> ElectionCandidate.fromDomain(election, entry.getKey(),
                entry.getValue())).forEach(entityManager::merge);
    }
}
