SELECT DISTINCT 
    CAR_T1548_CAUSAL_DETALLE,
    DESCRIPCION_CAUSAL,
    'ENERGIA' SERVICIO  
FROM 
    CAR_T1548_RECLAMACIONES_ENE, PQR_CAUSAL_ENE  
WHERE 
    CAR_T1548_CAUSAL_DETALLE = IDENTIFICADOR_CAUSAL 
    AND CAR_CARG_ANO = :ANIO_ARG 
    AND (IDENTIFICADOR_EMPRESA = :EMPRESA_ARG OR 0 = :EMPRESA_ARG) 
    AND ( CAR_CARG_PERIODO = :PERIODO_ARG OR :PERIODO_ARG = 0 ) 
    AND ( 'ENERGIA' = :SERVICIO_ARG OR 'TODOS' = :SERVICIO_ARG ) 
    GROUP BY CAR_CARG_ANO, CAR_CARG_PERIODO, CAR_T1548_CAUSAL_DETALLE, DESCRIPCION_CAUSAL, IDENTIFICADOR_EMPRESA 
UNION 
SELECT DISTINCT 
    CAR_T1552_CAUSAL_DETALLE,
    'GAS'||TO_CHAR(CAR_T1552_CAUSAL_DETALLE) AS DESCRIPCION_CAUSAL,
    'GAS' SERVICIO 
FROM 
    CAR_T1552_RECLAMACIONES_GAS  
WHERE 
    CAR_CARG_ANO = :ANIO_ARG 
    AND (IDENTIFICADOR_EMPRESA = :EMPRESA_ARG OR 0 = :EMPRESA_ARG) 
    AND ( CAR_CARG_PERIODO = :PERIODO_ARG OR :PERIODO_ARG = 0 ) 
    AND ( 'GAS' = :SERVICIO_ARG OR 'TODOS' = :SERVICIO_ARG ) 
    GROUP BY CAR_CARG_ANO, CAR_CARG_PERIODO, CAR_T1552_CAUSAL_DETALLE, IDENTIFICADOR_EMPRESA 
UNION 
SELECT DISTINCT 
    CAR_T1554_CAUSAL_DETALLE,
    'GLP'||TO_CHAR(CAR_T1554_CAUSAL_DETALLE) AS DESCRIPCION_CAUSAL,
    'GLP' SERVICIO 
FROM 
    CAR_T1554_RECLAMACIONES_GLP  
WHERE 
    CAR_CARG_ANO = :ANIO_ARG 
    AND (IDENTIFICADOR_EMPRESA = :EMPRESA_ARG OR 0 = :EMPRESA_ARG) 
    AND ( CAR_CARG_PERIODO = :PERIODO_ARG OR :PERIODO_ARG = 0 ) 
    AND ( 'GLP' = :SERVICIO_ARG OR 'TODOS' = :SERVICIO_ARG ) 
    GROUP BY CAR_CARG_ANO, CAR_CARG_PERIODO, CAR_T1554_CAUSAL_DETALLE, IDENTIFICADOR_EMPRESA 
ORDER BY SERVICIO, DESCRIPCION_CAUSAL ASC