package com.test.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.test.dao.po.Course;
import com.test.mapper.ShowDataMapper;
import com.test.service.ShowDataService;
import org.springframework.stereotype.Service;

@Service
public class ShowDataServiceImpl extends ServiceImpl<ShowDataMapper, Course> implements ShowDataService {
}
