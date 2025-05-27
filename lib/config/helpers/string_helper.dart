String capitalizeFirstLetter(String word) {
  return word[0].toUpperCase() + word.substring(1);
}

String shortenTitle(String title, int wordLimit) {
  final words = title.split(' ');
  if (words.length <= wordLimit) return title;
  return '${words.take(wordLimit).join(' ')}...';
}
