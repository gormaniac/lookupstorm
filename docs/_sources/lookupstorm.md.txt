# The lookup-storm Rapid Power-Up
Lookup common atomic indicators in Synapse as strings rather than a `<form>=<valu>` pair.

Not every Synapse user can, or should be expected to, know the necessary form names for common atomic indicators that analysts use. They need a way to query for these values quickly and without the form.

Adds a `lookup` command to a Synapse instance that accepts multiple input strings and yields Synapse nodes that have the input items as primary values. The nodes are created if they don't already exist. The input items are used to attempt to lift nodes of the following forms, in this order, using `?=`:
```
hash:md5
hash:sha1
hash:sha256
inet:cidr4
inet:ipv4
inet:ipv6
inet:fqdn
inet:email
inet:server
inet:url
file:path
```
