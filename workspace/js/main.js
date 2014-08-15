if (window.location.hash.length > 0) {
    $('ul.nav-pills > li > a[href="' + window.location.hash + '"]').tab('show');
} else {
    $('ul.nav-pills > li > a:first').tab('show');
}