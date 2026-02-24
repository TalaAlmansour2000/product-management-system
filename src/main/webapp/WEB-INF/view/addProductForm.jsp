<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Product Form</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container py-5">
    <div class="row justify-content-center">
        <div class="col-md-7">
            <div class="card shadow border-0">
                <div class="card-header bg-primary text-white p-3"><h5 class="mb-0">${productModel.id == 0 ? 'Add New Product' : 'Update Existing Product'}</h5>
                </div>
                <div class="card-body p-4">
                    <form:form action="${pageContext.request.contextPath}/products/${productModel.id == 0 ? 'save' : 'update'}"
                               modelAttribute="productModel" method="POST" class="row g-3">

                        <form:hidden path="id" />
                        <form:hidden path="productDetails.id" />

                        <div class="col-md-12">
                            <label class="form-label fw-bold">Product Name</label>
                            <form:input path="name" class="form-control" required="true" />
                        </div>
                        <div class="col-md-6"> <label class="form-label fw-bold">Manufacturer</label>
                            <form:select path="productDetails.manufacturer" class="form-select" required="true"> <form:option value="" label="-- Choose --" />
                                <form:options items="${manufacturers}" />
                            </form:select>
                        </div>

                        <div class="col-md-6">
                            <label class="form-label fw-bold">Price ($)</label>
                            <form:input path="productDetails.price" type="number" step="0.01" class="form-control" required="true" />
                        </div>

                        <div class="col-md-6">
                            <label class="form-label fw-bold">Expiration Date</label>
                            <form:input path="productDetails.expirationDate" type="date" class="form-control" />
                        </div>

                        <div class="col-md-6">
                            <label class="form-label fw-bold">Availability</label>
                            <form:select path="productDetails.availability" class="form-select">
                                <form:option value="true">Available</form:option>
                                <form:option value="false">Out of Stock</form:option>
                            </form:select>
                        </div>

                        <div class="col-12 mt-4 text-end"> <a href="${pageContext.request.contextPath}/products/" class="btn btn-light border me-2">Cancel</a> <button type="submit" class="btn btn-primary px-4 shadow-sm">Save Product</button>
                        </div>
                    </form:form> </div> </div></div></div>
</div>
</body>
</html>