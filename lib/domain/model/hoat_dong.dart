class HoatDong {
  final String id;
  final String tenDiaDiem;
  final String tinhThanh;

  HoatDong({
    required this.id,
    required this.tenDiaDiem,
    required this.tinhThanh,
  });

  HoatDong copyWith({String? id, String? tenDiaDiem, String? tinhThanh}) {
    return HoatDong(
      id: id ?? this.id,
      tenDiaDiem: tenDiaDiem ?? this.tenDiaDiem,
      tinhThanh: tinhThanh ?? this.tinhThanh,
    );
  }

  factory HoatDong.fromJson(Map<String, dynamic> json) {
    return HoatDong(
      id: json['id'] ?? '',
      tenDiaDiem: json['tenDiaDiem'] ?? '',
      tinhThanh: json['tinhThanh'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'tenDiaDiem': tenDiaDiem, 'tinhThanh': tinhThanh};
  }
}
