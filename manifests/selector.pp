#selector.pp
define varnish::selector(
  $director = $title,
  $condition = undef,
  $rewrite = undef,
  $newurl = undef,
  $movedto = undef,
  $return = undef,
) {

  concat::fragment { "${title}-selector":
    target  => "${varnish::vcl::includedir}/backendselection.vcl",
    content => template('varnish/includes/backendselection.vcl.erb'),
    order   => '03',
  }

}
