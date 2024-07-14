SubAlgoritmo primeraOpcion (Real inversiones Por Referencia, Real periodicidades Por Referencia, Real intereses Por Referencia, Entero CS Por Valor, Entero CD Por Valor, Logico inicializado Por Referencia, Logico intereses_calculados Por Referencia)
	Definir i, j Como Entero;
	// Inicializar las matrices
	Para i <- 0 Hasta (CS-1) Hacer
		Para j <- 0 Hasta (CD-1) Hacer
			inversiones[i,j] <- Aleatorio(0, 100);  // Asignar valores a la matriz inversiones
			periodicidades[i,j] <- Aleatorio(1, 4);  // Asignar valores a la matriz periodicidades
			intereses[i,j] <- 0;
		FinPara
	FinPara
	inicializado <- Verdadero;
	intereses_calculados <- Falso;
	Escribir "Calculo de Matriz de Inversiones acumuladas";
	Para i <- 0 Hasta (CS-1) Hacer
		Escribir "Sucursal ", i;
		Para j <- 0 Hasta (CD-1) Hacer
			Escribir Sin Saltar inversiones[i,j], " ";
		FinPara
		Escribir "";
	FinPara
	
	Escribir "Calculo de Matriz de Periodicidades";
	Para i <- 0 Hasta (CS-1) Hacer
		Escribir "Sucursal ", i;
		Para j <- 0 Hasta (CD-1) Hacer
			Escribir Sin Saltar periodicidades[i,j], " ";
		FinPara
		Escribir "";
	FinPara
	
	Escribir "Calculo de Matriz de Periodicidades";
	Para i <- 0 Hasta (CS-1) Hacer
		Escribir "Sucursal ", i;
		Para j <- 0 Hasta (CD-1) Hacer
			Escribir Sin Saltar periodicidades[i,j], " ";
		FinPara
		Escribir "";
	FinPara

FinSubAlgoritmo

Proceso InversionesTotales
    Definir CS, CD, opcion Como Entero;
    Definir inversiones, periodicidades, intereses Como Real;
    Definir inicializado, intereses_calculados Como Logico;
    Definir i, j Como Entero;
	
    // Inicialización de variables
    inicializado <- Falso;
    intereses_calculados <- Falso;
	
    // Solicitar y validar la cantidad de sucursales y días
    Repetir
        Escribir "Digite cantidad de sucursales: ";
        Leer CS;
    Hasta Que CS > 0;
	
    Repetir
        Escribir "Digite cantidad de días: ";
        Leer CD;
    Hasta Que CD > 0;
	
    Dimension inversiones[CS, CD];
    Dimension periodicidades[CS, CD];
    Dimension intereses[CS, CD];
	
    // Menú principal
    Mientras Verdadero Hacer
        Escribir "Menú de sumatoria de una matriz";
        Escribir "1. Inicializar las matrices";
        Escribir "2. Calcular los intereses por pagar";
        Escribir "3. Presentar acumulados de inversiones";
        Escribir "4. Finalizar";
        Leer opcion;
		
        Segun opcion Hacer
			1: //primeraOpcion ("inversiones", "periodicidades", "intereses");
				primeraOpcion  (inversiones, periodicidades, intereses, CS, CD, inicializado, intereses_calculados);
				// Inicializar las matrices
				Para i <- 0 Hasta (CS-1) Hacer
					Para j <- 0 Hasta (CD-1) Hacer
						inversiones[i,j] <- Aleatorio(0, 100);  // Asignar valores a la matriz inversiones
						periodicidades[i,j] <- Aleatorio(1, 4);  // Asignar valores a la matriz periodicidades
						intereses[i,j] <- 0;
					FinPara
				FinPara
				inicializado <- Verdadero;
				intereses_calculados <- Falso;
				Escribir "Calculo de Matriz de Inversiones acumuladas";
				Para i <- 0 Hasta (CS-1) Hacer
					Escribir "Sucursal ", i;
					Para j <- 0 Hasta (CD-1) Hacer
						Escribir Sin Saltar inversiones[i,j], " ";
					FinPara
					Escribir "";
				FinPara
				
				Escribir "Calculo de Matriz de Periodicidades";
				Para i <- 0 Hasta (CS-1) Hacer
					Escribir "Sucursal ", i;
					Para j <- 0 Hasta (CD-1) Hacer
						Escribir Sin Saltar periodicidades[i,j], " ";
					FinPara
					Escribir "";
				FinPara
				
				Escribir "Calculo de Matriz de Periodicidades";
				Para i <- 0 Hasta (CS-1) Hacer
					Escribir "Sucursal ", i;
					Para j <- 0 Hasta (CD-1) Hacer
						Escribir Sin Saltar periodicidades[i,j], " ";
					FinPara
					Escribir "";
				FinPara
            2:
                // Calcular los intereses por pagar
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
            3:
				// Presentar acumulados de inversiones
				Si No intereses_calculados Entonces
					Escribir "Error. Debe ejecutar la opción 2 antes de ejecutar esta opción";
				Sino
					Escribir "*************************************************";
					Escribir "Inversiones Totales S.A.";
					Escribir "Reporte de Inversiones";
					Escribir "*************************************************";
					Para i <- 0 Hasta (CS-1) Hacer
						// Definición de variables aquí
						Definir acumulado_inversiones, acumulado_intereses Como Reales;  
						acumulado_inversiones <- 0;
						acumulado_intereses <- 0;
						Para j <- 0 Hasta (CD-1) Hacer
							acumulado_inversiones <- acumulado_inversiones + inversiones[i,j];
							acumulado_intereses <- acumulado_intereses + intereses[i,j];
						FinPara
						Escribir "Sucursal: ", i, " Monto Inversiones: ", acumulado_inversiones, " Monto Intereses: ", acumulado_intereses;
					FinPara
				FinSi
				
            4:
                // Finaliza
                Escribir "Saliendo del menú";
				
        FinSegun
    FinMientras
FinProceso

