# Class varnish::repo
#
# This class installs aditional repos for varnish
#
class varnish::repo (
  $base_url = 'varnishcache/varnish5',
  $enable = true,
  ) {
  include packagecloud

  $type = $::osfamily ? {
    'redhat' => 'rpm',
    'debian' => 'deb',
    default  => 'gem',
  }

  if str2bool($enable) {
    packagecloud::repo { "varnishcache/varnish5":
      type => $type,  # 'rpm' or "deb" or "gem"
    }

    case $::osfamily {
      redhat: {
        yumrepo { 'varnish':
          ensure   => absent,
          descr    => 'varnish'
        }
      }
      debian: {
        apt::source { 'varnish':
          ensure     => absent
        }
      }
      default: {
      }
    }
  }
}
