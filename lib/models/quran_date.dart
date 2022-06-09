class QuranDate{
    QuranDate({
        this.data,
        this.meta,
    });

    List<QuranDateDatum>? data;
    Meta? meta;

    factory QuranDate.fromJson(Map<String, dynamic> json) => QuranDate(
        data: List<QuranDateDatum>.from(json["data"].map((x) => QuranDateDatum.fromJson(x))),
        meta: Meta.fromJson(json["meta"]),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "meta": meta!.toJson(),
    };
}
class QuranDateDatum  {
    QuranDateDatum({
        this.id,
        this.attributes,
    });

    int? id;
    PurpleAttributes? attributes;

    factory QuranDateDatum.fromJson(Map<String, dynamic> json) => QuranDateDatum(
        id: json["id"],
        attributes: PurpleAttributes.fromJson(json["attributes"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes!.toJson(),
    };
}
class PurpleAttributes {
    PurpleAttributes({
        this.name,
        this.translate,
        this.quranname,
        this.createdAt,
        this.updatedAt,
        this.publishedAt,
        this.verce,
        this.juz,
        this.subjuz,
        this.namequrantrn,
        this.istuped,
        this.quransaudio,
    });

    String? name;
    String? translate;
    String? quranname;
    DateTime? createdAt;
    DateTime? updatedAt;
    DateTime? publishedAt;
    String? verce;
    String? juz;
    String? subjuz;
    String? namequrantrn;
    bool? istuped;
    Quransaudio? quransaudio;

    factory PurpleAttributes.fromJson(Map<String, dynamic> json) => PurpleAttributes(
        name: json["name"],
        translate: json["translate"],
        quranname: json["quranname"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        publishedAt: DateTime.parse(json["publishedAt"]),
        verce: json["verce"],
        juz: json["juz"],
        subjuz: json["subjuz"],
        namequrantrn: json["namequrantrn"],
        istuped: json["istuped"],
        quransaudio: Quransaudio.fromJson(json["quransaudio"]),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "translate": translate,
        "quranname": quranname,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "publishedAt": publishedAt!.toIso8601String(),
        "verce": verce,
        "juz": juz,
        "subjuz": subjuz,
        "namequrantrn": namequrantrn,
        "istuped": istuped,
        "quransaudio": quransaudio!.toJson(),
    };
}
class Quransaudio{
    Quransaudio({
        this.data,
    });

    List<QuransaudioDatum>? data;

    factory Quransaudio.fromJson(Map<String, dynamic> json) => Quransaudio(
        data: List<QuransaudioDatum>.from(json["data"].map((x) => QuransaudioDatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}
class QuransaudioDatum {
    QuransaudioDatum({
        this.id,
        this.attributes,
    });

    int? id;
    FluffyAttributes? attributes;

    factory QuransaudioDatum.fromJson(Map<String, dynamic> json) => QuransaudioDatum(
        id: json["id"],
        attributes: FluffyAttributes.fromJson(json["attributes"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes!.toJson(),
    };
}
class FluffyAttributes {
    FluffyAttributes({
        this.name,
        this.alternativeText,
        this.caption,
        this.width,
        this.height,
        this.formats,
        this.hash,
        this.ext,
        this.mime,
        this.size,
        this.url,
        this.previewUrl,
        this.provider,
        this.providerMetadata,
        this.createdAt,
        this.updatedAt,
    });

    String? name;
    String? alternativeText;
    String? caption;
    dynamic width;
    dynamic height;
    dynamic formats;
    String? hash;
    String? ext;
    String? mime;
    double? size;
    String? url;
    dynamic previewUrl;
    String? provider;
    dynamic providerMetadata;
    DateTime? createdAt;
    DateTime? updatedAt;

    factory FluffyAttributes.fromJson(Map<String, dynamic> json) => FluffyAttributes(
        name: json["name"],
        alternativeText: json["alternativeText"],
        caption: json["caption"],
        width: json["width"],
        height: json["height"],
        formats: json["formats"],
        hash: json["hash"],
        ext: json["ext"],
        mime: json["mime"],
        size: json["size"].toDouble(),
        url: json["url"],
        previewUrl: json["previewUrl"],
        provider: json["provider"],
        providerMetadata: json["provider_metadata"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "alternativeText": alternativeText,
        "caption": caption,
        "width": width,
        "height": height,
        "formats": formats,
        "hash": hash,
        "ext": ext,
        "mime": mime,
        "size": size,
        "url": url,
        "previewUrl": previewUrl,
        "provider": provider,
        "provider_metadata": providerMetadata,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
    };
}
class Meta  {
    Meta({
        this.pagination,
    });

    Pagination? pagination;

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        pagination: Pagination.fromJson(json["pagination"]),
    );

    Map<String, dynamic> toJson() => {
        "pagination": pagination!.toJson(),
    };
}

class Pagination{
    Pagination({
        this.page,
        this.pageSize,
        this.pageCount,
        this.total,
    });

    int? page;
    int? pageSize;
    int? pageCount;
    int? total;

    factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        page: json["page"],
        pageSize: json["pageSize"],
        pageCount: json["pageCount"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "pageSize": pageSize,
        "pageCount": pageCount,
        "total": total,
    };
}
