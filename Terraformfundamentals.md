# Terraform Installation

> Hashicorp tutorial on Terraform installation
<p><a href="https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli?wvideo=r3yytnk1pr"><img src="https://embed-ssl.wistia.com/deliveries/2ba3bf2c657f7563bfcc80ac41d825bd.jpg?image_play_button_size=2x&amp;image_crop_resized=960x540&amp;image_play_button=1&amp;image_play_button_color=1563ffe0" width="400" height="225" style="width: 700px; height: 300px;"></a></p><p><a href="https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli?wvideo=r3yytnk1pr"></a></p>

!> While doing manual installation, if terraform command doesn't work, just try to set the path right

```YAML
Go to Control Panel -> System -> System settings -> Environment Variables.
  - Scroll down in system variables until you find PATH.
  - Click edit and change accordingly.
  - BE SURE to include a semicolon at the end of the previous as that is the delimiter, i.e. c:\path;c:\path2
  - Launch a new console for the settings to take effect.
```

<img src="./_images/installation.png" alt="drawing" width="350" height="350"/>&emsp;<img src="./_images/installation2.png" alt="drawing" width="350" height="350"/>

> Now let's try to check whether the installation is done the right way. Execute and check the code bellow to get the version 

```
terraform -v

Output :
  Terraform v*.*.*
  on windows_386
```
!> Where v*.*.* indicates version

## Basic Commands


| Command   |  Description                                          |
|:--------  | ----------------------------------------------------- |
|  init     |  Prepare your working directory for other commands    |
|  validate |  Check whether the configuration is valid             |
|  plan     |  Show changes required by the current configuration   |
|  apply    |  Create or update infrastructure                      |
|  destroy  |  Destroy previously-created infrastructure            |
