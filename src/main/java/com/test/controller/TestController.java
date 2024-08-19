package com.test.controller;

import cn.hutool.core.bean.BeanUtil;
import com.test.dao.dto.*;
import com.test.dao.po.*;
import com.test.dao.vo.ResultDto;
import com.test.mapper.QueryMapper;
import com.test.service.Query4MusicUrlService;
import com.test.service.ShowDataService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/test")
@RequiredArgsConstructor
public class TestController {
    @Autowired
    private QueryMapper queryMapper;

    private final Query4MusicUrlService query4MusicUrlService;
    private final ShowDataService showDataService;
    private List<BodyDto> bodyDtos = new ArrayList<>();
    private List<LessonDto> lessonDtos = new ArrayList<>();

    @GetMapping("/show")
    public ResultDto ShowData() {
        //查询body数据
        List<Course> bodys = showDataService.getBaseMapper().selectList(null);
        //获取bodyDtos
        List<BodyDto> bodyDtos = bodys.stream().map(body -> {
            //获取lessonDtos
            List<LessonDto> lessonDtos = queryMapper.selectLesson(body.getId()).stream().map(lesson -> {
                RadarMap radarMap = queryMapper.selectRadarMap(lesson.getId());
                //获取linkDtos
                List<LinkDto> linkDtos = queryMapper.selectLink(lesson.getId()).stream().map(link -> {
                    //查询rhythms
                    List<RhythmDto> rhythmDtos = queryMapper.selectRhythm(link.getId()).stream().map(rhythm -> {
                        //查询sites
                        Object[]sites = queryMapper.selectSite(rhythm.getSite());
                        //根据rhythmId查询music_url的id
                        List<Integer> ids = queryMapper.selectMusicUrlIdByRhythmId(rhythm.getId());
                        //根据ids查询music_urls
                        List<MusicUrl> musicUrls = query4MusicUrlService.listByIds(ids);
                        List<MusicUrlDto> musicUrlDtos = BeanUtil.copyToList(musicUrls, MusicUrlDto.class);


                        return new RhythmDto(
                                rhythm.getId(),
                                rhythm.getMusicScoreUrl(),
                                rhythm.getOneConcertScoreUrl(),
                                rhythm.getTwoConcertScoreUrl(),
                                rhythm.getSpeed(),
                                rhythm.getName(),
                                rhythm.getOrder(),
                                sites,
                                musicUrlDtos
                        );
                    }).collect(Collectors.toList());

                    //获取basicPlayDtos
                    List<BasicPlayDto> basicPlayDtos = queryMapper.selectBasicPlay(link.getId()).stream().map(basicPlay -> {
                        //查询play_videos
                        List<PlayVideo> playVideos = queryMapper.selectPlayVideo(basicPlay.getId());
                        //获取sites
                        Object[] sites = queryMapper.selectSite(basicPlay.getSite());

                        return new BasicPlayDto(
                                basicPlay.getId(),
                                basicPlay.getMusicScoreUrl(),
                                basicPlay.getSpeed(),
                                basicPlay.getOrder(),
                                sites,
                                playVideos
                        );
                    }).collect(Collectors.toList());

                    //获取rhythmGameDtos
                    List<RhythmGameDto> rhythmGameDtos = queryMapper.selectRhythmGame(link.getId()).stream().map(rhythmGame -> {
                        //根据rhythmGameId查询music_url的id
                        List<Integer> ids = queryMapper.selectMusicUrlIdByRhythmGameId(rhythmGame.getId());
                        //根据ids查询music_urls
                        List<MusicUrl> musicUrls = query4MusicUrlService.listByIds(ids);
                        List<MusicUrlDto> musicUrlDtos = BeanUtil.copyToList(musicUrls, MusicUrlDto.class);
                        //获取rhythmDto
                        RhythmGameDto rhythmGameDto = new RhythmGameDto();
                        BeanUtil.copyProperties(rhythmGame,rhythmGameDto,true);
                        rhythmGameDto.setMusics_url(musicUrlDtos);

                        return rhythmGameDto;
                    }).collect(Collectors.toList());

                    //查询rhythmGameExtends
                    List<RhythmGameExtend> rhythmGameExtends = queryMapper.selectRhythmGameExtend(link.getId());

                    //查询videos
                    List<Video> videos = queryMapper.selectVideo(link.getId());

                    return new LinkDto(
                            link.getId(),
                            link.getName(),
                            link.getOrder(),
                            link.getResUrl(),
                            link.getLinkType(),
                            link.getCustom(),
                            rhythmDtos,
                            new ArrayList<>(),
                            new ArrayList<>(),
                            basicPlayDtos,
                            rhythmGameDtos,
                            rhythmGameExtends,
                            videos
                    );
                }).collect(Collectors.toList());

                return new LessonDto(lesson.getName(), lesson.getOrder(), lesson.getId(), radarMap, linkDtos);
            }).collect(Collectors.toList());

            return new BodyDto(body.getName(), body.getId(), body.getOrder(), lessonDtos);
        }).collect(Collectors.toList());

        //查询type表数据
        List<Type> types = queryMapper.selectTypeData();
        DataDto dataDto = new DataDto(bodyDtos, "1615392351", types);
        return ResultDto.ok(dataDto);
    }
}
