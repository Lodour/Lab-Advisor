package org.gitshu.repository.service.impl;

import org.apache.commons.io.FileUtils;
import org.gitshu.git.RepositorySupport;
import org.gitshu.repository.service.RepoService;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.IOException;

/**
 * Created by Lodour on 17/5/30 10:04.
 * 仓库服务实现
 */
@Service
public class RepoServiceImpl implements RepoService {
    /**
     * 创建仓库
     *
     * @param projectId 项目代码
     */
    @Override
    public void create(int projectId) {
        RepositorySupport.createRepository(projectId);
    }

    /**
     * 获取项目仓库中的文件信息
     *
     * @param projectId 项目代码
     * @param path      文件路径
     */
    @Override
    public File[] getFiles(int projectId, String path) {
        String root = String.format("%s/gitshu/%d", FileUtils.getUserDirectoryPath(), projectId);
        String abstractPath = String.format("%s%s", root, path);
        File file = new File(abstractPath);
        if (!file.exists())
            return null;
        try {
            if (!file.getCanonicalPath().startsWith(root))
                return null;
        } catch (IOException e) {
            return null;
        }
        if (file.isDirectory())
            return file.listFiles((dir, name) -> true);
        else {
            File[] files = new File[2];
            files[0] = null;
            files[1] = file;
            return files;
        }
    }

}
