//LIMITANTE: VULNERABILIDAD DEL SISTEMA, DA ERROR CUANDO EN EL INGRESO DE SUCURSALES O DIAS SE INGRESA UN VALOR QUE NO ES NUMERICO.
//Despliegue de manu principal del sistema
SubAlgoritmo desplegarMenuPrincipal
	Borrar Pantalla;
	Escribir  "***MENU PRINCIPAL***";
	Escribir "Menú de sumatoria de una matriz";
	Escribir "1. Inicializar las matrices";
	Escribir "2. Calcular los intereses por pagar";
	Escribir "3. Presentar acumulados de inversiones";
	Escribir "4. Finalizar";
FinSubAlgoritmo
//Realiza toda la funcionalidad del menu principal, lo despliega y lee la opcion valida
Funcion lvProcesadoValorDeRetorno<-menuPrincipal()
	Definir lvValorIngresado Como Caracter;
	lvValorIngresado <- '';
	Definir lvProcesadoValorDeRetorno Como Entero;
	lvProcesadoValorDeRetorno <- 0;
	Mientras (lvValorIngresado<>'1')Y(lvValorIngresado<>'2')Y(lvValorIngresado<>'3')Y(lvValorIngresado<>'4') Hacer
		desplegarMenuPrincipal();
		Escribir  "Digite la opción requerida (1, 2, 3, 4): ";
		Leer lvValorIngresado;
		Si (lvValorIngresado<>'1')Y(lvValorIngresado<>'2')Y(lvValorIngresado<>'3')Y(lvValorIngresado<>'4') Entonces
			Escribir "ERROR, El valor ingresado [", lvValorIngresado, "] no es válido. Debe ser un valor numérico entre 1 y 4.";
			Escribir "Presione una tecla para continuar";
			Esperar Tecla;
		SiNo
			lvProcesadoValorDeRetorno<-convertirANumero(lvValorIngresado);
		FinSi
	FinMientras
FinFuncion
//---
Proceso InversionesTotales
    Definir CS, CD, opcion Como Entero;
    Definir inversiones, periodicidades, intereses Como Real;
    Definir inicializado, intereses_calculados, lvSalir Como Logico;
    Definir i, j Como Entero;
    // Inicialización de variables
    inicializado <- Falso;
    intereses_calculados <- Falso;
	lvSalir <- Falso;
    // Solicitar y validar la cantidad de sucursales y días
    Repetir
		Escribir "Digite cantidad de sucursales: ";
        Leer CS;
        Si (CS<1)Entonces
			Escribir "ERROR, La cantidad de sucursales debe ser mayor que cero.";
		FinSi
    Hasta Que CS > 0;
    Repetir
        Escribir "Digite cantidad de días: ";
        Leer CD;
        Si (CD<1)Entonces
			Escribir "ERROR, La cantidad de días debe ser mayor que cero.";
		FinSi
    Hasta Que CD > 0;
	
    Dimension inversiones[CS, CD];
    Dimension periodicidades[CS, CD];
    Dimension intereses[CS, CD];
	
    // Menú principal
    Mientras (lvSalir=Falso) Hacer
		opcion <- menuPrincipal();
        //Leer opcion;
		
        Segun opcion Hacer
			1: // Inicializar las matrices
				Limpiar Pantalla;
				Escribir "OPCIÓN 1/INICIALIZAR MATRICES:";
				Para i <- 0 Hasta (CS-1) Hacer
					Para j <- 0 Hasta (CD-1) Hacer
						inversiones[i,j] <- Aleatorio(0, 100);  // Asignar valores a la matriz inversiones
						periodicidades[i,j] <- Aleatorio(1, 4);  // Asignar valores a la matriz periodicidades
						intereses[i,j] <- 0;
					FinPara
				FinPara
				inicializado <- Verdadero;
				intereses_calculados <- Falso;
				Escribir "---";
				Escribir "Cálculo de Matriz de Inversiones acumuladas";
				Para i <- 0 Hasta (CS-1) Hacer
					Escribir "Sucursal ", i;
					Para j <- 0 Hasta (CD-1) Hacer
						Escribir Sin Saltar inversiones[i,j], " ";
					FinPara
					Escribir "";
				FinPara
				Escribir "---";
				Escribir "Cálculo de Matriz de Periodicidades";
				Para i <- 0 Hasta (CS-1) Hacer
					Escribir "Sucursal ", i;
					Para j <- 0 Hasta (CD-1) Hacer
						Escribir Sin Saltar periodicidades[i,j], " ";
					FinPara
					Escribir "";
				FinPara
				Escribir "---";
				Escribir "Cálculo de Matriz de Periodicidades";
				Para i <- 0 Hasta (CS-1) Hacer
					Escribir "Sucursal ", i;
					Para j <- 0 Hasta (CD-1) Hacer
						Escribir Sin Saltar periodicidades[i,j], " ";
					FinPara
					Escribir "";
				FinPara
				Escribir "---";
				Escribir "Presione una tecla para continuar";
				Esperar Tecla;
            2:
                // Calcular los intereses por pagar
				Limpiar Pantalla;
				Escribir "OPCIÓN 2/CALCULAR LOS INGRESOS POR PAGAR:";
                Si No inicializado Entonces
                    Escribir "Error. Debe ejecutar la opción 1 antes de ejecutar esta opción";
                Sino
                    Para i <- 0 Hasta (CS-1) Hacer
                        Para j <- 0 Hasta (CD-1) Hacer
                            Segun periodicidades[i,j] Hacer
                                1:
                                    intereses[i,j] <- inversiones[i,j] * 0.03;
                                2:
                                    intereses[i,j] <- inversiones[i,j] * 0.04;
                                3:
                                    intereses[i,j] <- inversiones[i,j] * 0.05;
                                4:
                                    intereses[i,j] <- inversiones[i,j] * 0.06;
                            FinSegun
                        FinPara
                    FinPara
                    intereses_calculados <- Verdadero;
                    Escribir "Matriz de Intereses por Pagar";
                    Para i <- 0 Hasta (CS-1) Hacer
                        Escribir "Sucursal ", i;
                        Para j <- 0 Hasta (CD-1) Hacer
                            Escribir Sin Saltar intereses[i,j], " ";
                        FinPara
                        Escribir "";
                    FinPara
                FinSi
				Escribir "Presione una tecla para continuar";
				Esperar Tecla;
            3:
				// Presentar acumulados de inversiones
				Limpiar Pantalla;
				Escribir "OPCIÓN 3/PRESENTAR ACUMULADOS DE INVERSIONES:";
				Si No intereses_calculados Entonces
					Escribir "Error. Debe ejecutar la opción 2 antes de ejecutar esta opción";
				Sino
					Escribir "*************************************************";
					Escribir "Inversiones Totales S.A.";
					Escribir "Reporte de Inversiones";
					Escribir "*************************************************";
					// Definición de variables aquí
					Definir acumulado_inversiones, acumulado_intereses Como Real;  
					Para i <- 0 Hasta (CS-1) Hacer
						acumulado_inversiones <- 0;
						acumulado_intereses <- 0;
						Para j <- 0 Hasta (CD-1) Hacer
							acumulado_inversiones <- acumulado_inversiones + inversiones[i,j];
							acumulado_intereses <- acumulado_intereses + intereses[i,j];
						FinPara
						Escribir "Sucursal: ", i, " Monto Inversiones: ", acumulado_inversiones, " Monto Intereses: ", acumulado_intereses;
					FinPara
				FinSi
				Escribir "Presione una tecla para continuar";
				Esperar Tecla;
            4:
                // Finaliza
				lvSalir <- Verdadero;
                Escribir "Saliendo del menú...";
				Escribir "Presione una tecla para continuar";
				Esperar Tecla;
        FinSegun
    FinMientras
FinProceso

