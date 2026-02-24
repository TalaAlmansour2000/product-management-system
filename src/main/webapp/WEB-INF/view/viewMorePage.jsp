<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Details - ${product.name}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
</head>
<body class="bg-light">
<div class="container py-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <c:if test="${product.productDetails.expired}">

                <div class="alert alert-danger shadow-sm mb-4 border-0 border-start border-5 border-danger d-flex align-items-center">
                    <i class="bi bi-exclamation-triangle-fill fs-3 me-3"></i>
                    <div>
                        <h6 class="mb-0 fw-bold">This product has expired!</h6>
                        <small>Expired on: ${product.productDetails.expirationDate}</small>
                    </div>
                </div>
            </c:if>

            <div class="card shadow border-0 overflow-hidden">
                <div class="card-header bg-dark text-white p-3 d-flex justify-content-between align-items-center">
                    <h5 class="mb-0"><i class="bi bi-info-circle me-2"></i>Product Specifications</h5>
                    <span class="badge bg-secondary">ID #${product.id}</span>
                </div>
                <div class="card-body p-5">
                    <div class="text-center mb-5">
                        <h1 class="display-5 fw-bold text-primary mb-2">${product.name}</h1>
                        <hr class="w-25 mx-auto">
                    </div>

                    <div class="row g-4">
                        <div class="col-md-6">
                            <div class="p-3 border rounded bg-white shadow-sm">
                                <label class="text-muted small fw-bold text-uppercase d-block mb-1">Manufacturer</label>
                                <p class="fs-5 mb-0"><i class="bi bi-building me-2 text-primary"></i>${product.productDetails.manufacturer}</p>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="p-3 border rounded bg-white shadow-sm">
                                <label class="text-muted small fw-bold text-uppercase d-block mb-1">Price</label>
                                <p class="fs-5 mb-0 text-success fw-bold"><i class="bi bi-tag-fill me-2"></i>$${product.productDetails.price}</p>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="p-3 border rounded bg-white shadow-sm">
                                <label class="text-muted small fw-bold text-uppercase d-block mb-1">Expiration Date</label>
<p class="fs-5 mb-0 ${product.productDetails.expired ? 'text-danger fw-bold' : ''}">

                                    <i class="bi bi-calendar-event me-2"></i>${product.productDetails.expirationDate}
                                </p>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="p-3 border rounded bg-white shadow-sm">
                                <label class="text-muted small fw-bold text-uppercase d-block mb-1">Stock Availability</label>
                                <div>
                                    <c:choose>
                                        <c:when test="${product.productDetails.availability}">
                                            <span class="badge bg-success px-3 py-2 fw-normal"><i class="bi bi-check-circle me-1"></i> In Stock</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge bg-danger px-3 py-2 fw-normal"><i class="bi bi-x-circle me-1"></i> Out of Stock</span>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="mt-5 pt-4 border-top d-flex justify-content-between">
                        <a href="${pageContext.request.contextPath}/products/" class="btn btn-outline-dark px-4">
                            <i class="bi bi-arrow-left"></i> Back to Dashboard
                        </a>
                        <a href="${pageContext.request.contextPath}/products/edit?productId=${product.id}" class="btn btn-warning px-4 shadow-sm text-white">
                            <i class="bi bi-pencil-square"></i> Edit Product
                        </a>  </div> </div> </div></div></div>
</div>
</body>
</html>