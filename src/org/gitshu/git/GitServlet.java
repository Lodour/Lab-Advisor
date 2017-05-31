package org.gitshu.git;

/**
 * Created by Lodour on 17/5/30 19:57.
 */

import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;

@WebServlet(name = "gitServlet", urlPatterns = {"/git/*"},
        loadOnStartup = 1,
        initParams = {
                @WebInitParam(name = "base-path", value = "/Users/Lodour/gitshu/"),
                @WebInitParam(name = "export-all", value = "true")
        })
public class GitServlet extends org.eclipse.jgit.http.server.GitServlet {

}