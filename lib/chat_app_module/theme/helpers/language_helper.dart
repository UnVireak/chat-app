
List<CacheLanguage> cacheLageuageList = [
  CacheLanguage(),
  CacheKhmer(),


];

class CacheLanguage {
  // greeting screen
  String get greeting => "Connect easily with \nyour family and friends \nover countries";
  String get term => "Terms & Privacy Policy";
  String get startButton => "Start messaging";
  // contact screen
  String get contactScreenTitle => "Contacts";
  String get contactSearchBox => "Search...";

  // chat screen
  String get chatTitle => "Chats";
  String get chatSearchBox => "Search...";

  // change language screen
  String get langeuageScreen => "Change language";

  // more screen
  String get moreScreenTitle => "More";
  String get account => "Account";
  String get darkMode => "Dark mode";
  String get language => "App language";
  String get notification => "Notification";
  String get privacy => "Privacy";
  String get dataUsage => "Data usage";
  String get help => "Help";
  String get inviteFriend => "Invite your friends";
  // change theme screen
  String get themeScreenTitle => "Dark mode";
  String get chaneToLightMode => "Change To Light Mode";
  String get changeToDarkMode => "Change To Dark Mode";
  String get changeToSystemMode => "Change To System Mode";
  String get changeToSystemModeDetail => "We'll adjust your appearance based on your device's system settings.";

}

class CacheKhmer implements CacheLanguage {
  // greeting screen
  String get greeting => "តភ្ជាប់យ៉ាងងាយស្រួលជាមួួយ \nគ្រួសារនិង មិត្តភក្តិរបស់អ្នក \nតាមប្រទេសនានា";
  String get term => "លក្ខខណ្ឌ និងគោលការណ៍ឯកជនភាព";
  String get startButton => "ចាប់ផ្ដើមការផ្ញើរសារ";
  // contact screen
  String get contactScreenTitle => "ទំនាក់ទំនង";
  String get contactSearchBox => "ស្វែងរក...";

  // chat screen
  String get chatTitle => "ជជែក";
  String get chatSearchBox => "ស្វែងរក...";

  // more screen
  String get moreScreenTitle => "ផ្សេងទៀត";
  String get account => "គណនី";
  String get darkMode => "ប្តូរទៅងងឹត";
  String get language => "ប្តូរភាសា";
  String get notification => "សារជូនដំណឹង";
  String get privacy => "ឯកជនភាព";
  String get dataUsage => "ទិន្ន័យប្រើប្រាស់";
  String get help => "ជំនួយ";
  String get inviteFriend => "អញ្ជើញមិត្តភក្តី";

// change language screen
  String get langeuageScreen => "ប្ដូរភាសា";

  // change theme screen
  String get themeScreenTitle => "ប្តូរទៅស្រអាប់";
  String get chaneToLightMode => "បិទ";
  String get changeToDarkMode => "បើក";
  String get changeToSystemMode => "ប្តូរពន្លឺតាមប្រព័ន្ធទូរស័ព្ទ";
  String get changeToSystemModeDetail => "កែតម្រូវរូបរាងរបស់កម្មវិធីដោយផ្អែកលើការកំណត់លើប្រព័ន្ធរបស់ឧបករណ៍អ្នក។";
}
