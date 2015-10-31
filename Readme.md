###轮播图###

1. 申请一个轮播对象(lb)

2. * 如果轮播图来自本地，则调用`lb.scrollImages(images: [UIImage])`, 传入的是轮播图的图片数组；
   * 如果轮播图来自网络，则调用`lbscrollImagesByNet(imageURLs: [String], placeHolderImage: UIImage)`, 传入图片链接数组(String类型)和一个placeHolderImage。
   
3. 调用`lb.scroll()`开始轮播