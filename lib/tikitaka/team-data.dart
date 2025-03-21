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
    String positionKey,
    String playerId,
    int playerPoints,
  ) {
    if (selectedPlayers.containsKey(positionKey)) {
      String oldPlayerId = selectedPlayers[positionKey]!.first;
      int oldPlayerPoints = playerPointsMap[oldPlayerId] ?? 0;
      remainingPoints += oldPlayerPoints;
      playerPointsMap.remove(oldPlayerId);
    }

    if (remainingPoints >= playerPoints) {
      selectedPlayers[positionKey] = [playerId];
      playerPointsMap[playerId] = playerPoints;
      remainingPoints -= playerPoints;
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

  Map<String, dynamic>? getPlayerDetails(String playerId) {
    final List<Map<String, dynamic>> players = [
      {
        "id": "1",
        "image": "assets/images/player_avatar.png",
        "name": "Darcie Brown",
        "price": 2,
        "points": 120,
      },
      {
        "id": "2",
        "image": "assets/images/ess_logo.png",
        "name": "hama hama hama Schutt",
        "price": 9,
        "points": 210,
      },
      {
        "id": "3",
        "image": "assets/images/player_avatar.png",
        "name": "Annabel land",
        "price": 8,
        "points": 140,
      },
      {
        "id": "4",
        "image": "assets/images/player_avatar.png",
        "name": "Alana King",
        "price": 6,
        "points": 180,
      },
      {
        "id": "5",
        "image": "assets/images/player_avatar.png",
        "name": "Saulo A. C.",
        "price": 6,
        "points": 96,
      },
      {
        "id": "6",
        "image": "assets/images/player_avatar.png",
        "name": "Saulo A. C.",
        "price": 5,
        "points": 86,
      },
      {
        "id": "7",
        "image": "assets/images/player_avatar.png",
        "name": "Darcie Brown",
        "price": 2,
        "points": 120,
      },
      {
        "id": "8",
        "image": "assets/images/player_avatar.png",
        "name": "Megan Schutt",
        "price": 9,
        "points": 210,
      },
      {
        "id": "9",
        "image": "assets/images/player_avatar.png",
        "name": "Annabel land",
        "price": 8,
        "points": 140,
      },
      {
        "id": "10",
        "image": "assets/images/player_avatar.png",
        "name": "Alana King",
        "price": 6,
        "points": 180,
      },
      {
        "id": "11",
        "image": "assets/images/player_avatar.png",
        "name": "Saulo A. C.",
        "price": 5,
        "points": 80,
      },
      {
        "id": "12",
        "image": "assets/images/player_avatar.png",
        "name": "Saulo A. C.",
        "price": 6,
        "points": 96,
      },
      {
        "id": "13",
        "image": "assets/images/player_avatar.png",
        "name": "Saulo A. C.",
        "price": 5,
        "points": 86,
      },
      {
        "id": "14",
        "image": "assets/images/player_avatar.png",
        "name": "Darcie Brown",
        "price": 2,
        "points": 120,
      },
      {
        "id": "15",
        "image": "assets/images/player_avatar.png",
        "name": "Megan Schutt",
        "price": 9,
        "points": 210,
      },
    ];

    // Find the player by ID
    return players.firstWhere(
      (player) => player["id"] == playerId,
      orElse: () => {}, // Return an empty map if player not found
    );
  }

  int getTotalPlayersCount() {
    return selectedPlayers.values
        .fold(0, (sum, players) => sum + players.length);
  }
}
