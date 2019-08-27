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

/////////////////
class HomeOfIEAClassModel {
    int id;
    String bannerUrl;
    String goId;
    String goName;
    String price;
    dynamic discountPrice;
    String gdCover;
    String pageUrl;
    String h5Url;
    String linkType;
    String isDiscount;

    HomeOfIEAClassModel({
        this.id,
        this.bannerUrl,
        this.goId,
        this.goName,
        this.price,
        this.discountPrice,
        this.gdCover,
        this.pageUrl,
        this.h5Url,
        this.linkType,
        this.isDiscount,
    });

    factory HomeOfIEAClassModel.fromJson(Map<String, dynamic> json) => new HomeOfIEAClassModel(
        id: json["id"],
        bannerUrl: json["bannerUrl"],
        goId: json["goId"],
        goName: json["goName"],
        price: json["price"],
        discountPrice: json["discountPrice"],
        gdCover: json["gdCover"],
        pageUrl: json["pageUrl"],
        h5Url: json["h5Url"],
        linkType: json["linkType"],
        isDiscount: json["isDiscount"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "bannerUrl": bannerUrl,
        "goId": goId,
        "goName": goName,
        "price": price,
        "discountPrice": discountPrice,
        "gdCover": gdCover,
        "pageUrl": pageUrl,
        "h5Url": h5Url,
        "linkType": linkType,
        "isDiscount": isDiscount,
    };
}
