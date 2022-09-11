# resource "aws_route53_zone" "example" {
#   name = "example.com"
# }
# resource "aws_route53_record" "server1-record" {
#     zone_id = aws_route53_zone.example.id
#     name = "server1.example.com"
#     type = "A"
#     ttl = "300"
#     records = [ "104.236.247.8" ]
# }
# resource "aws_route53_record" "www-record" {
#     zone_id = aws_route53_zone.example.id
#     name = "www.example.com"
#     type = "A"
#     ttl = "300"
#     records = [ "104.236.247.8" ]
# }
# resource "aws_route53_record" "mail1-record" {
#     zone_id = aws_route53_zone.example.id
#     name = "example.com"
#     type = "MX"
#     ttl = "300"
#     records = [ "1 aspmx.l.google.com.",
#         "5 alt2.aspmx.l.google.com."
#      ]
# }
# output "ns-servers" {
#     value = aws_route53_zone.example.name_servers
  
# }