//
//  Repo.swift
//  carrefour
//
//  Created by Pedro Sousa on 28/06/23.
//

import Foundation

struct Repo: Codable {

  var id                       : Int?      = nil
  var nodeId                   : String?   = nil
  var name                     : String?   = nil
  var fullName                 : String?   = nil
  var isPrivate                : Bool?     = nil
  var owner                    : Owner?    = Owner()
  var htmlUrl                  : String?   = nil
  var description              : String?   = nil
  var fork                     : Bool?     = nil
  var url                      : String?   = nil
  var forksUrl                 : String?   = nil
  var keysUrl                  : String?   = nil
  var collaboratorsUrl         : String?   = nil
  var teamsUrl                 : String?   = nil
  var hooksUrl                 : String?   = nil
  var issueEventsUrl           : String?   = nil
  var eventsUrl                : String?   = nil
  var assigneesUrl             : String?   = nil
  var branchesUrl              : String?   = nil
  var tagsUrl                  : String?   = nil
  var blobsUrl                 : String?   = nil
  var gitTagsUrl               : String?   = nil
  var gitRefsUrl               : String?   = nil
  var treesUrl                 : String?   = nil
  var statusesUrl              : String?   = nil
  var languagesUrl             : String?   = nil
  var stargazersUrl            : String?   = nil
  var contributorsUrl          : String?   = nil
  var subscribersUrl           : String?   = nil
  var subscriptionUrl          : String?   = nil
  var commitsUrl               : String?   = nil
  var gitCommitsUrl            : String?   = nil
  var commentsUrl              : String?   = nil
  var issueCommentUrl          : String?   = nil
  var contentsUrl              : String?   = nil
  var compareUrl               : String?   = nil
  var mergesUrl                : String?   = nil
  var archiveUrl               : String?   = nil
  var downloadsUrl             : String?   = nil
  var issuesUrl                : String?   = nil
  var pullsUrl                 : String?   = nil
  var milestonesUrl            : String?   = nil
  var notificationsUrl         : String?   = nil
  var labelsUrl                : String?   = nil
  var releasesUrl              : String?   = nil
  var deploymentsUrl           : String?   = nil
  var createdAt                : String?   = nil
  var updatedAt                : String?   = nil
  var pushedAt                 : String?   = nil
  var gitUrl                   : String?   = nil
  var sshUrl                   : String?   = nil
  var cloneUrl                 : String?   = nil
  var svnUrl                   : String?   = nil
  var homepage                 : String?   = nil
  var size                     : Int?      = nil
  var stargazersCount          : Int?      = nil
  var watchersCount            : Int?      = nil
  var language                 : String?   = nil
  var hasIssues                : Bool?     = nil
  var hasProjects              : Bool?     = nil
  var hasDownloads             : Bool?     = nil
  var hasWiki                  : Bool?     = nil
  var hasPages                 : Bool?     = nil
  var hasDiscussions           : Bool?     = nil
  var forksCount               : Int?      = nil
  var mirrorUrl                : String?   = nil
  var archived                 : Bool?     = nil
  var disabled                 : Bool?     = nil
  var openIssuesCount          : Int?      = nil
  var license                  : License?  = License()
  var allowForking             : Bool?     = nil
  var isTemplate               : Bool?     = nil
  var webCommitSignoffRequired : Bool?     = nil
  var topics                   : [String]? = []
  var visibility               : String?   = nil
  var forks                    : Int?      = nil
  var openIssues               : Int?      = nil
  var watchers                 : Int?      = nil
  var defaultBranch            : String?   = nil

  enum CodingKeys: String, CodingKey {

    case id                       = "id"
    case nodeId                   = "node_id"
    case name                     = "name"
    case fullName                 = "full_name"
    case isPrivate                  = "private"
    case owner                    = "owner"
    case htmlUrl                  = "html_url"
    case description              = "description"
    case fork                     = "fork"
    case url                      = "url"
    case forksUrl                 = "forks_url"
    case keysUrl                  = "keys_url"
    case collaboratorsUrl         = "collaborators_url"
    case teamsUrl                 = "teams_url"
    case hooksUrl                 = "hooks_url"
    case issueEventsUrl           = "issue_events_url"
    case eventsUrl                = "events_url"
    case assigneesUrl             = "assignees_url"
    case branchesUrl              = "branches_url"
    case tagsUrl                  = "tags_url"
    case blobsUrl                 = "blobs_url"
    case gitTagsUrl               = "git_tags_url"
    case gitRefsUrl               = "git_refs_url"
    case treesUrl                 = "trees_url"
    case statusesUrl              = "statuses_url"
    case languagesUrl             = "languages_url"
    case stargazersUrl            = "stargazers_url"
    case contributorsUrl          = "contributors_url"
    case subscribersUrl           = "subscribers_url"
    case subscriptionUrl          = "subscription_url"
    case commitsUrl               = "commits_url"
    case gitCommitsUrl            = "git_commits_url"
    case commentsUrl              = "comments_url"
    case issueCommentUrl          = "issue_comment_url"
    case contentsUrl              = "contents_url"
    case compareUrl               = "compare_url"
    case mergesUrl                = "merges_url"
    case archiveUrl               = "archive_url"
    case downloadsUrl             = "downloads_url"
    case issuesUrl                = "issues_url"
    case pullsUrl                 = "pulls_url"
    case milestonesUrl            = "milestones_url"
    case notificationsUrl         = "notifications_url"
    case labelsUrl                = "labels_url"
    case releasesUrl              = "releases_url"
    case deploymentsUrl           = "deployments_url"
    case createdAt                = "created_at"
    case updatedAt                = "updated_at"
    case pushedAt                 = "pushed_at"
    case gitUrl                   = "git_url"
    case sshUrl                   = "ssh_url"
    case cloneUrl                 = "clone_url"
    case svnUrl                   = "svn_url"
    case homepage                 = "homepage"
    case size                     = "size"
    case stargazersCount          = "stargazers_count"
    case watchersCount            = "watchers_count"
    case language                 = "language"
    case hasIssues                = "has_issues"
    case hasProjects              = "has_projects"
    case hasDownloads             = "has_downloads"
    case hasWiki                  = "has_wiki"
    case hasPages                 = "has_pages"
    case hasDiscussions           = "has_discussions"
    case forksCount               = "forks_count"
    case mirrorUrl                = "mirror_url"
    case archived                 = "archived"
    case disabled                 = "disabled"
    case openIssuesCount          = "open_issues_count"
    case license                  = "license"
    case allowForking             = "allow_forking"
    case isTemplate               = "is_template"
    case webCommitSignoffRequired = "web_commit_signoff_required"
    case topics                   = "topics"
    case visibility               = "visibility"
    case forks                    = "forks"
    case openIssues               = "open_issues"
    case watchers                 = "watchers"
    case defaultBranch            = "default_branch"
  
  }

}
