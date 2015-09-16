//
//  TapCirculo.m
//  TapCirculos
//
//  Created by Fabricio Nogueira dos Santos on 9/15/15.
//  Copyright (c) 2015 Fabricio Nogueira. All rights reserved.
//

#import "TapCirculo.h"

@interface TapCirculo()

-(void) registraEventos;

@end

@implementation TapCirculo

/**
 * Construtor da classe
 * Registra os eventos de toque.
 */
-(id)init{
    if ((self = [super init])) {
        [self registraEventos];
    }
    return self;
}
/**
 * Registra o evento do toque desejado
 *
 *
 */
-(void)registraEventos{
    /*
     * Os reconhecedores são classes independetes...
     * Todos reconhecedores de gestos seguem a mesma estrutura de construção, esperando a classe que irá tratar os eventos
     * (initWithTarget) e o método naquela classe (action) que será responsável pela ação em si.
     */
    UITapGestureRecognizer *toque =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(toqueRecebido:)];
    /*
     * serve para informar quantos toques o usuário deverá fazer para que a ação seja disparada.
     */
    toque.numberOfTapsRequired = 1;
    /*
     * Adiciona o gesto na view para que o IOS possa identificar as ações no momento em que for apropriado.
     */
    [self addGestureRecognizer:toque];
}
/**
 *
 */
-(void) toqueRecebido:(UIGestureRecognizer *) gesto{
    if (!circulos) {
        circulos = [[NSMutableArray alloc]init];
    }
    
    CGPoint localizacaoToque = [gesto locationInView:self];
    [circulos addObject:[NSValue valueWithCGPoint:localizacaoToque]];
    [self setNeedsDisplay];
    
}
/**
 * Método responsável por realizar as tarefas de desenho na tela
 */
-(void) drawRect:(CGRect)rect{
    /*
     * Contexto atual
     */
    CGContextRef contexto = UIGraphicsGetCurrentContext();
    /*
     * Tamanho da linha
     */
    CGContextSetLineWidth(contexto, 1.0);
    /*
     * Cor de fundo
     */
    CGColorRef corFundo = [UIColor redColor].CGColor;
    /*
     * Preenchimento
     */
    CGContextSetFillColor(contexto, CGColorGetComponents(corFundo));
    /*
     *
     */
    int tamanho = 25;
    /*
     * intera por todos os pontos de toque registrados no método touchesEnded,
     * desenhado os círculos na tela
     */
    for (NSValue *item in circulos) {
        /*
         * recupera o valor do CGPoint adicionado quando o usuário
         * interagiu com o aplicativo
         */
        CGPoint ponto = [item CGPointValue];
        /*
         * define a área do cículo
         */
        CGRect regiao = CGRectMake(ponto.x, ponto.y, tamanho, tamanho);
        /*
         * pinta o círculo na tela
         */
        CGContextAddEllipseInRect(contexto, regiao);
        CGContextFillEllipseInRect(contexto, regiao);
    }
    /*
     *
     */
    CGContextStrokePath(contexto);
}
@end















