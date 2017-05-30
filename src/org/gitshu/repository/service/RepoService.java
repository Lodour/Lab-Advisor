package org.gitshu.repository.service;

import java.io.File;

/**
 * Created by Lodour on 17/5/30 10:03.
 * 仓库服务
 */
public interface RepoService {
    /**
     * 创建仓库
     *
     * @param projectId 项目代码
     */
    void create(int projectId);

    /**
     * 获取项目仓库中的文件信息
     *
     * @param projectId 项目代码
     * @param path      文件路径
     */
    File[] getFiles(int projectId, String path);
}
