import org.eclipse.jgit.api.Git;
import org.eclipse.jgit.api.errors.GitAPIException;
import org.eclipse.jgit.lib.Repository;
import org.eclipse.jgit.revwalk.RevCommit;
import org.gitshu.git.RepositorySupport;

import java.io.IOException;

/**
 * Created by Lodour on 17/5/30 07:43.
 * test
 */
public class Main {
    public static void main(String[] args) throws IOException, GitAPIException {
        Repository repository = RepositorySupport.openRepository(5);
        try {
            assert repository != null;
            Git git = new Git(repository);
            Iterable<RevCommit> logs = git.log()
                    .call();
            int count = 0;
            for (RevCommit rev : logs) {
                System.out.println("Commit: " + rev + ", name: " + rev.getName() + ", id: " + rev.getId().getName());
                count++;
            }
            System.out.println("Had " + count + " commits overall on current branch");
        } catch (Exception ignore) {
        }
    }
}

