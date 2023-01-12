class NavBarItems {
  final String title;
  final String iconFilled;
  final String iconOutlined;
  NavBarItems(
      {required this.title,
      required this.iconFilled,
      required this.iconOutlined});
}

class UserViewNavItemsModel {
  final List<NavBarItems> navitems;

  UserViewNavItemsModel({required this.navitems});

  static UserViewNavItemsModel generatedNavItems = UserViewNavItemsModel(
    navitems: [
      NavBarItems(
          title: 'Home',
          iconFilled: 'assets/icons/home_rounded.svg',
          iconOutlined: 'assets/icons/home_rounded_outlined.svg'),
      NavBarItems(
          title: 'Browse',
          iconFilled: 'assets/icons/browse_rounded.svg',
          iconOutlined: 'assets/icons/browse_rounded_outlined.svg'),
      NavBarItems(
          title: 'Search',
          iconFilled: 'assets/icons/search_rounded.svg',
          iconOutlined: 'assets/icons/search_rounded_outlined.svg'),
      NavBarItems(
          title: 'Profile',
          iconFilled: 'assets/icons/person_rounded.svg',
          iconOutlined: 'assets/icons/person_rounded_outlined.svg'),
    ],
  );
}
