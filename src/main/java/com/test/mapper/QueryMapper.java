package com.test.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.test.dao.po.*;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface QueryMapper {
    //查询所有的type
    @Select("select id,name from types")
    List<Type> selectTypeData();

    //根据courseId查询Lesson列表
    @Select("select name,`order`,id from lessons where course = #{courseId}")
    List<Lesson> selectLesson(@Param("courseId") Integer courseId);

    //根据lesson的id查询radarmap对象
    @Select("select rhythm_pct,speed_pct,dynamics_pct,audition_pct,coordinate_pct,imitation_pct from radarmaps where lesson=#{lessonId}")
    RadarMap selectRadarMap(@Param("lessonId") Integer lessonId);

    //根据lesson的id查询link的列表
    @Select("select id,name,`order`,res_url,link_type,custom from links where lesson=#{lessonId}")
    List<Link> selectLink(@Param("lessonId") Integer lessonId);

    //根据link的id查询rhythm的列表
    @Select("select id,music_score_url,one_concert_score_url,two_concert_score_url,speed,name,`order`,site from rhythms where link=#{linkId}")
    List<Rhythm> selectRhythm(@Param("linkId")Integer linkId);

    //根据link的id查询basic_play的列表
    @Select("select id,music_score_url,speed,`order`,site from basic_plays where link=#{linkId}")
    List<BasicPlay> selectBasicPlay(@Param("linkId")Integer linkId);

    //根据link的id查询rhythmGame的列表
    @Select("select id,music_score_url,speed,`order` from rhythm_games where link=#{linkId}")
    List<RhythmGame> selectRhythmGame(@Param("linkId") Integer linkId);
    //根据link的id查询rhythmGameExtend的列表
    @Select("select id,rule_music_url,other_music_url,video_url,game_id from rhythm_game_extends where link=#{linkId}")
    List<RhythmGameExtend> selectRhythmGameExtend(@Param("linkId") Integer linkId);

    //根据link的id查询video的列表
    @Select("select id,video_url,`order`,name,comment from videos where link=#{linkId}")
    List<Video> selectVideo(@Param("linkId") Integer linkId);

    //根据rhythm的siteId查询site的列表
    @Select("select code from sites where id = #{siteId}")
    Object[] selectSite(@Param("siteId") Integer siteId);

    //根据rhythm的id查询musics_url的ids
    @Select("select musicId from music_rhythm where rhythmId=#{rhythmId}")
    List<Integer> selectMusicUrlIdByRhythmId(@Param("rhythmId")Integer rhythmId);

    //根据rhythm_game的id查询music_url的ids
    @Select("select musicId from music_rhythmgame where rhythmGameId=#{rhythmGameId}")
    List<Integer> selectMusicUrlIdByRhythmGameId(@Param("rhythmGameId")Integer rhythmGameId);


    //根据basic_play的id查询play_video的列表
    @Select("select name,video_name,url,`order`,comment from play_videos where basic_play=#{basicPlayId}")
    List<PlayVideo> selectPlayVideo(@Param("basicPlayId")Integer basicPlayId);
}
