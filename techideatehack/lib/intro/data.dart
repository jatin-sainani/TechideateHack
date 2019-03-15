class IntroItem {
  IntroItem({
    this.title,
    this.category,
    this.imageUrl,
  });

  final String title;
  final String category;
  final String imageUrl;
}

final sampleItems = <IntroItem>[
  new IntroItem(title: 'Ending your Dilemma!', category: 'FOCUS', imageUrl: 'images/intro1.png',),
  new IntroItem(title: 'Preplanning is always good', category: 'LEARN', imageUrl: 'images/intro2.png',),
  new IntroItem(title: 'We might have the best team spirit ever.', category: 'SPIRIT', imageUrl: 'images/intro3.jpg',),
];