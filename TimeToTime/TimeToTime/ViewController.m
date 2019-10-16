//
//  ViewController.m
//  TimeToTime
//
//  Created by Apple on 2019/7/31.
//  Copyright © 2019 Apple. All rights reserved.
//

#import "ViewController.h"
#import <CoreMotion/CoreMotion.h>
#import "Ball.h"
@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *LX;
@property (weak, nonatomic) IBOutlet UILabel *LY;
@property (weak, nonatomic) IBOutlet UILabel *LZ;
@property (weak, nonatomic) IBOutlet UILabel *lab1;

@property (weak, nonatomic) IBOutlet UIView *ball;

@end
CMMotionManager *_mana;
double markX=100;
double markY=300;
double markZ=100;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *s1 = @"123m.2";
    NSString *s2 = @"222sd.d";
    
    NSString *sd = [s1 stringByAppendingString:[NSString stringWithFormat:@"%@",s2]];
    NSLog(@"%@",sd);
//    _ball =[[Ball alloc]initWithFrame:CGRectMake(400, 400, 50, 50)];
//        _mana= [[CMMotionManager alloc]init];
//    _mana.accelerometerUpdateInterval = 1.0/60.0;
//    [_mana startMagnetometerUpdates];
//    [NSTimer scheduledTimerWithTimeInterval:1.0/60.0 target:self selector:@selector(shackaction) userInfo:nil repeats:YES];
//    [[UIAccelerometer alloc]init];
    // Do any additional setup after loading the view.
    //获得单例对象
       UIAccelerometer *accelerometer = [UIAccelerometer sharedAccelerometer];
         //设置代理
        accelerometer.delegate = self;
       //设置采样间隔 1/60.0 就是 1秒采集60次
      accelerometer.updateInterval = 1 / 60.0;
//    _lab1 = [[UILabel alloc]initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height-50, 30, 400)];
   
//    [self.view addSubview:_lab1];
    
}

-(void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration
 {
     
     _LX.text =[NSString stringWithFormat:@"%f",acceleration.x];
             _LY.text =[NSString stringWithFormat:@"%f",-acceleration.y];
             _LZ.text =[NSString stringWithFormat:@"%f",acceleration.z];
//     [NSTimer scheduledTimerWithTimeInterval:1/60.0 target:self selector:@selector(moveBall) userInfo:nil repeats:YES];
     CGRect Xs =[UIScreen mainScreen].bounds;
     
     markX +=[_LX.text doubleValue]*20;
     markY +=[_LY.text doubleValue]*20;
     markZ -=[_LZ.text doubleValue]*3;
     if (markX>=Xs.size.width-markZ) {
         markX = Xs.size.width-markZ;
     }
     if (markX<=0) {
         markX = 0;
     }
     if (markY>=Xs.size.height) {
         markY = Xs.size.height-markZ/8;
     }
     if (markY<=markZ) {
         markY=0;
     }
     if ( markZ>=Xs.size.width/4||markZ<=-Xs.size.width) {
         markZ = Xs.size.width/4;
     }
      _lab1.text = [NSString stringWithFormat:@"X:%f  Y:%f",markX,markY];
     [self moveBall];
//        NSLog(@"x加速度%f--y加速度%f--z加速度%f",acceleration.x,acceleration.y,acceleration.z);
}
-(void)moveBall{
    
    [self.ball setFrame:CGRectMake(markX,markY,markZ,markZ)];
    
    
    
    //     [self.lab1 removeFromSuperview];
//    [self.view addSubview:_lab1];
}

//- (void)shackaction
//{
//    if (_mana.accelerometerData.acceleration.x > 0 || _mana.accelerometerData.acceleration.y> 0 ||_mana.accelerometerData.acceleration.z> 0)
//    {
//        _LX.text =[NSString stringWithFormat:@"%f",_mana.accelerometerData.acceleration.x];
//        _LY.text =[NSString stringWithFormat:@"%f",_mana.accelerometerData.acceleration.y];
//        _LZ.text =[NSString stringWithFormat:@"%f",_mana.accelerometerData.acceleration.z];
//        NSLog(@"%f",_mana.accelerometerData.acceleration.z);
//    }
//}

@end
