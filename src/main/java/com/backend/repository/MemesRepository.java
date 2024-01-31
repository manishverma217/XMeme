package com.backend.repository;

import com.backend.data.MemesEntity;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MemesRepository extends MongoRepository<MemesEntity, String> {
    List<MemesEntity> findByNameAndUrlAndCaption(String name , String url , String caption);
}

