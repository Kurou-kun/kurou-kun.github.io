//	Content Script
var url = 'page.html';
var el = document.getElementById('main-content');
el.src = url; // assign url to src property
window.frames['main-content'].location = url;
window.frames['main-content'].location.replace(url);