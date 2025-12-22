data "aws_subnet" "this" {
    id = var.subnet_id
}

resource "aws_network_interface" "eni" {
    subnet_id       = data.aws_subnet.this.id
}

resource "aws_instance" "ec2_instance" {
    ami                         = var.ami_id
    instance_type               = var.instance_type
    network_interface {
        network_interface_id = aws_network_interface.eni.id
        device_index         = 0
    }
    key_name                    = var.key_name
    vpc_security_group_ids      = var.security_group_ids
    tags = {
        Name = var.name
    }

}

resource "aws_ebs_volume" "ebs_volume" {
    availability_zone = data.aws_subnet.this.availability_zone
    size              = var.ebs_size_gb
    type              = var.ebs_type
}

resource "aws_volume_attachment" "ebs_attachment" {
    device_name = "/dev/xvdf"
    volume_id   = aws_ebs_volume.ebs_volume.id
    instance_id = aws_instance.ec2_instance.id
}