class DeathModel {
  late String cause;
  late String lastWords;
  late int numberOfDeaths;
  late int season;
  late int episode;

  DeathModel.fromJson(Map<String, dynamic> json) {
    cause = json['cause'];
    lastWords = json['last_words'];
    numberOfDeaths = json['number_of_deaths'];
    season = json['season'];
    episode = json['episode'];
  }
}
