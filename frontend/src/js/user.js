const slideBarBtn= document.getElementById('slidebar-btn')
const slideBar = document.getElementById('slideBar')

slideBarBtn.addEventListener("click",()=>{
    slideBar.classList.toggle("-translate-x-full");
});