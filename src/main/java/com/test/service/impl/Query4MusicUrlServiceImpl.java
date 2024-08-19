package com.test.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.test.dao.po.MusicUrl;
import com.test.mapper.Query4MusicUrlMapper;
import com.test.service.Query4MusicUrlService;
import org.springframework.stereotype.Service;

@Service
public class Query4MusicUrlServiceImpl extends ServiceImpl<Query4MusicUrlMapper, MusicUrl> implements Query4MusicUrlService {

}
