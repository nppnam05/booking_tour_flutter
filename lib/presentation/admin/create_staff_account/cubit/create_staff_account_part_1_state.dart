class CreateStaffAccountPart1State {
  final String taiKhoan;
  final String password;
  final String quyenTruyCap;
  final String hoVaTen;
  final String soCCCD;
  final DateTime? ngayCap;
  final String email;
  final String soDienThoai;
  final String diaChi;
  final DateTime? ngaySinh;
  final DateTime? ngayVaoLam;

  const CreateStaffAccountPart1State({
    this.taiKhoan = '',
    this.password = '',
    this.quyenTruyCap = '',
    this.hoVaTen = '',
    this.soCCCD = '',
    this.ngayCap,
    this.email = '',
    this.soDienThoai = '',
    this.diaChi = '',
    this.ngaySinh,
    this.ngayVaoLam,
  });
  CreateStaffAccountPart1State copyWith({
    String? taiKhoan,
    String? password,
    String? quyenTruyCap,
    String? hoVaTen,
    String? soCCCD,
    DateTime? ngayCap,
    String? email,
    String? soDienThoai,
    String? diaChi,
    DateTime? ngaySinh,
    DateTime? ngayVaoLam,
  }) {
    return CreateStaffAccountPart1State(
      taiKhoan: taiKhoan ?? this.taiKhoan,
      password: password ?? this.password,
      quyenTruyCap: quyenTruyCap ?? this.quyenTruyCap,
      hoVaTen: hoVaTen ?? this.hoVaTen,
      soCCCD: soCCCD ?? this.soCCCD,
      ngayCap: ngayCap ?? this.ngayCap,
      email: email ?? this.email,
      soDienThoai: soDienThoai ?? this.soDienThoai,
      diaChi: diaChi ?? this.diaChi,
      ngaySinh: ngaySinh ?? this.ngaySinh,
      ngayVaoLam: ngayVaoLam ?? this.ngayVaoLam,
    );
  }
}
