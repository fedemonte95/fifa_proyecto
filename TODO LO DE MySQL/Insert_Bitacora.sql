INSERT INTO proyecto2.bitacora(pj,pg,pe,pp,GF,gc,grupo_idgrupo,equipo_idequipo)
SELECT pj,pg,pe,pp,GF,gc,grupo_idgrupo,equipo_idequipo 
FROM proyecto2.bitacoraporequipo;