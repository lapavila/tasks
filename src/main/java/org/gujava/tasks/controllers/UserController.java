package org.gujava.tasks.controllers;

import br.com.caelum.vraptor.*;
import br.com.caelum.vraptor.view.Results;
import org.gujava.tasks.models.User;
import org.gujava.tasks.repositories.UserRepository;

@Resource
public class UserController {

    private final Result result;
    private final UserRepository repository;

    private final Validator validator;

    public UserController(Result result, UserRepository repository, Validator validator) {
        this.result = result;
        this.repository = repository;

        this.validator = validator;
    }

    @Get("/users")
    public void index() {
        result.use(Results.json())
                .withoutRoot()
                .from(repository.findAll())
                .serialize();
    }

    @Post("/users")
    @Consumes("application/json")
    public void create(User user) {
        user.setName(user.getName());
        repository.create(user);
        result.use(Results.json()).withoutRoot().from(user).serialize();
    }

    @Put("/users")
    @Consumes("application/json")
    public void update(User user) {
        repository.update(user);
        result.nothing();
    }

    @Get("/users/{user.id}")
    public void show(User user) {
        result.use(Results.json()).withoutRoot().from(repository.find(user.getId())).serialize();
    }

    @Delete("/users/{id}")
    public void destroy(Long id) {
        repository.destroy(repository.find(id));
        result.nothing();
    }
}