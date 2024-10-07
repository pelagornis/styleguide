window.addEventListener('scroll', function() {
    const footer = document.querySelector('.footer');
    const dock = this.document.querySelector('.dock');
    const footerHeight = footer.offsetHeight;
    const dockHeight = dock.offsetHeight;
    const contentHeight = document.body.scrollHeight;
    const scrollPosition = window.scrollY + window.innerHeight;
  
    if (scrollPosition >= contentHeight - footerHeight - dockHeight) {
        dock.style.position = 'relative';
    } else {
        dock.style.position = 'fixed';
    }
});
