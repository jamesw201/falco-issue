backend M_ade_Up_backend1 { .host = "203.0.114.0"; }
backend M_ade_Up_backend2 { .host = "203.0.114.1"; }

table backends BACKEND {
  "example1": M_ade_Up_backend1,
  "example2": M_ade_Up_backend2,
}

sub vcl_recv {
#FASTLY recv

  set req.backend = table.lookup_backend(backends, req.http.host, M_ade_Up_backend1);

  return(pass);
}
