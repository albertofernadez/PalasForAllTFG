package com.registro.usuarios.interfaceService;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.registro.usuarios.modelo.Producto;

public interface IproductoService extends JpaRepository<Producto, Integer> {
	
	@Query(value="SELECT * FROM Producto p WHERE p.descatalogado = 0", nativeQuery=true)
	List<Producto> listar();

	@Query(value="SELECT * FROM Producto p WHERE p.descatalogado = 0",
			nativeQuery=true)
	Page<Producto> listarr(Pageable pageable);
	
	
	@Query(value="SELECT * FROM Producto p WHERE p.categoria_id_categoria = 1 AND p.descatalogado = 0", nativeQuery=true)
	List<Producto> mostrarPalas();

	@Query(value="SELECT * FROM Producto p WHERE p.categoria_id_categoria = 1 AND p.descatalogado = 0",
			nativeQuery=true)
	Page<Producto> mostrarPalass(Pageable pageable);
	
	@Query(value="SELECT * FROM Producto p WHERE p.categoria_id_categoria = 2 AND p.descatalogado = 0", nativeQuery=true)
	List<Producto> mostrarPaleteros();

	@Query(value="SELECT * FROM Producto p WHERE p.categoria_id_categoria = 2 AND p.descatalogado = 0",
			nativeQuery=true)
	Page<Producto> mostrarPaleteross(Pageable pageable);
	

	
	
	
	@Query(value="SELECT * FROM Producto p WHERE p.plataforma_id_plataforma = 1 AND p.descatalogado = 0", nativeQuery=true)
	List<Producto> mostrarAdidas();

	@Query(value="SELECT * FROM Producto p WHERE p.plataforma_id_plataforma = 1 AND p.categoria_id_categoria = 1 AND p.descatalogado = 0",
			nativeQuery=true)
	Page<Producto> mostrarAdidass(Pageable pageable);

	@Query(value="SELECT * FROM Producto p WHERE p.plataforma_id_plataforma = 3 AND p.categoria_id_categoria = 1 AND p.descatalogado = 0",
			nativeQuery=true)
	Page<Producto> mostrarBullpadell(Pageable pageable);
	
	@Query(value="SELECT * FROM Producto p WHERE p.plataforma_id_plataforma = 3 AND p.descatalogado = 0", nativeQuery=true)
	List<Producto> mostrarBullpadel();
	
	@Query(value="SELECT * FROM Producto p WHERE p.plataforma_id_plataforma = 2 AND p.descatalogado = 0", nativeQuery=true)
	List<Producto> mostrarBabolat();

	@Query(value="SELECT * FROM Producto p WHERE p.plataforma_id_plataforma = 2 AND p.categoria_id_categoria = 1 AND p.descatalogado = 0",
			nativeQuery=true)
	Page<Producto> mostrarBabolatt(Pageable pageable);
	
	@Query(value="SELECT * FROM Producto p WHERE p.plataforma_id_plataforma = 4 AND p.descatalogado = 0", nativeQuery=true)
	List<Producto> mostrarDropshot();

	@Query(value="SELECT * FROM Producto p WHERE p.plataforma_id_plataforma = 4 AND p.categoria_id_categoria = 1 AND p.descatalogado = 0",
			nativeQuery=true)
	Page<Producto> mostrarDropshott(Pageable pageable);
	
	@Query(value="SELECT * FROM Producto p WHERE p.plataforma_id_plataforma = 5 AND p.descatalogado = 0", nativeQuery=true)
	List<Producto> mostrarNox();

	@Query(value="SELECT * FROM Producto p WHERE p.plataforma_id_plataforma = 5 AND p.categoria_id_categoria = 1 AND  p.descatalogado = 0",
			nativeQuery=true)
	Page<Producto> mostrarNoxx(Pageable pageable);
	
	
	
	
	
	
	@Query(value="SELECT * FROM Producto p WHERE p.descatalogado = 1", nativeQuery=true)
	List<Producto> mostrarDescatalogado();

	@Query(value="SELECT * FROM Producto p WHERE p.descatalogado = 1",
			nativeQuery=true)
	Page<Producto> mostrarDescatalogadoo(Pageable pageable);
	
	@Query(value="SELECT nombre FROM Categoria c WHERE c.id_categoria LIKE %:id_categoria%", nativeQuery=true)
	String  getNombreCategoria(@Param("id_categoria") Integer id_categoria);
	
	@Query(value="SELECT nombre FROM Plataforma p WHERE p.id_plataforma LIKE %:id_plataforma%", nativeQuery=true)
	String  getNombrePlataforma(@Param("id_plataforma") Integer id_plataforma);
}
