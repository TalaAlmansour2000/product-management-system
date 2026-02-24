<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Products Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
</head>
<body class="bg-light">
<div class="container py-5">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="fw-bold text-dark">Pharmacy management system</h2>
        <a href="${pageContext.request.contextPath}/products/add" class="btn btn-primary shadow-sm">
            <i class="bi bi-plus-circle me-2"></i>New Product
        </a>
    </div>

    <div class="card shadow-sm border-0">
        <div class="table-responsive p-3">
            <table class="table table-hover align-middle"><thead class="table-light">
         <tr><th style="width: 10%">ID</th>
<th style="width: 40%">Product Name</th>
                     <th style="width: 25%">Manufacturer</th>
                     <th class="text-center">Actions</th>
                 </tr>
                </thead>
                <tbody>
                    <c:forEach var="tempProduct" items="${productsList}">
                        <tr>
                     <td class="fw-bold text-primary">#${tempProduct.id}</td>
                                     <td>${tempProduct.name}</td>

                                     <td> <span class="badge bg-light text-dark border"> <i class="bi bi-building me-1"></i> ${tempProduct.productDetails.manufacturer} </span></td>

                            <td class="text-center">
                                <div class="btn-group">
                                    <a href="${pageContext.request.contextPath}/products/${tempProduct.id}"
                                       class="btn btn-sm btn-outline-info mx-1" title="View Details">
                                        <i class="bi bi-eye"></i>
                                    </a>

                                    <a href="${pageContext.request.contextPath}/products/edit?productId=${tempProduct.id}"
                                       class="btn btn-sm btn-outline-warning mx-1" title="Edit">
                                        <i class="bi bi-pencil"></i>
                                    </a>
                                    <form:form action="${pageContext.request.contextPath}/products/deleteProduct" method="POST" style="display:inline;">
                                        <input type="hidden" name="productId" value="${tempProduct.id}" />
                                        <button type="submit" class="btn btn-sm btn-outline-danger mx-1"
                                                onclick="'Delete this item?">
                                            <i class="bi bi-trash"></i>
                                        </button>
                                    </form:form></div> </td>
                        </tr>
                    </c:forEach> </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>