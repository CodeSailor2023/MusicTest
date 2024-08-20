package com.test.controller;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.test.dao.dto.*;
import com.test.dao.po.*;
import com.test.dao.vo.ResultDto;
import com.test.mapper.*;
import lombok.RequiredArgsConstructor;
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

    private final BodyServiceMapper bodyServiceMapper;
    private final LessonServiceMapper lessonServiceMapper;
    private final RadarMapper radarMapper;
    private final LinkMapper linkMapper;
    private final RhythmMapper rhythmMapper;
    private final SiteMapper siteMapper;
    private final MusicRhythmMapper musicRhythmMapper;
    private final BasicPlayMapper basicPlayMapper;
    private final PlayVideoMapper playVideoMapper;
    private final RhythmGameMapper rhythmGameMapper;
    private final MusicRhythmGameMapper musicRhythmGameMapper;
    private final RhythmGameExtendMapper rhythmGameExtendMapper;
    private final VideoMapper videoMapper;
    private final TypeMapper typeMapper;
    private final Query4MusicUrlMapper query4MusicUrlMapper;


    @GetMapping("/show")
    public ResultDto ShowData() {
        //查询body数据
        List<Course> bodys = bodyServiceMapper.selectList(null);
        //获取bodyDtos
        List<BodyDto> bodyDtos = bodys.stream().map(body -> {
            //获取lessonDtos
            List<LessonDto> lessonDtos = lessonServiceMapper
                    .selectList(new QueryWrapper<Lesson>().eq("course", body.getId()))
                    .stream()
                    .map(lesson -> {
                        RadarMap radarMap = radarMapper
                                .selectOne(new QueryWrapper<RadarMap>()
                                        .eq("lesson", lesson.getId()));
                        //获取linkDtos
                        List<LinkDto> linkDtos = linkMapper
                                .selectList(new QueryWrapper<Link>().eq("lesson", lesson.getId()))
                                .stream().map(link -> {
                                    //查询rhythms
                                    List<RhythmDto> rhythmDtos = rhythmMapper
                                            .selectList(new QueryWrapper<Rhythm>().eq("link", link.getId()))
                                            .stream().map(rhythm -> {
                                                //查询sites
                                                Integer[] sites = getSites(rhythm.getSite());
                                                //根据rhythmId查询music_url的id
                                                List<Integer> ids = musicRhythmMapper.
                                                        selectList(new QueryWrapper<MusicRhythm>()
                                                                .eq("rhythm_id", rhythm.getId())).stream()
                                                        .map(musicRhythm -> musicRhythm.getMusicId()).collect(Collectors.toList());
                                                //根据ids查询music_urls
                                                List<MusicUrl> musicUrls = query4MusicUrlMapper.selectBatchIds(ids);
                                                List<MusicUrlDto> musicUrlDtos = BeanUtil.copyToList(musicUrls, MusicUrlDto.class);

                                                //拷贝rhythm到rhythmDto
                                                RhythmDto rhythmDto = new RhythmDto();
                                                BeanUtil.copyProperties(rhythm,rhythmDto,true);
                                                rhythmDto.setSites(sites);
                                                rhythmDto.setMusics_url(musicUrlDtos);
                                                return rhythmDto;
                                            }).collect(Collectors.toList());

                                    //获取basicPlayDtos
                                    List<BasicPlayDto> basicPlayDtos = basicPlayMapper
                                            .selectList(new QueryWrapper<BasicPlay>().eq("link", link.getId()))
                                            .stream().map(basicPlay -> {
                                                //查询play_videos
                                                List<PlayVideo> playVideos = playVideoMapper
                                                        .selectList(new QueryWrapper<PlayVideo>()
                                                                .eq("basic_play", basicPlay.getId()));
                                                //获取sites
                                                Integer[] sites = getSites(basicPlay.getSite());
                                                //拷贝basicPlay到basicPlayDto
                                                BasicPlayDto basicPlayDto = new BasicPlayDto();
                                                BeanUtil.copyProperties(basicPlay,basicPlayDto,true);
                                                basicPlayDto.setSite(sites);
                                                basicPlayDto.setPlay_video(playVideos);
                                                return basicPlayDto;
                                            }).collect(Collectors.toList());

                                    //获取rhythmGameDtos
                                    List<RhythmGameDto> rhythmGameDtos = rhythmGameMapper
                                            .selectList(new QueryWrapper<RhythmGame>().eq("link", link.getId()))
                                            .stream().map(rhythmGame -> {
                                                //根据rhythmGameId查询music_url的id
                                                List<Integer> ids = musicRhythmGameMapper.selectList(new QueryWrapper<MusicRhythmGame>()
                                                                .eq("rhythm_game_id", rhythmGame.getId()))
                                                        .stream().map(musicRhythmGame -> musicRhythmGame.getMusicId())
                                                        .collect(Collectors.toList());

                                                //根据ids查询music_urls
                                                List<MusicUrl> musicUrls = query4MusicUrlMapper.selectBatchIds(ids);
                                                List<MusicUrlDto> musicUrlDtos = BeanUtil.copyToList(musicUrls, MusicUrlDto.class);
                                                //拷贝rhythmGame到rhythmGameDto
                                                RhythmGameDto rhythmGameDto = new RhythmGameDto();
                                                BeanUtil.copyProperties(rhythmGame, rhythmGameDto, true);
                                                rhythmGameDto.setMusics_url(musicUrlDtos);

                                                return rhythmGameDto;
                                            }).collect(Collectors.toList());

                                    //查询rhythmGameExtends
                                    List<RhythmGameExtend> rhythmGameExtends = rhythmGameExtendMapper
                                            .selectList(new QueryWrapper<RhythmGameExtend>()
                                                    .eq("link", link.getId()));

                                    //查询videos
                                    List<Video> videos = videoMapper
                                            .selectList(new QueryWrapper<Video>().eq("link", link.getId()));
                                    
                                    //拷贝link到linkDto
                                    LinkDto linkDto = new LinkDto();
                                    BeanUtil.copyProperties(link,linkDto,true);
                                    linkDto.setRhythms(rhythmDtos);
                                    linkDto.setSongs(new ArrayList<>());
                                    linkDto.setBasic_coordinate(new ArrayList<>());
                                    linkDto.setBasic_play(basicPlayDtos);
                                    linkDto.setRhythm_game(rhythmGameDtos);
                                    linkDto.setRhythm_game_extend(rhythmGameExtends);
                                    linkDto.setVideos(videos);
                                    return linkDto;
                                }).collect(Collectors.toList());

                        return new LessonDto(lesson.getName(), lesson.getOrder(), lesson.getId(), radarMap, linkDtos);
                    }).collect(Collectors.toList());

            return new BodyDto(body.getName(), body.getId(), body.getOrder(), lessonDtos);
        }).collect(Collectors.toList());

        //查询type表数据
        List<Type> types = typeMapper.selectList(null);

        DataDto dataDto = new DataDto(bodyDtos, "1615392351", types);
        return ResultDto.ok(dataDto);
    }

    private Integer[] getSites(Integer id) {
        Integer[] sites = new Integer[]{};
        if (siteMapper.selectById(id) != null) {
            sites = new Integer[]{
                    siteMapper.selectById(id).getCode()
            };
        }
        return sites;
    }
}
