class Cube {
  
  CubePiece[][][] pieces = new CubePiece[3][3][3];
  
  public Cube() {
    for (int i = -1; i < 2; i++) {
      for (int j = -1; j < 2; j++) {
        for (int k = -1; k < 2; k++) {
          CubePiece piece = new CubePiece(new PVector(i*2*R, j*2*R, k*2*R));
          pieces[i+1][j+1][k+1] = piece;
        }
      }
    }
  }
  public void show() {
    
    for (int i = 0; i < pieces.length; i++) {
      for (int j = 0; j < pieces[i].length; j++) {
        for (int k = 0; k < pieces[i][j].length; k++) {
          pieces[i][j][k].show();
        }
      }
    }
  }
}