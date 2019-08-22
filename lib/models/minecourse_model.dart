
class MineCourseModel {
    List<PurchasedCourse> purchasedCourses;

    MineCourseModel({
        this.purchasedCourses,
    });

    factory MineCourseModel.fromJson(Map<String, dynamic> json) => new MineCourseModel(
        purchasedCourses: new List<PurchasedCourse>.from(json["purchasedCourses"].map((x) => PurchasedCourse.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "purchasedCourses": new List<dynamic>.from(purchasedCourses.map((x) => x.toJson())),
    };
}

class PurchasedCourse {
    String avatarUrl;
    dynamic buyGoodsCreateTime;
    String cover;
    dynamic goId;
    dynamic goName;
    int id;
    int isCourse;
    String lessionCount;
    String ocId;
    String ocName;
    String openClassCreateTime;
    dynamic proName;
    String tname;

    PurchasedCourse({
        this.avatarUrl,
        this.buyGoodsCreateTime,
        this.cover,
        this.goId,
        this.goName,
        this.id,
        this.isCourse,
        this.lessionCount,
        this.ocId,
        this.ocName,
        this.openClassCreateTime,
        this.proName,
        this.tname,
    });

    factory PurchasedCourse.fromJson(Map<String, dynamic> json) => new PurchasedCourse(
        avatarUrl: json["avatarUrl"] == null ? null : json["avatarUrl"],
        buyGoodsCreateTime: json["buyGoodsCreateTime"],
        cover: json["cover"] == null ? null : json["cover"],
        goId: json["goId"],
        goName: json["goName"],
        id: json["id"] == null ? null : json["id"],
        isCourse: json["isCourse"],
        lessionCount: json["lessionCount"] == null ? null : json["lessionCount"],
        ocId: json["ocId"] == null ? null : json["ocId"],
        ocName: json["ocName"] == null ? null : json["ocName"],
        openClassCreateTime: json["openClassCreateTime"] == null ? null : json["openClassCreateTime"],
        proName: json["proName"],
        tname: json["tname"] == null ? null : json["tname"],
    );

    Map<String, dynamic> toJson() => {
        "avatarUrl": avatarUrl == null ? null : avatarUrl,
        "buyGoodsCreateTime": buyGoodsCreateTime,
        "cover": cover == null ? null : cover,
        "goId": goId,
        "goName": goName,
        "id": id == null ? null : id,
        "isCourse": isCourse,
        "lessionCount": lessionCount == null ? null : lessionCount,
        "ocId": ocId == null ? null : ocId,
        "ocName": ocName == null ? null : ocName,
        "openClassCreateTime": openClassCreateTime == null ? null : openClassCreateTime,
        "proName": proName,
        "tname": tname == null ? null : tname,
    };
}
