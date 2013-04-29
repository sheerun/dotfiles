# Given desired and installed items
# return a list of uninstalled ones.
function to_install() {
  normalize() { for i in $1; do echo $i; done }
  comm -23 <(normalize "$1" | sort) <(normalize "$2" | sort)
}
