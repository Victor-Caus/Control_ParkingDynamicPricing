# Sistema de Controle de Estacionamento

Este repositório contém o código para o projeto de um sistema de controle de estacionamento que considera padrões de tráfego e fatores de demanda de estacionamento. Este documento guia você na utilização do código para projetar e avaliar controladores para o sistema.

Em resumo, todo o projeto, ao menos o workflow principal, pode ser executada na main.m de forma bem intuitiva, passo a passo. A estrutura da main está descrita a seguir:

## Projeto do Controlador

O projeto do controlador envolve três etapas principais:

1. **Projetar Controlador Analítico:** Utiliza métodos analíticos para projetar um controlador inicial com base nos requisitos do sistema e nos parâmetros da planta.
   
2. **Otimização com Nelder-Mead ou CMA-ES:** Aplica métodos de otimização (Nelder-Mead ou CMA-ES) para aprimorar o controlador inicial e encontrar uma solução ótima.
   
3. **Avaliação do Controlador:** Avalia o desempenho do controlador tanto de forma analítica (em um sistema aproximado) quanto por meio de simulação para uma duração especificada.

## Funções Principais

- **`obterPlanta`:** Obtém os parâmetros da planta a partir de dados reais, utilizando uma interpolação linear.
  
- **`obterRequisitos`:** Define os requisitos do sistema, incluindo margem de fase, margem de ganho, período de amostragem e banda passante.

- **`projetarControladorAnalitico`:** Executa um método analítico para projetar o controlador inicial com base nos requisitos e na planta.

- **`projetarControladorNelderMead` e `projetarControladorCMAES`:** Realizam a otimização do controlador usando os métodos Nelder-Mead e CMA-ES, respectivamente, a partir do controlador analítico inicial.

## Personalização dos Algoritmos de Otimização

Dentro das funções de otimização (`projetarControladorNelderMead` e `projetarControladorCMAES`), é possível configurar os algoritmos para desabilitar a geração de gráficos ou ajustar outras opções conforme necessário.

## Avaliação e Simulação

- **Avaliar Controlador Analítico:** Avalia o desempenho do controlador otimizado em um sistema aproximado, ideal para análise teórica, plotando os gráficos que estão presentes no relatório.
  
- **Avaliar Controlador Simulação:** Realiza uma simulação do sistema controlado para verificar o desempenho do controlador em condições práticas, plotando gráficos também presentes no relatório.

## Observação

O código fonte completo está disponível para implementação e personalização conforme as necessidades do projeto de controle de estacionamento.
