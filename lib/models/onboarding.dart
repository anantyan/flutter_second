
class OnBoarding {
  final String title;
  final String subtitle;
  final String image;

  OnBoarding({
    required this.title,
    required this.subtitle,
    required this.image
  });
}

List<OnBoarding> itemOnBoarding = [
  OnBoarding(
    title: "Get relax when\nwork happens",
    subtitle: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium",
    image: "assets/on_boarding_1_relax.svg"
  ),
  OnBoarding(
      title: "Get sharing with\nproject and team",
      subtitle: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium",
      image: "assets/on_boarding_2_sharing.svg"
  ),
  OnBoarding(
      title: "Get compose music\nassign them",
      subtitle: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium",
      image: "assets/on_boarding_3_compose.svg"
  )
];