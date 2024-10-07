
List<CacheLanguage> cacheLageuageList = [
  CacheLanguage(),
  CacheKhmer(),


];

class CacheLanguage {
  // greeting screen
  String get greeting => "Connect easily with \nyour family and friends \nover countries";
  String get term => "Terms & Privacy Policy";
  String get startButton => "Start messaging";

  // phone verify screen
  String get enterPhoneNumerTitle => "Enter your phone number";
  String get confirmPhoneNumer => "Please confirm your country code and enter \nyour phone number";
  String get phoneNumberPlaceHolder => "phone number";
  String get continueBtn => "continue";

  // code verify screen
  String get enterCodeTitle => "Enter code";
  String get enterCodeSubTitle => "We have sent you a SMS with the code \nto +855 11 466 648";
  String get resendCode => "Resend Code";

  // setup profile screen
  String get firstNamePlaceHolder => "First Name (Required)";
  String get lastNamePlaceHolder => "Last Name (Required)";
  // contact screen
  String get contactScreenTitle => "Contacts";
  String get contactSearchBox => "Search...";

  // chat screen
  String get chatTitle => "Chats";
  String get chatSearchBox => "Search...";
// chat detail screen
  String get chatTextField => "Type a message...";

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
  String get chaneToLightMode => "Off";
  String get changeToDarkMode => "On";
  String get changeToSystemMode => "System";
  String get changeToSystemModeDetail => "We'll adjust your appearance based on your device's system settings.";

}

class CacheKhmer implements CacheLanguage {
  // greeting screen
  String get greeting => "តភ្ជាប់យ៉ាងងាយស្រួលជាមួយ \nគ្រួសារនិង មិត្តភក្តិរបស់អ្នក \nតាមប្រទេសនានា";
  String get term => "លក្ខខណ្ឌ និងគោលការណ៍ឯកជនភាព";
  String get startButton => "ចាប់ផ្ដើមការជជែក";

  // phone verify screen
  String get enterPhoneNumerTitle => "សូមបញ្ចូលលេខទូរស័ព្ទរបស់អ្នក";
  String get confirmPhoneNumer => "សូមផ្ទៀងផ្ទាត់កូដប្រទស និងបញ្ចូលលេខទូរស័ព្ទ";
  String get phoneNumberPlaceHolder => "បញ្ចូលលេខទូរស័ព្ទ";
  String get continueBtn => "បន្ត";

  // code verify screen
  String get enterCodeTitle => "សូមបញ្ចូលលេខកូដ";
  String get enterCodeSubTitle => "លេខកូដនឹងត្រូវបានផ្ញើទៅ \nកាន់លេខ +855 11 466 648";
  String get resendCode => "ផ្ញើលេខកូដម្ដងទៀត";

  // setup profile screen
  String get firstNamePlaceHolder => "នាមខ្លួន (ចាំបាច់)";
  String get lastNamePlaceHolder => "នាមត្រកូល (ចាំបាច់)";


  // contact screen
  String get contactScreenTitle => "ទំនាក់ទំនង";
  String get contactSearchBox => "ស្វែងរក...";

  // chat screen
  String get chatTitle => "ជជែក";
  String get chatSearchBox => "ស្វែងរក...";

// chat detail screen
  String get chatTextField => "វាយបញ្ចូលសារ...";
  // more screen
  String get moreScreenTitle => "ផ្សេងទៀត";
  String get account => "គណនី";
  String get darkMode => "ប្តូរទៅផ្ទៃងងឹត";
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
