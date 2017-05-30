import org.eclipse.jgit.lib.Repository;
import org.gitshu.git.RepositorySupport;

import java.io.IOException;

/**
 * Created by Lodour on 17/5/30 07:43.
 * test
 */
public class Main {
    public static void main(String[] args) throws IOException {
        Repository repo = RepositorySupport.openRepository(1);
        System.out.println(repo.getDirectory());
    }
}
