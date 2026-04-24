const validRoutes = ["/", "/index.html"];

if (!validRoutes.includes(window.location.pathname)) {
  window.location.href = "/pages/errorPage.html";
}

