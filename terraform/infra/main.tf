module "dev-application" {
    source = "../modules/ec2-ebs-eni"
    name = "code-panda-ec2-instance"
    subnet_id = "subnet-02b72904ed181487d"
    security_group_ids = ["sg-09a034d45aebea1da"]
    key_name = "codepanda-demo-session"
    ebs_size_gb = 20
}
