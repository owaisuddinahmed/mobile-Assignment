class TrendingModel {
  int? totalCount;
  bool? incompleteResults;
  List<Items>? items;

  TrendingModel({
    this.totalCount,
    this.incompleteResults,
    this.items,
  });

  TrendingModel.fromJson(Map<String, dynamic> json) {
    totalCount = json['total_count'] as int?;
    incompleteResults = json['incomplete_results'] as bool?;
    items = (json['items'] as List?)?.map((dynamic e) => Items.fromJson(e as Map<String,dynamic>)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['total_count'] = totalCount;
    json['incomplete_results'] = incompleteResults;
    json['items'] = items?.map((e) => e.toJson()).toList();
    return json;
  }
}

class Items {
  int? id;
  String? nodeId;
  String? name;
  String? fullName;
  bool? private;
  Owner? owner;

  Items({
    this.id,
    this.nodeId,
    this.name,
    this.fullName,
    this.private,
    this.owner,

  });

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    nodeId = json['node_id'] as String?;
    name = json['name'] as String?;
    fullName = json['full_name'] as String?;
    private = json['private'] as bool?;
    owner = (json['owner'] as Map<String,dynamic>?) != null ? Owner.fromJson(json['owner'] as Map<String,dynamic>) : null;

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['node_id'] = nodeId;
    json['name'] = name;
    json['full_name'] = fullName;
    json['private'] = private;
    json['owner'] = owner?.toJson();

    return json;
  }
}

class Owner {
  String? login;
  int? id;
  String? nodeId;
  String? avatarUrl;
  String? gravatarId;
  String? url;
  String? htmlUrl;
  String? followersUrl;
  String? followingUrl;
  String? gistsUrl;
  String? starredUrl;
  String? subscriptionsUrl;
  String? organizationsUrl;
  String? reposUrl;
  String? eventsUrl;
  String? receivedEventsUrl;
  String? type;
  String? userViewType;
  bool? siteAdmin;

  Owner({
    this.login,
    this.id,
    this.nodeId,
    this.avatarUrl,
    this.gravatarId,
    this.url,
    this.htmlUrl,
    this.followersUrl,
    this.followingUrl,
    this.gistsUrl,
    this.starredUrl,
    this.subscriptionsUrl,
    this.organizationsUrl,
    this.reposUrl,
    this.eventsUrl,
    this.receivedEventsUrl,
    this.type,
    this.userViewType,
    this.siteAdmin,
  });

  Owner.fromJson(Map<String, dynamic> json) {
    login = json['login'] as String?;
    id = json['id'] as int?;
    nodeId = json['node_id'] as String?;
    avatarUrl = json['avatar_url'] as String?;
    gravatarId = json['gravatar_id'] as String?;
    url = json['url'] as String?;
    htmlUrl = json['html_url'] as String?;
    followersUrl = json['followers_url'] as String?;
    followingUrl = json['following_url'] as String?;
    gistsUrl = json['gists_url'] as String?;
    starredUrl = json['starred_url'] as String?;
    subscriptionsUrl = json['subscriptions_url'] as String?;
    organizationsUrl = json['organizations_url'] as String?;
    reposUrl = json['repos_url'] as String?;
    eventsUrl = json['events_url'] as String?;
    receivedEventsUrl = json['received_events_url'] as String?;
    type = json['type'] as String?;
    userViewType = json['user_view_type'] as String?;
    siteAdmin = json['site_admin'] as bool?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['login'] = login;
    json['id'] = id;
    json['node_id'] = nodeId;
    json['avatar_url'] = avatarUrl;
    json['gravatar_id'] = gravatarId;
    json['url'] = url;
    json['html_url'] = htmlUrl;
    json['followers_url'] = followersUrl;
    json['following_url'] = followingUrl;
    json['gists_url'] = gistsUrl;
    json['starred_url'] = starredUrl;
    json['subscriptions_url'] = subscriptionsUrl;
    json['organizations_url'] = organizationsUrl;
    json['repos_url'] = reposUrl;
    json['events_url'] = eventsUrl;
    json['received_events_url'] = receivedEventsUrl;
    json['type'] = type;
    json['user_view_type'] = userViewType;
    json['site_admin'] = siteAdmin;
    return json;
  }
}

class License {
  String? key;
  String? name;
  String? spdxId;
  String? url;
  String? nodeId;

  License({
    this.key,
    this.name,
    this.spdxId,
    this.url,
    this.nodeId,
  });

  License.fromJson(Map<String, dynamic> json) {
    key = json['key'] as String?;
    name = json['name'] as String?;
    spdxId = json['spdx_id'] as String?;
    url = json['url'] as String?;
    nodeId = json['node_id'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['key'] = key;
    json['name'] = name;
    json['spdx_id'] = spdxId;
    json['url'] = url;
    json['node_id'] = nodeId;
    return json;
  }
}