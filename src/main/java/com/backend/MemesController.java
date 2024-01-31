package com.backend;

import com.backend.data.MemesEntity;
import com.backend.exchange.GetMemeRequest;
import com.backend.exchange.GetMemesResponse;
import com.backend.repository.MemesRepository;
import com.backend.service.MemesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Primary
@RestController
public class MemesController {
    @Autowired
    private MemesService memesService;

     @Autowired
     private MemesRepository memesRepository;

    @PostMapping("/memes")
    public ResponseEntity<GetMemeRequest> createMeme(@RequestBody MemesEntity meme){
        System.out.println(meme.getName() + " " + meme.getCaption());
        if(meme == null || meme.getName() == null || meme.getUrl() == null || meme.getCaption() == null){
            return ResponseEntity.status(400).build();
        } else if(memesService.isMemeAvailable(meme)){
            return ResponseEntity.status(409).build();
        } else {
            GetMemeRequest newMemeId = memesService.createMeme(meme);
            return ResponseEntity.ok().body(newMemeId);
        }
    }

    @GetMapping("/memes")
    public ResponseEntity<List<GetMemesResponse>> getTopMemes(){
        List<GetMemesResponse> memes = memesService.getMemes();
        return ResponseEntity.ok().body(memes);
    }

    @GetMapping("/memes/{id}")
    public ResponseEntity<GetMemesResponse> getMemeById(@PathVariable String id){
        MemesEntity meme = memesService.getMeme(id);
        if(meme != null){
            GetMemesResponse getMeme = new GetMemesResponse(meme.getName() , meme.getCaption() , meme.getUrl());
            return ResponseEntity.ok().body(getMeme);
        } else {
            return ResponseEntity.status(404).build();
        }
    }
}

