class CubePiece {
    private PVector center;
    private ArrayList<CubePieceFace> sides = new ArrayList();
   
    public CubePiece(PVector centerIn) {
      center = centerIn;
      
      for (PVector a : AXES) {
         CubePieceFace face = new CubePieceFace(a);
         sides.add(face);
      }
    }
    public void show() {
      pushMatrix();
      translate(center.x, center.y, center.z);
      for (CubePieceFace face : sides) {
        face.show();
      }
      popMatrix();
    }
}