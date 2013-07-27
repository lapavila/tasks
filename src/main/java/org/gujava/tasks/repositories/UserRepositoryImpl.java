package org.gujava.tasks.repositories;

import javax.persistence.EntityManager;

import br.com.caelum.vraptor.ioc.Component;
import org.gujava.tasks.models.User;

@Component
public class UserRepositoryImpl
    extends Repository<User, Long>
    implements UserRepository {

	UserRepositoryImpl(EntityManager entityManager) {
		super(entityManager);
	}
}
