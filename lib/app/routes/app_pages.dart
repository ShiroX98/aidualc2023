import 'package:get/get.dart';

import '../modules/asherAdd/bindings/asher_add_binding.dart';
import '../modules/asherAdd/views/asher_add_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/jadwalPelayanan/bindings/jadwal_pelayanan_binding.dart';
import '../modules/jadwalPelayanan/views/jadwal_pelayanan_view.dart';
import '../modules/jadwalPelayananAdd/bindings/jadwal_pelayanan_add_binding.dart';
import '../modules/jadwalPelayananAdd/views/jadwal_pelayanan_add_view.dart';
import '../modules/jadwalPelayananDetails/bindings/jadwal_pelayanan_details_binding.dart';
import '../modules/jadwalPelayananDetails/views/jadwal_pelayanan_details_view.dart';
import '../modules/jadwalPelayananPetugasAdd/bindings/jadwal_pelayanan_petugas_add_binding.dart';
import '../modules/jadwalPelayananPetugasAdd/views/jadwal_pelayanan_petugas_add_view.dart';
import '../modules/jemaat/bindings/jemaat_binding.dart';
import '../modules/jemaat/views/jemaat_view.dart';
import '../modules/jemaatAdd/bindings/jemaat_add_binding.dart';
import '../modules/jemaatAdd/views/jemaat_add_view.dart';
import '../modules/jemaatDetail/bindings/jemaat_detail_binding.dart';
import '../modules/jemaatDetail/views/jemaat_detail_view.dart';
import '../modules/jemaatEdit/bindings/jemaat_edit_binding.dart';
import '../modules/jemaatEdit/views/jemaat_edit_view.dart';
import '../modules/lcdAdd/bindings/lcd_add_binding.dart';
import '../modules/lcdAdd/views/lcd_add_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/musicAdd/bindings/music_add_binding.dart';
import '../modules/musicAdd/views/music_add_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/reset_password/bindings/reset_password_binding.dart';
import '../modules/reset_password/views/reset_password_view.dart';
import '../modules/singersAdd/bindings/singers_add_binding.dart';
import '../modules/singersAdd/views/singers_add_view.dart';
import '../modules/tamborineAdd/bindings/tamborine_add_binding.dart';
import '../modules/tamborineAdd/views/tamborine_add_view.dart';
import '../modules/testPage/bindings/test_page_binding.dart';
import '../modules/testPage/views/test_page_view.dart';
import '../modules/user/bindings/user_binding.dart';
import '../modules/user/views/user_view.dart';
import '../modules/worshipLeadAdd/bindings/worship_lead_add_binding.dart';
import '../modules/worshipLeadAdd/views/worship_lead_add_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.RESET_PASSWORD,
      page: () => ResetPasswordView(),
      binding: ResetPasswordBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.JEMAAT,
      page: () => JemaatView(),
      binding: JemaatBinding(),
    ),
    GetPage(
      name: _Paths.USER,
      page: () => UserView(),
      binding: UserBinding(),
    ),
    GetPage(
      name: _Paths.JEMAAT_ADD,
      page: () => JemaatAddView(),
      binding: JemaatAddBinding(),
    ),
    GetPage(
      name: _Paths.JEMAAT_EDIT,
      page: () => JemaatEditView(),
      binding: JemaatEditBinding(),
    ),
    GetPage(
      name: _Paths.JADWAL_PELAYANAN,
      page: () => JadwalPelayananView(),
      binding: JadwalPelayananBinding(),
    ),
    GetPage(
      name: _Paths.JADWAL_PELAYANAN_ADD,
      page: () => JadwalPelayananAddView(),
      binding: JadwalPelayananAddBinding(),
    ),
    GetPage(
      name: _Paths.JADWAL_PELAYANAN_DETAILS,
      page: () => JadwalPelayananDetailsView(),
      binding: JadwalPelayananDetailsBinding(),
    ),
    GetPage(
      name: _Paths.JADWAL_PELAYANAN_PETUGAS_ADD,
      page: () => JadwalPelayananPetugasAddView(),
      binding: JadwalPelayananPetugasAddBinding(),
    ),
    GetPage(
      name: _Paths.LCD_ADD,
      page: () => LcdAddView(),
      binding: LcdAddBinding(),
    ),
    GetPage(
      name: _Paths.MUSIC_ADD,
      page: () => MusicAddView(),
      binding: MusicAddBinding(),
    ),
    GetPage(
      name: _Paths.SINGERS_ADD,
      page: () => SingersAddView(),
      binding: SingersAddBinding(),
    ),
    GetPage(
      name: _Paths.TAMBORINE_ADD,
      page: () => TamborineAddView(),
      binding: TamborineAddBinding(),
    ),
    GetPage(
      name: _Paths.WORSHIP_LEAD_ADD,
      page: () => WorshipLeadAddView(),
      binding: WorshipLeadAddBinding(),
    ),
    GetPage(
      name: _Paths.ASHER_ADD,
      page: () => AsherAddView(),
      binding: AsherAddBinding(),
    ),
    GetPage(
      name: _Paths.JEMAAT_DETAIL,
      page: () => JemaatDetailView(),
      binding: JemaatDetailBinding(),
    ),
    GetPage(
      name: _Paths.TEST_PAGE,
      page: () => TestPageView(),
      binding: TestPageBinding(),
    ),
  ];
}
