//
//  ViewController.m
//  MyFire1
//
//  Created by Civet on 2019/4/23.
//  Copyright © 2019年 PandaTest. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic) CAEmitterLayer *fireEmitter;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor blackColor];
    //设置发生器
    _fireEmitter = [[CAEmitterLayer alloc]init];
    NSLog(@"==============1");
    _fireEmitter.emitterPosition = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height - 20);
    _fireEmitter.emitterSize = CGSizeMake(self.view.frame.size.width - 100, 20);
    _fireEmitter.renderMode = kCAEmitterLayerAdditive;
    //发射火焰
    //火焰
    CAEmitterCell *fire = [CAEmitterCell emitterCell];
    fire.birthRate = 1600;
    fire.lifetime = 0.5;
    fire.lifetimeRange = 1.5;
    fire.color = [[UIColor colorWithRed:0.8 green:0.4 blue:0.2 alpha:0.1]CGColor];
    fire.contents = (id)[[UIImage imageNamed:@"火焰.png"]CGImage];
    [fire setName:@"fire"];
    fire.velocity = 160;
    fire.velocityRange = 80;
    fire.emissionLongitude = M_PI + M_PI_2;
    fire.emissionRange = M_PI_2;
    fire.scaleSpeed = 0.3;
    fire.spin = 0.2;
    //烟雾
    CAEmitterCell *smoke = [CAEmitterCell emitterCell];
    smoke.birthRate = 800;
    smoke.lifetime = 6.0;
    smoke.lifetimeRange = 1.5;
    smoke.color = [[UIColor colorWithRed:1 green:1 blue:1 alpha:0.05]CGColor];
    smoke.contents = (id)[[UIImage imageNamed:@"1.png"]CGImage];
    [fire setName:@"smoke"];
    smoke.velocity = 250;
    smoke.velocityRange = 100;
    smoke.emissionLongitude = M_PI + M_PI_2;
    smoke.emissionRange = M_PI_2;
    _fireEmitter.emitterCells = [NSArray arrayWithObjects:fire,smoke,nil];
    [self.view.layer addSublayer:_fireEmitter];
    NSLog(@"==============");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
