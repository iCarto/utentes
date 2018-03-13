
psql -h localhost -d $1 -U postgres -c "
delete from inventario.acuiferos;
delete from inventario.acuiferos_imagenes;
delete from inventario.analise;
delete from inventario.barragens;
delete from inventario.barragens_imagenes;
delete from inventario.dados_hidrometricos;
delete from inventario.dados_pluviometricos;
delete from inventario.estacoes;
delete from inventario.estacoes_imagenes;
delete from inventario.exploracoes;
delete from inventario.fontes;
delete from inventario.fontes_imagenes;
delete from inventario.quantidade_agua;
insert into inventario.version (version) VALUES ('$2');
"
