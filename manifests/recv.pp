#recv.pp
define varnish::recv(
  $rule = undef,
  $order = '03'
) {

  concat::fragment { "${title}-recv":
    target  => "${varnish::vcl::includedir}/recv.vcl",
    content => template('varnish/includes/recv.vcl.erb'),
    order   => $order,
  }

}
