import "@hotwired/turbo-rails"
import "controllers"
import "jquery"
import "jquery_ujs"
import "popper"
import "bootstrap"
import "flatpickr"


//= require flatpickr


// document.addEventListener('DOMContentLoaded', function () {
//
//     flatpickr("#production_time", {
//         enableTime: true,
//         noCalendar: true,
//         dateFormat: "H:i",
//         time_24hr: true
//     });
//
//     flatpickr("#gel_time", {
//         enableTime: true,
//         noCalendar: true,
//         dateFormat: "H:i",
//         minuteIncrement : 1,
//         time_24hr: true
//     });
//
//     flatpickr("#cloudy_time", {
//         enableTime: true,
//         noCalendar: true,
//         dateFormat: "H:i",
//         minuteIncrement : 1,
//         time_24hr: true
//     });
// });


document.addEventListener("DOMContentLoaded", function () {
    document.querySelectorAll('[data-action="print-pallet"]').forEach(function (element) {
        element.addEventListener("click", function (event) {
            event.preventDefault();  // Prevent the default link action
            const printUrl = this.getAttribute("data-url");  // Get the print URL from the data attribute
            const printWindow = window.open(printUrl, "_blank");  // Open the print view in a new tab

            printWindow.onload = function () {
                printWindow.print();
                printWindow.onafterprint = function () {
                    printWindow.close();
                };
            };
        });
    });
});


