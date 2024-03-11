enum StatusRequest {
  none,
  loading,
  success,
  failure, // فشل داخلي يعني ان عاملو ب php
  serverfailuer,
  offlinefailuer,
  serverException, //  اذا ما في انترنت
}
