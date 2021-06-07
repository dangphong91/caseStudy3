<main>
    <div class="container" style="padding: 0; margin: 0">
        <header class="p-3 bg-dark text-white" style="width: 85vw; margin: 0">
            <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start" style="padding-left: 5%">
                <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                    <li><a href="/products" class="nav-link px-2 text-white">Home</a></li>
                    <li><c:if test='${requestScope["user"] == "admin"}'>
                        <a href="products?action=create" class="nav-link px-2 text-white">Add New Product</a>
                    </c:if></li>
                </ul>
                <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" method="get">
                    <input type="search" class="form-control form-control-dark" name="key" placeholder="Search..." aria-label="Search">
                </form>
                <div class="text-end" style="padding-right: 5%">
                    <c:if test='${requestScope["user"] == null}'>
                        <a href="/user/login.jsp" style="text-decoration: none;">
                            <button type="button" class="btn btn-outline-light me-2">Sign-in</button>
                        </a>
                        <a href="/user/logup.jsp" style="text-decoration: none;">
                            <button type="button" class="btn btn-warning">Sign-up</button>
                        </a>
                    </c:if>
                    <c:if test='${requestScope["user"] != null}'>
                        <button type="button" class="btn btn-outline-light me-2">${requestScope["user"]}</button>
                        <c:if test='${requestScope["user"] != "admin"}'>
                            <a style="margin-left: -20px;" href="products?action=showOrder" title="Show Order">
                                <input type="button" class="count" style="width: 20px; font-size: 13px; padding: 0px; margin-right: 5px;" value=${requestScope["count"]}>
                            </a>
                        </c:if>
                        <c:if test='${requestScope["user"] == "admin"}'>
                            <a style="margin-left: -20px;" href="products?action=showPay" title="Show Pay">
                                <input type="button" class="count" style="width: 20px; font-size: 13px; padding: 0px; margin-right: 5px;" value=${requestScope["count"]}>
                            </a>
                        </c:if>
                        <a href="products?action=logout" style="text-decoration: none;">
                            <button type="button" class="btn btn-warning">Sign-out</button>
                        </a>
                    </c:if>
                </div>
            </div>
        </header>
    </div>
</main>