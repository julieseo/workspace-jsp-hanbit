<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>

<%
	request.setCharacterEncoding("UTF-8");

	//MultipartRequest 객체생성및 초기화(request, 저장결로, 파일사이즈, 인코딩, 파일저장방법, 파일이름이 똑같을때 이름에+1해줌)
	MultipartRequest multi = new MultipartRequest(request, "E:\\upload", 5 * 1024 * 1024, "utf-8",	new DefaultFileRenamePolicy());
           
	String productId = multi.getParameter("productId");
	String name = multi.getParameter("name");
	String unitPrice = multi.getParameter("unitPrice");
	String description = multi.getParameter("description");
	String manufacturer = multi.getParameter("manufacturer");
	String category = multi.getParameter("category");
	String unitsInStock = multi.getParameter("unitsInStock");
	String condition = multi.getParameter("condition");

	Integer price;

	if (unitPrice.isEmpty())
		price = 0;
	else
		price = Integer.valueOf(unitPrice);

	long stock;

	if (unitsInStock.isEmpty())
		stock = 0;
	else
		stock = Long.valueOf(unitsInStock);
	
	//파일의 이름을 가져온다.
	String filename = multi.getFilesystemName("productImage");
	
	ProductRepository dao = ProductRepository.getInstance();

	Product newProduct = new Product();
	newProduct.setProductId(productId);
	newProduct.setPname(name);
	newProduct.setUnitPrice(price);
	newProduct.setDescription(description);
	newProduct.setManufacturer(manufacturer);
	newProduct.setCategory(category);
	newProduct.setUnitsInStock(stock);
	newProduct.setCondition(condition);
	newProduct.setFilename(filename); //저장된 이미지의 파일 이름을 저장

	dao.addProduct(newProduct);

	response.sendRedirect("products.jsp");
%>
