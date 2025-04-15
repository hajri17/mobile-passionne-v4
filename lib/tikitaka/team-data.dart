class TeamData {
  static final TeamData _instance = TeamData._internal();
  factory TeamData() => _instance;
  TeamData._internal();

  Map<String, List<String>> selectedPlayers = {};
  int remainingPoints = 100;

  // Add a map to store player points
  Map<String, int> playerPointsMap = {};

  // Method to calculate total points used by selected players
  int getTotalPointsUsed() {
    return playerPointsMap.values.fold(0, (sum, points) => sum + points);
  }

  // Method to update remainingPoints based on total points used
  void updateRemainingPoints() {
    remainingPoints = 100 - getTotalPointsUsed();
  }

  void addOrUpdatePlayer(
      String positionKey, String playerId, int playerPoints) {
    if (selectedPlayers.containsKey(positionKey)) {
      String oldPlayerId = selectedPlayers[positionKey]!.first;
      int oldPlayerPoints = playerPointsMap[oldPlayerId] ?? 0;
      remainingPoints += oldPlayerPoints;
      playerPointsMap.remove(oldPlayerId);
    }

    if (remainingPoints >= playerPoints) {
      selectedPlayers[positionKey] = [playerId];
      playerPointsMap[playerId] = playerPoints;
      updateRemainingPoints(); // Ensure remaining points update correctly
    } else {
      print("Not enough points to select this player!");
    }
  }

  void removePlayer(String playerId) {
    selectedPlayers.forEach((key, players) {
      players.remove(playerId);
    });
  }

  void updatePlayerAtPosition(String key, String newPlayerId) {
    if (!selectedPlayers.containsKey(key)) {
      selectedPlayers[key] = [];
    }

    selectedPlayers[key] = [newPlayerId];
  }

  void removeAllPlayer() {
    selectedPlayers.clear();
    remainingPoints = 100;
  }

  bool isPlayerSelected(String playerId) {
    return selectedPlayers.values.any((players) => players.contains(playerId));
  }

  List<String> getPlayers(String key) {
    return selectedPlayers[key] ?? [];
  }

  int getTotalPlayersCount() {
    return selectedPlayers.values
        .fold(0, (sum, players) => sum + players.length);
  }
}
