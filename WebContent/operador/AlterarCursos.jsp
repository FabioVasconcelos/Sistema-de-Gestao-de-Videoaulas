<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@page import="java.util.List"%>
<%@page import="Modelo.Curso"%>
<%@page import="Modelo.Categoria"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
 <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/screen.css" type="text/css" media="screen, projection">
 <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/forms.css" type="text/css" media="screen, projection">
</head>
<body>
  <div class="container">
   
    
     <div class="span-24 last">
     
     	    <img src="<%=request.getContextPath()%>/resources/img/logo_eletrofabio2012.jpg"/>	
     </div>
      <hr>
      <div class="span-4 " style="background-color: #F4F4F4">
       <%@ include file="/resources/template/lateral.jsp"%>
      </div>

      <div class="span-18 last">
      
       		<% 
				List<String> erros = (List<String>) request.getAttribute("erros");
				if (erros!=null && !erros.isEmpty()) {
					out.write("Erros:<ul>");
					for (String x:erros) {
						out.write("<li>"+x+"</li>");
					}
					out.write("</ul>");
				}
			%>
		
		
		<%
		
		
		Curso curso = (Curso) request.getAttribute("AlteraCursos");
		if (curso == null) {
		%>
		<p>Erro ao buscar o curso no banco de dados.</p>
		<%
		}
		else {
		
		
			
		%>
         <form action="<%=request.getContextPath()%>/operador/GerirCursos?cmd=alterar" method="post">
    <fieldset>
     <legend>Alterar Cursos</legend>
     

		<table>
		
		
				<tr>	
			 <td>
			   C�digo:
			
             </td>
                    <td>                    
                    
                    <input type="text" name="idCurso" id="idCurso" value="<%=curso.getIdCurso() %>"/>
                                        
                    </td>
            
           </tr>	
		
		
		
			<tr>	
			 <td>
			   Nome:
			
             </td>
                    <td>                    
                    
                    <input type="text" name="nome" id="nome" value="<%=curso.getNome() %>"/>
                                        
                    </td>
            
           </tr>
				 			
			
		<tr>
			<td>
				Descri��o:
			
		  </td>
            <td>
            
            <textarea name="descricao" id="descricao" style="width:300px; height:150px; resize:none">
            <%=curso.getDescricao() %>  
            </textarea> 
            </td>
		 </tr>
	 <tr>	
			<td>
			   Pre�o:
			
		   </td>
            
            <td><input type="text" name="preco" id="preco" value="<%=curso.getPreco()%>"/>
            </td>
         </tr>
		 <tr>	

		 <tr>	
			<td>
			   Dura��o:
			
		   </td>
            
            <td><input type="text" name="duracao" id="duracao" value="<%=curso.getDuracao()%>"/>
            </td>
         </tr>
		 
		 <tr>		 
			 <tr>	
			<td>
			   Imagem:
			
		   </td>
            
            <td><input type="text" name="nomeImagem" id="nomeImagem" value="<%=curso.getImgUrl()%>"/>
            </td>
         </tr>
         
     	 <tr>		 			
            
           <td><select name="categoria">
              <option value="0">Escolha aqui:</option>
							<%
								List<Categoria> lista = (List<Categoria>) request.getAttribute("categoriaList");
								for (Categoria x : lista) {
									out.write("<option value=\"" + x.getIdCategoria() + "\">");
									out.write(x.getDescricao() + "</option>");
								}
				             %>
				             </select>
			</td>

         </tr>			
				
				
         			
   
		 	 
		 	 <tr>
		 	  <td><input type="submit" name="btInserir" value="Inserir" /></td>
		 	
		 	
		 	 </tr>
		 	 
 
		 	 
		</table>
        </fieldset>
	</form>
	
	<%
		}
	
	%>
	
	
      </div>
      
      
  
      <hr>
      <hr class="space">
      


</div>
</body>
</html>