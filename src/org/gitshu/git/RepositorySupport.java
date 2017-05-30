package org.gitshu.git;

import org.apache.commons.io.FileUtils;
import org.eclipse.jgit.lib.Ref;
import org.eclipse.jgit.lib.Repository;
import org.eclipse.jgit.storage.file.FileRepositoryBuilder;

import java.io.File;
import java.io.IOException;

/**
 * Created by Lodour on 17/5/30 07:39.
 * 仓库支持类
 */
public class RepositorySupport {
    private static String getRootDir() {
        return String.format("%s/gitshu", FileUtils.getUserDirectoryPath());
    }

    private static String getProjDir(int projectId) {
        return String.format("%s/%d", getRootDir(), projectId);
    }

    public static File createRepository(int projectId) {
        // 准备文件夹
        String targetPath = getProjDir(projectId);
        try {
            FileUtils.forceMkdir(new File(targetPath));
        } catch (Exception ignored) {
        }

        // 创建仓库
        Repository repository = null;
        try {
            repository = FileRepositoryBuilder.create(new File(targetPath, ".git"));
            repository.create();
        } catch (Exception ignored) {
        }

        return repository != null ? repository.getDirectory() : null;
    }

    public static Repository openRepository(int projectId) {
        String repoDir = getProjDir(projectId);
        FileRepositoryBuilder builder = new FileRepositoryBuilder();
        try {
            Repository repository = builder
                    .setGitDir(new File(repoDir))
                    .readEnvironment()
                    .findGitDir()
                    .build();
            System.out.println("Having repository: " + repository.getDirectory());

            Ref head = repository.getRef("refs/heads/master");
            System.out.println("Ref of refs/heads/master: " + head);
            return repository;
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }
}
