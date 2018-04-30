$(document).ready(function() {
    $('.search_form').submit(function() {
        var first_station_id;
        var last_station_id;

        first_station_id = $(this).find('#first_station_id');
        last_station_id = $(this).find('#last_station_id');

        if (first_station_id.val() == last_station_id.val()) {
            alert('Выберите конечную станцию');
            return false;
        }
    });
});