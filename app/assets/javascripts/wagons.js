$(document).ready(function() {
    var href = $('#wagon_type_button');
    var old = href.attr('href');
    href.attr('href', old + 'EconomyWagon');
    $('#select_wagon_type').change(function() {
        href.attr('href', old + this.value)
    });
});