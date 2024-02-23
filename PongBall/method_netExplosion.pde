void netExplosion(float xParameter, float yParamter ) {
  for (int i=0; i < fireworks.length; i++) {
      fireworks[i] = new Ball(xParameter, yParamter, 0.5);
    }
} //End netExplosion
