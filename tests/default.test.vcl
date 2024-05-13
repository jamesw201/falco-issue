// default.test.vcl

// @scope: recv
// @suite: Test Backend is set by table lookup
sub test_vcl_recv {
  // set req.http.host = "example1"; // doesn't works
  set req.http.host = "randomstring";  // works

  testing.call_subroutine("vcl_recv");

  assert.equal(req.backend, M_ade_Up_backend1);
}
