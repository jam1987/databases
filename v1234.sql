select codbeb
from gusta natural join bebedor
where nombre ='Jose Perez' and
codbeb in (
select codbeb
from  bebida
except 
select codbeb
from gusta natural join bebedor
where nombre='Luis Perez')
order by codbeb