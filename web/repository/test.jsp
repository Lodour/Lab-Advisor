<%--
  Created by IntelliJ IDEA.
  User: Lodour
  Date: 17/5/30
  Time: 19:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta content="origin-when-cross-origin" name="referrer"/>
    <link crossorigin="anonymous"
          href="https://assets-cdn.github.com/assets/frameworks-148da7a2b8b9ad739a5a0b8b68683fed4ac7e50ce8185f17d86aa05e75ed376e.css"
          integrity="sha256-FI2nori5rXOaWguLaGg/7UrH5QzoGF8X2GqgXnXtN24=" media="all" rel="stylesheet"/>
    <link crossorigin="anonymous"
          href="https://assets-cdn.github.com/assets/github-4cb6b37ae0c653978a80cfe0c9288fcb02f00f746d1e076237703e57761c8973.css"
          integrity="sha256-TLazeuDGU5eKgM/gySiPywLwD3RtHgdiN3A+V3YciXM=" media="all" rel="stylesheet"/>
    <meta name="viewport" content="width=device-width">
    <link rel="assets" href="https://assets-cdn.github.com/">
</head>

<body class="logged-in env-production emoji-size-boost">
<div class="position-relative js-header-wrapper ">
    <a href="#start-of-content" tabindex="1" class="accessibility-aid js-skip-to-content">Skip to content</a>
    <div id="js-pjax-loader-bar" class="pjax-loader-bar">
        <div class="progress"></div>
    </div>
    <div class="header" role="banner">
        <div class="container clearfix">
            <a class="header-logo-invertocat" href="https://github.com/" data-hotkey="g d" aria-label="Homepage"
               data-ga-click="Header, go to dashboard, icon:logo">
                <svg aria-hidden="true" class="octicon octicon-mark-github" height="32" version="1.1"
                     viewBox="0 0 16 16" width="32">
                </svg>
            </a>
        </div>
    </div>
</div>

<div role="main">
    <div itemscope itemtype="http://schema.org/SoftwareSourceCode">
        <div id="js-repo-pjax-container" data-pjax-container>


            <div class="pagehead repohead instapaper_ignore readability-menu experiment-repo-nav">
                <div class="container repohead-details-container">

                    <h1 class="private ">

                        <span class="author" itemprop="author"><a href="/UrlToAdminProfile" class="url fn" rel="author">Creater's Name</a></span><!--
--><span class="path-divider">/</span><!--
--><strong itemprop="name"><a href="Repository Url" data-pjax="#js-repo-pjax-container">Repository Name</a></strong>
                    </h1>

                </div>
                <div class="container">

                    <nav class="reponav js-repo-nav js-sidenav-container-pjax"
                         itemscope
                         itemtype="http://schema.org/BreadcrumbList"
                         role="navigation"
                         data-pjax="#js-repo-pjax-container">

  <span itemscope itemtype="http://schema.org/ListItem" itemprop="itemListElement">
    <a href="/Lodour/Lab-Advisor" class="js-selected-navigation-item selected reponav-item" data-hotkey="g c"
       data-selected-links="repo_source repo_downloads repo_commits repo_releases repo_tags repo_branches /Lodour/Lab-Advisor"
       itemprop="url">
      <svg aria-hidden="true" class="octicon octicon-code" height="16" version="1.1" viewBox="0 0 14 16" width="14"><path
              fill-rule="evenodd"
              d="M9.5 3L8 4.5 11.5 8 8 11.5 9.5 13 14 8 9.5 3zm-5 0L0 8l4.5 5L6 11.5 2.5 8 6 4.5 4.5 3z"/></svg>
      <span itemprop="name">Code</span>
      <meta itemprop="position" content="1">
</a>  </span>

                        <span itemscope itemtype="http://schema.org/ListItem" itemprop="itemListElement">
      <a href="/Lodour/Lab-Advisor/issues" class="js-selected-navigation-item reponav-item" data-hotkey="g i"
         data-selected-links="repo_issues repo_labels repo_milestones /Lodour/Lab-Advisor/issues" itemprop="url">
        <svg aria-hidden="true" class="octicon octicon-issue-opened" height="16" version="1.1" viewBox="0 0 14 16"
             width="14"><path fill-rule="evenodd"
                              d="M7 2.3c3.14 0 5.7 2.56 5.7 5.7s-2.56 5.7-5.7 5.7A5.71 5.71 0 0 1 1.3 8c0-3.14 2.56-5.7 5.7-5.7zM7 1C3.14 1 0 4.14 0 8s3.14 7 7 7 7-3.14 7-7-3.14-7-7-7zm1 3H6v5h2V4zm0 6H6v2h2v-2z"/></svg>
        <span itemprop="name">Issues</span>
        <span class="Counter">0</span>
        <meta itemprop="position" content="2">
</a>    </span>

                        <div class="reponav-dropdown js-menu-container">
                            <button type="button" class="btn-link reponav-item reponav-dropdown js-menu-target "
                                    data-no-toggle aria-expanded="false" aria-haspopup="true">
                                Insights
                                <svg aria-hidden="true" class="octicon octicon-triangle-down v-align-middle text-gray"
                                     height="11" version="1.1" viewBox="0 0 12 16" width="8">
                                    <path fill-rule="evenodd" d="M0 5l6 6 6-6z"/>
                                </svg>
                            </button>
                            <div class="dropdown-menu-content js-menu-content">
                                <div class="dropdown-menu dropdown-menu-sw">
                                    <a class="dropdown-item" href="/Lodour/Lab-Advisor/pulse" data-skip-pjax>
                                        <svg aria-hidden="true" class="octicon octicon-pulse" height="16" version="1.1"
                                             viewBox="0 0 14 16" width="14">
                                            <path fill-rule="evenodd"
                                                  d="M11.5 8L8.8 5.4 6.6 8.5 5.5 1.6 2.38 8H0v2h3.6l.9-1.8.9 5.4L9 8.5l1.6 1.5H14V8z"/>
                                        </svg>
                                        Pulse
                                    </a>
                                    <a class="dropdown-item" href="/Lodour/Lab-Advisor/graphs" data-skip-pjax>
                                        <svg aria-hidden="true" class="octicon octicon-graph" height="16" version="1.1"
                                             viewBox="0 0 16 16" width="16">
                                            <path fill-rule="evenodd"
                                                  d="M16 14v1H0V0h1v14h15zM5 13H3V8h2v5zm4 0H7V3h2v10zm4 0h-2V6h2v7z"/>
                                        </svg>
                                        Graphs
                                    </a>
                                </div>
                            </div>
                        </div>
                    </nav>

                </div>
            </div>

            <div class="container new-discussion-timeline experiment-repo-nav">
                <div class="repository-content">


                    <div class="file-navigation">

                        <div class="select-menu branch-select-menu js-menu-container js-select-menu float-left">
                            <button class=" btn btn-sm select-menu-button js-menu-target css-truncate" data-hotkey="w"

                                    type="button" aria-label="Switch branches or tags" tabindex="0"
                                    aria-haspopup="true">
                                <i>Branch:</i>
                                <span class="js-select-button css-truncate-target">master</span>
                            </button>

                            <div class="select-menu-modal-holder js-menu-content js-navigation-container" data-pjax>

                                <div class="select-menu-modal">
                                    <div class="select-menu-header">
                                        <svg aria-label="Close" class="octicon octicon-x js-menu-close" height="16"
                                             role="img" version="1.1" viewBox="0 0 12 16" width="12">
                                            <path fill-rule="evenodd"
                                                  d="M7.48 8l3.75 3.75-1.48 1.48L6 9.48l-3.75 3.75-1.48-1.48L4.52 8 .77 4.25l1.48-1.48L6 6.52l3.75-3.75 1.48 1.48z"/>
                                        </svg>
                                        <span class="select-menu-title">Switch branches/tags</span>
                                    </div>

                                    <div class="select-menu-filters">
                                        <div class="select-menu-text-filter">
                                            <input type="text" aria-label="Find or create a branch…"
                                                   id="context-commitish-filter-field"
                                                   class="form-control js-filterable-field js-navigation-enable"
                                                   placeholder="Find or create a branch…">
                                        </div>
                                        <div class="select-menu-tabs">
                                            <ul>
                                                <li class="select-menu-tab">
                                                    <a href="#" data-tab-filter="branches"
                                                       data-filter-placeholder="Find or create a branch…"
                                                       class="js-select-menu-tab" role="tab">Branches</a>
                                                </li>
                                                <li class="select-menu-tab">
                                                    <a href="#" data-tab-filter="tags"
                                                       data-filter-placeholder="Find a tag…" class="js-select-menu-tab"
                                                       role="tab">Tags</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>

                                    <div class="select-menu-list select-menu-tab-bucket js-select-menu-tab-bucket"
                                         data-tab-filter="branches" role="menu">

                                        <div data-filterable-for="context-commitish-filter-field"
                                             data-filterable-type="substring">


                                            <a class="select-menu-item js-navigation-item js-navigation-open selected"
                                               href="/Lodour/Lab-Advisor/tree/master/src/org/gitshu/workflow/dao"
                                               data-name="master"
                                               data-skip-pjax="true"
                                               rel="nofollow">
                                                <svg aria-hidden="true"
                                                     class="octicon octicon-check select-menu-item-icon" height="16"
                                                     version="1.1" viewBox="0 0 12 16" width="12">
                                                    <path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/>
                                                </svg>
                                                <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                master
              </span>
                                            </a>
                                        </div>

                                    </div>


                                </div>
                            </div>
                        </div>

                        <div class="BtnGroup float-right">

                            <form accept-charset="UTF-8"
                                  action="/Lodour/Lab-Advisor/new/master/src/org/gitshu/workflow/dao"
                                  class="BtnGroup-form" method="post">
                                <button class="btn btn-sm BtnGroup-item" type="submit"
                                        data-disable-with="Creating file…">
                                    Create new file
                                </button>
                            </form>

                            <a href="/Lodour/Lab-Advisor/upload/master/src/org/gitshu/workflow/dao"
                               class="btn btn-sm BtnGroup-item">
                                Upload files
                            </a>

                            <a href="/Lodour/Lab-Advisor/find/master" data-pjax data-hotkey="t"
                               class="js-pjax-capture-input btn btn-sm BtnGroup-item empty-icon">
                                Find file
                            </a>
                            <a href="/Lodour/Lab-Advisor/commits/master/src/org/gitshu/workflow/dao"
                               class="btn btn-sm BtnGroup-item empty-icon tooltipped tooltipped-nw"
                               aria-label="Browse commits for this branch">
                                History
                            </a>
                        </div>
                        <div class="breadcrumb"><span class="repo-root js-repo-root"><span class="js-path-segment"><a
                                href="/Lodour/Lab-Advisor"><span>Lab-Advisor</span></a></span></span><span
                                class="separator">/</span><span class="js-path-segment"><a
                                href="/Lodour/Lab-Advisor/tree/master/src"><span>src</span></a></span><span
                                class="separator">/</span><span class="js-path-segment"><a
                                href="/Lodour/Lab-Advisor/tree/master/src/org"><span>org</span></a></span><span
                                class="separator">/</span><span class="js-path-segment"><a
                                href="/Lodour/Lab-Advisor/tree/master/src/org/gitshu"><span>gitshu</span></a></span><span
                                class="separator">/</span><span class="js-path-segment"><a
                                href="/Lodour/Lab-Advisor/tree/master/src/org/gitshu/workflow"><span>workflow</span></a></span><span
                                class="separator">/</span><strong class="final-path">dao</strong><span
                                class="separator">/</span></div>
                    </div>


                    <div class="commit-tease js-details-container Details">
    <span class="float-right">
      Latest commit
      <a class="commit-tease-sha" href="/Lodour/Lab-Advisor/commit/aab9c5f25a11af498b295cc77790aa4a0fe33865" data-pjax>
        aab9c5f
      </a>
      <span itemprop="dateModified"><relative-time datetime="2017-05-30T08:48:07Z">May 30, 2017</relative-time></span>
    </span>


                        <span class="commit-author-section">
      <img alt="@Lodour" class="avatar" height="20" src="https://avatars0.githubusercontent.com/u/11145354?v=3&amp;s=40"
           width="20"/>
      <a href="/Lodour" class="user-mention" rel="author">Lodour</a>
    </span>

                        <a href="/Lodour/Lab-Advisor/commit/aab9c5f25a11af498b295cc77790aa4a0fe33865" class="message"
                           data-pjax="true" title="update">update</a>
                        </span>

                    </div>


                    <div class="file-wrap">

                        <a href="/Lodour/Lab-Advisor/tree/aab9c5f25a11af498b295cc77790aa4a0fe33865/src/org/gitshu/workflow/dao"
                           class="d-none js-permalink-shortcut" data-hotkey="y">Permalink</a>

                        <table class="files js-navigation-container js-active-navigation-container" data-pjax>
                            <tr class="up-tree js-navigation-item">
                                <td></td>
                                <td><a href="/Lodour/Lab-Advisor/tree/master/src/org/gitshu/workflow"
                                       class="js-navigation-open" rel="nofollow" title="Go to parent directory">..</a>
                                </td>
                                <td></td>
                                <td></td>
                            </tr>


                            <tbody>
                            <tr class="warning include-fragment-error">
                                <td class="icon">
                                    <svg aria-hidden="true" class="octicon octicon-alert" height="16" version="1.1"
                                         viewBox="0 0 16 16" width="16">
                                        <path fill-rule="evenodd"
                                              d="M8.865 1.52c-.18-.31-.51-.5-.87-.5s-.69.19-.87.5L.275 13.5c-.18.31-.18.69 0 1 .19.31.52.5.87.5h13.7c.36 0 .69-.19.86-.5.17-.31.18-.69.01-1L8.865 1.52zM8.995 13h-2v-2h2v2zm0-3h-2V6h2v4z"/>
                                    </svg>
                                </td>
                                <td class="content" colspan="3">Failed to load latest commit information.</td>
                            </tr>

                            <tr class="js-navigation-item">
                                <td class="icon">
                                    <svg aria-hidden="true" class="octicon octicon-file-directory" height="16"
                                         version="1.1" viewBox="0 0 14 16" width="14">
                                        <path fill-rule="evenodd"
                                              d="M13 4H7V3c0-.66-.31-1-1-1H1c-.55 0-1 .45-1 1v10c0 .55.45 1 1 1h12c.55 0 1-.45 1-1V5c0-.55-.45-1-1-1zM6 4H1V3h5v1z"/>
                                    </svg>
                                    <img alt="" class="spinner" height="16"
                                         src="https://assets-cdn.github.com/images/spinners/octocat-spinner-32.gif"
                                         width="16"/>
                                </td>
                                <td class="content">
                                    <span class="css-truncate css-truncate-target"><a
                                            href="/Lodour/Lab-Advisor/tree/master/src/org/gitshu/workflow/dao/impl"
                                            class="js-navigation-open"
                                            id="86ccec3d9ff0e9c0514506e982cdc08b-2d8d0d90cb48264aeed87019eeb999842e547cbc"
                                            title="impl">impl</a></span>
                                </td>
                                <td class="message">
            <span class="css-truncate css-truncate-target">
                  <a href="/Lodour/Lab-Advisor/commit/aab9c5f25a11af498b295cc77790aa4a0fe33865" class="message"
                     data-pjax="true" title="update">update</a>
            </span>
                                </td>
                                <td class="age">
                                    <span class="css-truncate css-truncate-target"><time-ago
                                            datetime="2017-05-30T08:48:07Z">May 30, 2017</time-ago></span>
                                </td>
                            </tr>
                            <tr class="js-navigation-item">
                                <td class="icon">
                                    <svg aria-hidden="true" class="octicon octicon-file-text" height="16" version="1.1"
                                         viewBox="0 0 12 16" width="12">
                                        <path d="M6 5H2V4h4v1zM2 8h7V7H2v1zm0 2h7V9H2v1zm0 2h7v-1H2v1zm10-7.5V14c0 .55-.45 1-1 1H1c-.55 0-1-.45-1-1V2c0-.55.45-1 1-1h7.5L12 4.5zM11 5L8 2H1v12h10V5z"/>
                                    </svg>
                                    <img alt="" class="spinner" height="16"
                                         src="https://assets-cdn.github.com/images/spinners/octocat-spinner-32.gif"
                                         width="16"/>
                                </td>
                                <td class="content">
                                    <span class="css-truncate css-truncate-target"><a
                                            href="/Lodour/Lab-Advisor/blob/master/src/org/gitshu/workflow/dao/WorkflowDAO.java"
                                            class="js-navigation-open"
                                            id="334960a850e92d2bd73b68955890e4ef-9fd938e8a7b8e93dcddeadbf44fd602f32052392"
                                            title="WorkflowDAO.java">WorkflowDAO.java</a></span>
                                </td>
                                <td class="message">
            <span class="css-truncate css-truncate-target">
                  <a href="/Lodour/Lab-Advisor/commit/af2d0d7aeb03bac189c4e7146326673e949cc9c5" class="message"
                     data-pjax="true" title="update">update</a>
            </span>
                                </td>
                                <td class="age">
                                    <span class="css-truncate css-truncate-target"><time-ago
                                            datetime="2017-05-30T08:06:25Z">May 30, 2017</time-ago></span>
                                </td>
                            </tr>
                            </tbody>
                        </table>

                    </div>

                </div>
            </div>

        </div>
    </div>

</div>

</body>
</html>

