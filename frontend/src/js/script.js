const validRoutes = [
  "/",
  "/index.html",
  "/pages/admin.html",
  "/pages/register.html",
  "/pages/signIn.html",
  "/pages/user.html",
  "/pages/errorPage.html",
];

const currentPath = window.location.pathname;

if (!validRoutes.includes(currentPath)) {
  window.location.replace("/pages/errorPage.html");
}