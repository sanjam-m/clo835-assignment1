{"filter":false,"title":"variables.tf","tooltip":"/terraform/variables.tf","undoManager":{"mark":1,"position":1,"stack":[[{"start":{"row":0,"column":0},"end":{"row":0,"column":1},"action":"insert","lines":["v"],"id":1},{"start":{"row":0,"column":1},"end":{"row":0,"column":2},"action":"insert","lines":["a"]},{"start":{"row":0,"column":2},"end":{"row":0,"column":3},"action":"insert","lines":["r"]},{"start":{"row":0,"column":3},"end":{"row":0,"column":4},"action":"insert","lines":["i"]},{"start":{"row":0,"column":4},"end":{"row":0,"column":5},"action":"insert","lines":["a"]}],[{"start":{"row":0,"column":4},"end":{"row":0,"column":5},"action":"remove","lines":["a"],"id":2},{"start":{"row":0,"column":3},"end":{"row":0,"column":4},"action":"remove","lines":["i"]},{"start":{"row":0,"column":2},"end":{"row":0,"column":3},"action":"remove","lines":["r"]},{"start":{"row":0,"column":1},"end":{"row":0,"column":2},"action":"remove","lines":["a"]},{"start":{"row":0,"column":0},"end":{"row":0,"column":1},"action":"remove","lines":["v"]},{"start":{"row":0,"column":0},"end":{"row":22,"column":1},"action":"insert","lines":["variable \"instance_type\" {","  default     = \"t3.micro\"","  description = \"Type of the instance\"","  type        = string","}","","variable \"env\" {","  default     = \"dev\"","  type        = string","  description = \"Deployment Environment\"","}","","variable \"ecr_repos\" {","  default     = [\"cats\", \"dogs\"]","  type        = set(string)","  description = \"Amazon ECR Repository names\"","}","","variable \"service_ports\" {","  default     = [\"22\", \"8080\", \"8081\"]","  type        = list(string)","  description = \"Ports that should be open on the host machine\"","}"]}]]},"ace":{"folds":[],"scrolltop":54,"scrollleft":0,"selection":{"start":{"row":22,"column":1},"end":{"row":22,"column":1},"isBackwards":false},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":0},"timestamp":1654011959382,"hash":"ef3f0403e2ba79d277fc0a5c62f34e68fc51a40d"}