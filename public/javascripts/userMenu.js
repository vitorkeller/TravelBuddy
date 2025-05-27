const btn = document.getElementById('userMenuButton');
const menu = document.getElementById('userMenuDropdown');
document.addEventListener('click', function (e) {
    if (btn && btn.contains(e.target)) { menu.classList.toggle('hidden'); } else if (menu && !menu.contains(e.target)) { menu.classList.add('hidden'); }
});
document.addEventListener('keydown', function (e) { if (e.key === 'Escape' && menu) { menu.classList.add('hidden'); } });
