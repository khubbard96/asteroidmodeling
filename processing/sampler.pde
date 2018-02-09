

class Test {
  AstPoint[][] allPoints = new AstPoint[10][10]; //based on z-height of asteroid [stacknum][circlepos]

  public Test() {

    for(int z = ;) {


    }

  }

}


/**
  Normalizes z components of a set of 3D coordinates based on a resolution
  factor. 3D coordinates are standardized into a set of "Z levels", the number
  of which is determined with the resolution and max/min z coordinates of the
  set of AstPoints.
*/

class Levelizer {

  ArrayList<AstPoint> rawPoints
  int res;

  ArrayList<ZLevel> levels;

  public Levelizer(ArrayList<AstPoint> pointsIn,int resIn) {
    this.rawPoints = pointsIn;
    this.res = resIn;
    this.levelPoints();
  }
  public ArrayList<ZLevel> getLevels() {
    return this.levels;
  }

  /**
    Compresses z-values down to next z-level.

    @return ArrayList sorted by z values in ascending order
  */
  private ArrayList<AstPoint> compressPoints() {
    ArrayList<AstPoint> tempList = new ArrayList<AstPoint>();
    for(AstPoint toCompress : rawPoints) {
      double zValue = toCompress.getZ()
      toCompress.resetZ(zValue - (zValue % this.res));
      tempList.add(toCompress);
    }
    //sort the temp list on z values, low to high

    return tempList;
  }

  /**
    Splits set of compressed points into several ZLevels. Sets the current
    instance's levels property to the resulting set of ZLevel objects
  */

  private void splitLevels(ArrayList<AstPoint> points, int trimFactor) {
    Iterator<AstPoint> ptsIter = points.iterator();
    AstPoint nextPoint;
    double currIdx = points.get(0).getZ();
    ArrayList<AstPoint> tempList = new ArrayList<AstPoint>();

    while(ptsIter.hasNext()) {
      nextPoint = ptsIter.next();
      if(nextPoint.getZ() == currIdx) {
        tempList.add(nextPoint);
      }
      else {
        this.levels.add(new ZLevel(currIdx,trimFactor,tempList));
        currIdx = nextPoint.getZ();
        tempList.clear()
        tempList.add(nextPoint);
      }
    }
    this.levels.add(new ZLevel(currIdx,trimFactor,tempList));
  }
}








class ZLevel {
  //internal objects
  LevelBestFit levelCenter;
  ArrayList<Point3D> surfacePoints;

  //operations variables
  double levelIndex;
  int trimFactor;

  public ZLevel(double idxIn, int trimFactorIn,ArrayList<AstPoint> origPoints) {
    this.levelIndex = idxIn;
    this.trimFactor = trimFactorIn;
  }



  /**
    Trims down the points in the level, based on the resolution
  */
  private void trimLevel() {

  }

  /**

  */
  private void findBestFit() {

  }

}

/**
  Represents the surface coordinates. Contains 3D coordinates as well as 2D
  polar equivalents (r, theta) of x,y based on the z-level index.
*/

class Point3D {

  //normal,3D geometrical coordinate. the
  double x;
  double y;
  double z; //z index after compression
  //related 2D polar coordinate for a given z value
  double r;
  double theta;

  //constructor for asteroid surface points
  public Point3D(double x_in, double y_in, double z_in, Point3D circleCenter) {

  }

}




/**
  Contains information about the center point of a level. May change this later
  to instead represent the approximate level boundary, which will be an ellipse.
*/


class LevelBestFit {

  public LevelCenter3D(double x_in, double y_in, double z_in, int relZLevel) {

  }

}
