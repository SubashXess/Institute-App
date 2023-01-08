// ignore_for_file: avoid_print

class AverageRatingCalc {
  static averageRatingCalculation(List<int> ratings) {
    int starCount = 5;
    int totalRatings = 0;

    // 81, 87, 43, 55, 34

    for (var index = 0; index < starCount; index++) {
      totalRatings += ratings[index];
    }
    print(totalRatings);
  }
}


/* 

int starCount = 5; // number of rating star
    int totalRatings = 0; // total number of ratings

    for (int index = 0; index < starCount; index++) {
      totalRatings += ratings[index];
      print('Total Ratings : $totalRatings');
    }
    double averageRatings = totalRatings / starCount; // average ratings

    print('Actual averageRatings: $averageRatings');

    double storeRatings = 0.0; // store ratings

    if (averageRatings >= 5.0) {
      print("5.0 Star");
      storeRatings = 5.0;
    } else if (averageRatings >= 4.5) {
      print("4.5 Star");
      storeRatings = 4.5;
    } else if (averageRatings >= 4.0) {
      print("4.0 Star");
      storeRatings = 4.0;
    } else if (averageRatings >= 3.5) {
      print("3.5 Star");
      storeRatings = 3.5;
    } else if (averageRatings >= 3.0) {
      print("3.0 Star");
      storeRatings = 3.0;
    } else if (averageRatings >= 2.5) {
      print("2.5 Star");
      storeRatings = 2.5;
    } else if (averageRatings >= 2.0) {
      print("2.0 Star");
      storeRatings = 2.0;
    } else if (averageRatings >= 1.5) {
      print("1.5 Star");
      storeRatings = 1.5;
    } else if (averageRatings >= 1.0) {
      print("1.0 Star");
      storeRatings = 1.0;
    } else if (averageRatings >= 0.5) {
      print("0.5 Star");
      storeRatings = 0.5;
    } else if (averageRatings >= 0.1) {
      print("Starting Stars");
      storeRatings = 0.5;
    } else {
      print('No Ratings');
      storeRatings = 0.0;
    }
    return storeRatings;
*/