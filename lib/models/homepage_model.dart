class HomeOfBannerModel {
    int id;
    dynamic createTime;
    dynamic updateTime;
    dynamic createBy;
    dynamic updateBy;
    dynamic type;
    String picture;
    int linkType;
    String linkUrl;
    String router;
    dynamic sort;
    dynamic delFlag;
    dynamic status;

    HomeOfBannerModel({
        this.id,
        this.createTime,
        this.updateTime,
        this.createBy,
        this.updateBy,
        this.type,
        this.picture,
        this.linkType,
        this.linkUrl,
        this.router,
        this.sort,
        this.delFlag,
        this.status,
    });

    factory HomeOfBannerModel.fromJson(Map<String, dynamic> json) => new HomeOfBannerModel(
        id: json["id"],
        createTime: json["createTime"],
        updateTime: json["updateTime"],
        createBy: json["createBy"],
        updateBy: json["updateBy"],
        type: json["type"],
        picture: json["picture"],
        linkType: json["linkType"],
        linkUrl: json["linkUrl"],
        router: json["router"],
        sort: json["sort"],
        delFlag: json["delFlag"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "createTime": createTime,
        "updateTime": updateTime,
        "createBy": createBy,
        "updateBy": updateBy,
        "type": type,
        "picture": picture,
        "linkType": linkType,
        "linkUrl": linkUrl,
        "router": router,
        "sort": sort,
        "delFlag": delFlag,
        "status": status,
    };
}

/////////////////////////////

class HomeOfOpenClassModel {
    int id;
    int sort;
    int openClassId;
    String openClassName;
    String learnerCount;
    dynamic bannerUrl;

    HomeOfOpenClassModel({
        this.id,
        this.sort,
        this.openClassId,
        this.openClassName,
        this.learnerCount,
        this.bannerUrl,
    });

    factory HomeOfOpenClassModel.fromJson(Map<String, dynamic> json) => new HomeOfOpenClassModel(
        id: json["id"],
        sort: json["sort"],
        openClassId: json["openClassId"],
        openClassName: json["openClassName"],
        learnerCount: json["learnerCount"],
        bannerUrl: json["bannerUrl"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "sort": sort,
        "openClassId": openClassId,
        "openClassName": openClassName,
        "learnerCount": learnerCount,
        "bannerUrl": bannerUrl,
    };
}

