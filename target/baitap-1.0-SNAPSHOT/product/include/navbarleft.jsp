<nav id="navbarleft" style="position: fixed; overflow: auto; width: 17%; height: 100vh;background: gray; left: -300px; transition: left 1.5s; top: 0;">
  <div>
  <ul style="list-style-type: none; margin: 0; padding: 0; background-color: #f1f1f1;">
    <li><a class="active" href="/products">Home</a></li>
    <li><a href="products?action=sort">
      <c:if test='${requestScope["rank"] != ""}'>
        Ascending Price
      </c:if>
      <c:if test='${requestScope["rank"] == ""}'>
        Descending Price
      </c:if>
    </a></li>
    <li><a href="products?action=showTable">List View</a></li>
    <li><a href="products?action=showDiv">Folder View </a></li>
    <li><c:if test='${requestScope["user"] == "admin"}'>
      <a href="products?action=create">Add New Product</a>
    </c:if></li>
  </ul>
    <div style="margin-top: 55vh">
      <p style="padding-left: 5%; border-radius: 3px; color: #cff4fc; box-shadow: 2px 2px 2px 0px green">Contact: 0932363608</p>
      <p  style="padding-left: 5%; border-radius: 3px; color: #cff4fc; box-shadow: 2px 2px 2px 0px green">Address: 208-Tran Phu</p>
    </div>
  </div>
</nav>