#
# @author CJ <lim@chernjie.com>
#
# Usage: cat overview-*.json | jq -sf ./lib/jq/select-overview-with-buckets.jq

reduce .[] as $year (
  { payments: [] };
    .payments as $payments
  | . + $year
  | .payments = ($payments + (
      $year.payments
    | map(select(.buckets | length > 0))
  ))
)
