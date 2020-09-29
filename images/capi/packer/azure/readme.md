# Use the VHD

These packer images are designed for use with [Cluster API Provider Azure]([Cluster API Provider Azure](https://capz.sigs.k8s.io/introduction.html#what-is-the-cluster-api-provider-azure)) (CAPZ). Learn more on using [custom images with CAPZ](https://capz.sigs.k8s.io/topics/custom-images.html).

## Provision a VM directly with VHD

After creating a VHD, create a managed image using the url output from `make build-azure-vhd-<image>` and use it to [create the VM](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/build-image-with-packer#create-a-vm-from-the-packer-image): 

```bash
az image create -n testvmimage -g cluster-api-images --os-type <Windows/Linux> --source <storage url for vhd file>
az vm create -n testvm --image testvmimage -g cluster-api-images
```

## Debugging packer scripts
There are several ways to debug packer scripts: https://www.packer.io/docs/other/debugging.html
