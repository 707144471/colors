//
//  ViewController.m
//  测试
//
//  Created by 123 on 2017/4/11.
//  Copyright © 2017年 123. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIView *_testView;
    UIImageView *_testView1;
    UIBezierPath *_path;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    CGRect rect = CGRectMake(100, 100, 100, 100);
    
    UIBezierPath *beizPath=[UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:50];
    //先画一个圆
    CAShapeLayer *layer=[CAShapeLayer layer];
    layer.path=beizPath.CGPath;
    layer.fillColor=[UIColor yellowColor].CGColor;//填充色
    layer.strokeColor=[UIColor redColor].CGColor;//边框颜色
    layer.lineWidth=6.0f;
    layer.lineCap=kCAFillRuleNonZero;//线框类型
    [self.view.layer addSublayer:layer];
    
        
    
    CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.fromValue=[NSNumber numberWithFloat:0.00f];
    animation.toValue=[NSNumber numberWithFloat:1];
    animation.duration=2.0;
    
    animation.repeatCount=HUGE;//永久重复动画
    //animation.delegate=self;
    //removedOnCompletion：默认为YES，代表动画执行完毕后就从图层上移除，图形会恢复到动画执行前的状态。如果想让图层保持显示动画执行后的状态，那就设置为NO，不过还要设置fillMode为kCAFillModeForwards
    //fillMode：决定当前对象在非active时间段的行为.比如动画开始之前,动画结束之后
    //autoreverses:动画结束时是否执行逆动画
    //timingFunction:设定动画的速度变化
    //kCAFillModeBackwards 可以让动画闭合
    //kCAFillModeForwards  动画不会闭合
    animation.fillMode=kCAFillModeForwards;
    animation.autoreverses=kCAFillModeForwards;
    animation.removedOnCompletion=NO;
    animation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [layer addAnimation:animation forKey:@"animation"];
    
    
    
    
    

    
    
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(100, 250, 100, 100)];
    view.backgroundColor=[[UIColor whiteColor]colorWithAlphaComponent:0.3];
    [self.view addSubview:view];
    
    
    
    CAGradientLayer* gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = @[(__bridge id)[self colorWithHexString:@"#f19d40"].CGColor, (__bridge id)[self colorWithHexString:@"#e61f5b"].CGColor];
    gradientLayer.locations = @[@0.0,@1.0];
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1.0, 0);
    gradientLayer.frame = CGRectMake(0, 0, 100, 100);
    [view.layer addSublayer:gradientLayer];
    
    //CGRect rectTwo=CGRectMake(0, 0, 100, 100);
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    //shapeLayer.backgroundColor=(__bridge CGColorRef _Nullable)([UIColor yellowColor]);
    // shapeLayer.frame = rectTwo;
    shapeLayer.strokeEnd = 0.75;
    shapeLayer.strokeStart = 0;
    CGRect rectThhee=CGRectMake(10, 10, 80, 80);
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:rectThhee];
    shapeLayer.path = path.CGPath;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.lineWidth = 8;
    shapeLayer.strokeColor = [UIColor redColor].CGColor;
    [view.layer addSublayer:shapeLayer];
    CGAffineTransform transform= CGAffineTransformMakeRotation(M_PI*1.5);view.transform = transform;
    gradientLayer.mask = shapeLayer;
    
    
    
    
    

    
    
//    
//    _testView=[[UIView alloc] initWithFrame:CGRectMake(30, 300, 100, 100)];
//    [self.view addSubview:_testView];
//    
//    _testView.layer.backgroundColor = [UIColor clearColor].CGColor;
//    //CAShapeLayer和CAReplicatorLayer都是CALayer的子类
//    //CAShapeLayer的实现必须有一个path，可以配合贝塞尔曲线
//    CAShapeLayer *pulseLayer = [CAShapeLayer layer];
//    pulseLayer.frame = _testView.layer.bounds;
//    pulseLayer.path = [UIBezierPath bezierPathWithOvalInRect:pulseLayer.bounds].CGPath;
//    pulseLayer.fillColor = [UIColor redColor].CGColor;//填充色
//    pulseLayer.opacity = 0.0;
//    
//    //可以复制layer
//    CAReplicatorLayer *replicatorLayer = [CAReplicatorLayer layer];
//    replicatorLayer.frame = _testView.bounds;
//    replicatorLayer.instanceCount = 4;//创建副本的数量,包括源对象。
//    replicatorLayer.instanceDelay = 1;//复制副本之间的延迟
//    [replicatorLayer addSublayer:pulseLayer];
//    [_testView.layer addSublayer:replicatorLayer];
//    
//    CABasicAnimation *opacityAnima = [CABasicAnimation animationWithKeyPath:@"opacity"];
//    opacityAnima.fromValue = @(0.3);
//    opacityAnima.toValue = @(0.0);
//    
//    CABasicAnimation *scaleAnima = [CABasicAnimation animationWithKeyPath:@"transform"];
//    scaleAnima.fromValue = [NSValue valueWithCATransform3D:CATransform3DScale(CATransform3DIdentity, 0.0, 0.0, 0.0)];
//    scaleAnima.toValue = [NSValue valueWithCATransform3D:CATransform3DScale(CATransform3DIdentity, 1.0, 1.0, 0.0)];
//    
//    CAAnimationGroup *groupAnima = [CAAnimationGroup animation];
//    groupAnima.animations = @[opacityAnima, scaleAnima];
//    groupAnima.duration = 4.0;
//    groupAnima.autoreverses = NO;
//    groupAnima.repeatCount = HUGE;
//    [pulseLayer addAnimation:groupAnima forKey:@"groupAnimation"];
//   // 这里的_testview就是测试view通过对这个view的操作设置来实现雷达波纹扩散的效果。
//    //不规则图形的划线的实例如下：
//    UIView *line=[[UIView alloc] initWithFrame:CGRectMake(0, 100, 400, 1)];
//    line.backgroundColor=[UIColor grayColor];
//    [self.view addSubview:line];
//    
//    _testView1=[[UIImageView alloc] initWithFrame:CGRectMake(0, 100, 300, 200)];
//    _testView1.userInteractionEnabled=YES;
//    [self.view addSubview:_testView1];
//    
//    
//    //贝塞尔曲线,以下是4个角的位置，相对于_testView1
//    CGPoint point1= CGPointMake(10, 80);
//    CGPoint point2= CGPointMake(10, 200);
//    CGPoint point3= CGPointMake(300, 200);
//    CGPoint point4= CGPointMake(300, 80);
//    
//    _path=[UIBezierPath bezierPath];
//    [_path moveToPoint:point1];//移动到某个点，也就是起始点
//    [_path addLineToPoint:point2];
//    [_path addLineToPoint:point3];
//    [_path addLineToPoint:point4];
//    //controlPoint控制点，不等于曲线顶点
//    [_path addQuadCurveToPoint:point1 controlPoint:CGPointMake(150, -30)];
//    
//    CAShapeLayer *shapeLayer=[CAShapeLayer layer];
//    shapeLayer.path=_path.CGPath;
//    shapeLayer.fillColor=[UIColor clearColor].CGColor;//填充颜色
//    shapeLayer.strokeColor=[UIColor orangeColor].CGColor;//边框颜色
//    [_testView1.layer addSublayer:shapeLayer];
//    
//    //动画
//    CABasicAnimation *pathAniamtion = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
//    pathAniamtion.duration = 3;
//    pathAniamtion.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//    pathAniamtion.fromValue = [NSNumber numberWithFloat:0.0f];
//    pathAniamtion.toValue = [NSNumber numberWithFloat:1.0];
//    pathAniamtion.autoreverses = NO;
//    [shapeLayer addAnimation:pathAniamtion forKey:nil];
//    
//    
//    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickk)];
//    [_testView1 addGestureRecognizer:tap];

    //字符串
    NSMutableDictionary *dictionary=[[NSMutableDictionary alloc]init];
    [dictionary setObject:@"aa" forKey:@"aa"];
    [dictionary setObject:@"a" forKey:@"a"];
    [dictionary setObject:@"ae" forKey:@"ae"];
    [dictionary setObject:@"ae1" forKey:@"ae1"];
    [dictionary setObject:@"b" forKey:@"b"];
    
    
    
    NSString *string=[self TheKeyValueSequence:dictionary];
    NSLog(@"%@",string);
    
//    NSArray *keysArray = [dictionary allKeys];//获取所有键存到数组
//    NSArray *sortedArray = [keysArray sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2){
//        return [obj1 compare:obj2 options:NSNumericSearch];
//    }];//由于allKeys返回的是无序数组，这里我们要排列它们的顺序
//    for (NSString *key in sortedArray) {
//        NSString *value = [dictionary objectForKey: key];
//        NSLog(@"排列的值:%@",value);
//    }
//    
    
    // Do any additional setup after loading the view, typically from a nib.
}
#pragma mark - 键值对排序
-(NSString *)TheKeyValueSequence:(NSDictionary *)dic{
    
    NSArray *keysArray = [dic allKeys];//获取所有键存到数组
    NSArray *sortedArray = [keysArray sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2){
        return [obj1 compare:obj2 options:NSNumericSearch];
    }];//由于allKeys返回的是无序数组，这里我们要排列它们的顺序
    NSMutableArray *keysNameArray=[NSMutableArray arrayWithCapacity:0];
    for (NSString *key in sortedArray) {
        // NSString *value = [dic objectForKey: key];
        [keysNameArray addObject:key];
        // NSLog(@"排列的值:%@",value);
    }
    
    NSString *url;
    for (int i=0; i<keysNameArray.count; i++) {
        NSString *keys=keysNameArray[i];
        
        if (i==0) {
            url=[NSString stringWithFormat:@"%@=%@",keys,[dic objectForKey:keys]];
        }else{
            url=[NSString stringWithFormat:@"%@&%@=%@",url,keys,[dic objectForKey:keys]];
        }
    }
    
    
    return url;
}
//颜色值
-(UIColor *)colorWithHexString:(NSString *)color{
    
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])cString = [cString substringFromIndex:1];
    if ([cString length] != 6) return [UIColor clearColor];
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
}
-(void)clickk{

}
/*
 
 
 CA_EXTERN NSString *const kCAFillRuleNonZero
 CA_AVAILABLE_STARTING (10.6, 3.0, 9.0, 2.0);
 CA_EXTERN NSString *const kCAFillRuleEvenOdd
 CA_AVAILABLE_STARTING (10.6, 3.0, 9.0, 2.0);
 

CA_EXTERN NSString *const kCALineJoinMiter
CA_AVAILABLE_STARTING (10.6, 3.0, 9.0, 2.0);
CA_EXTERN NSString *const kCALineJoinRound
CA_AVAILABLE_STARTING (10.6, 3.0, 9.0, 2.0);
CA_EXTERN NSString *const kCALineJoinBevel
CA_AVAILABLE_STARTING (10.6, 3.0, 9.0, 2.0);


CA_EXTERN NSString *const kCALineCapButt
CA_AVAILABLE_STARTING (10.6, 3.0, 9.0, 2.0);
CA_EXTERN NSString *const kCALineCapRound
CA_AVAILABLE_STARTING (10.6, 3.0, 9.0, 2.0);
CA_EXTERN NSString *const kCALineCapSquare
CA_AVAILABLE_STARTING (10.6, 3.0, 9.0, 2.0);

 */

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
