package com.registro.usuarios.servicio;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.registro.usuarios.interfaceService.IproductoService;
import com.registro.usuarios.modelo.Producto;

public class ProductoServicio {
	
	
	@Autowired
	private IproductoService service;
	
	
	
	public List<Producto> mostrarVideojuegos(){
		return service.mostrarPalas();	
	}
	
	public List<Producto> mostrarAccesorios(){
		return service.mostrarPaleteros();	
	}
	
	
}
