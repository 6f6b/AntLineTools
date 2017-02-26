# AntLineTools
  AntLineTools是一个工具类别，只要在UIView或者其子类中引入这个类别并执行相应的方法便可以对UIView或者其子类进行切割，并将切割部分保存为图片
# Usage
  1.  将AntLineTools文件夹导入工程

  2.  在需要使用的地方导入 UIView+AntLineTools.h 

  3.  配置生成的UIView实例，即：

      #### UIImageView *imageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"zxy.JPEG"]];

      #### GetImageBlock getImageBlock = ^(UIImage *image){

      #### UIImageView *imagev = [[UIImageView alloc] initWithImage:image];[self.view addSubview:imagev];

      #### };

      ####  [imageV configAntLineToolsWith:getImageBlock];
