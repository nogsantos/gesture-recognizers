//
//  ViewController.m
//  TapCirculos
//
//  Created by Fabricio Nogueira dos Santos on 9/15/15.
//  Copyright (c) 2015 Fabricio Nogueira. All rights reserved.
//

#import "ViewController.h"
#import "TapCirculo.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) loadView{
    TapCirculo *c     = [[TapCirculo alloc] init];
    c.backgroundColor = [UIColor blackColor];
    self.view         = c;
}

@end
