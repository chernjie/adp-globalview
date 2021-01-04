(.buckets | map({ key: .id, value: .label }) | from_entries) as $buckets
| .payments
| map(
    .date as $date
  | .from as $from
  | .to as $to
  | .id as $payslip_id
  | .buckets
  | map(
      (.id + " " + $buckets[.id]) as $bucket
    | .wagetypes
    | map(select(.amount == 0 | not)
      | {
        date: $date,
        from: $from,
        to: $to,
        payslip_id: $payslip_id,
        bucket: $bucket,
        label: .label,
        amount,
        year: $date | strptime("%Y-%m-%d") | strftime("%Y"),
        month: $date | strptime("%Y-%m-%d") | strftime("%m"),
      })
  )
)
| flatten
