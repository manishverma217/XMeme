package com.backend.service;

import com.backend.data.MemesEntity;
import com.backend.exchange.GetMemeRequest;
import com.backend.exchange.GetMemesResponse;
import com.backend.repository.MemesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class MemesService {

    @Autowired
    private MemesRepository memesRepository;

    public GetMemeRequest createMeme(MemesEntity meme){
        LocalTime now = LocalTime.now();
        meme.setCreatedAt(now);
        MemesEntity newMeme = memesRepository.save(meme);
        GetMemeRequest response = new GetMemeRequest(newMeme.getId());
        return response;
    }

    public boolean isMemeAvailable(MemesEntity meme){
        if(!memesRepository.findByNameAndUrlAndCaption(meme.getName(), meme.getUrl(), meme.getCaption()).isEmpty()){
            return true;
        }
        return false;
    }

    public MemesEntity getMeme(String id){
        MemesEntity meme = memesRepository.findById(id).orElse(null);
        return meme;
    }
    public List<GetMemesResponse> getMemes(){
        List<MemesEntity> memes = memesRepository.findAll()
                .stream()
                .sorted(Comparator.comparing(MemesEntity::getId).reversed())
                .limit(100)
                .collect(Collectors.toList());

        List<GetMemesResponse> memesResponses = new ArrayList<>();
        for(MemesEntity meme : memes){
            GetMemesResponse newMeme = new GetMemesResponse();
            newMeme.setName(meme.getName());
            newMeme.setUrl(meme.getUrl());
            newMeme.setCaption(meme.getCaption());
            memesResponses.add(newMeme);
        }
        return memesResponses;
    }
}
