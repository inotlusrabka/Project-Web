$(document).ready(function() {
    $.ajax({
        url: 'database.php', // Ubah sesuai dengan lokasi skrip PHP Anda
        method: 'GET',
        dataType: 'json',
        success: function(data) {
            var motherboards = data.motherboard;
            var processors = data.processor; 
            var gpus = data.gpu;
            var rams = data.ram;
            var powerSupplies = data.powersupply;
            var cases = data.cases;

            // Populate motherboard dropdown
            motherboards.forEach(function(mb) {
                var optionText = mb.brand + " " + mb.item_name + " | Rp" + mb.price.toLocaleString('id-ID');
                $('#motherboard').append('<option value="' + mb.item_id + '" data-socket="' + mb.socket + '" data-price="' + mb.price + '">' + optionText + '</option>');
            });

            // Populate GPU dropdown
            gpus.forEach(function(gpu) {
                var optionText = gpu.brand + " " + gpu.item_name + " | Rp" + gpu.price.toLocaleString('id-ID');
                $('#gpu').append('<option value="' + gpu.item_id + '" data-price="' + gpu.price + '">' + optionText + '</option>');
            });

            // Populate RAM dropdown
            rams.forEach(function(ram) {
                var optionText = ram.brand + " " + ram.item_name + " | Rp" + ram.price.toLocaleString('id-ID');
                $('#ram').append('<option value="' + ram.item_id + '" data-price="' + ram.price + '">' + optionText + '</option>');
            });

            // Populate CPU dropdown based on selected motherboard
            $('#motherboard').change(function() {
                var selectedSocket = $(this).find('option:selected').data('socket');
                $('#cpu').empty().append('<option value="">Select a CPU</option>');
                if (selectedSocket) {
                    $('#cpu').prop('disabled', false);
                    processors.forEach(function(cpu) {
                        if (cpu.socket === selectedSocket) {
                            var optionText = cpu.brand + " " + cpu.item_name + " | Rp" + cpu.price.toLocaleString('id-ID');
                            $('#cpu').append('<option value="' + cpu.item_id + '" data-price="' + cpu.price + '">' + optionText + '</option>');
                        }
                    });
                } else {
                    $('#cpu').prop('disabled', true);
                }
                calculateTotalPrice();
            });

            // Populate Power Supply dropdown
            powerSupplies.forEach(function(ps) {
                var optionText = ps.model + " | Rp" + ps.price.toLocaleString('id-ID');
                $('#psu').append('<option value="' + ps.item_id + '" data-price="' + ps.price + '">' + optionText + '</option>');
            });

            // Populate Case dropdown
            cases.forEach(function(caseItem) {
                var optionText = caseItem.model + " | Rp" + caseItem.price.toLocaleString('id-ID');
                $('#case').append('<option value="' + caseItem.item_id + '" data-price="' + caseItem.price + '">' + optionText + '</option>');
            });

            // Enable/disable CPU dropdown based on motherboard selection
            $('#motherboard').change();

            // Add change event listeners to all dropdowns to calculate total price
            $('#motherboard, #cpu, #gpu, #ram, #psu, #case').change(function() {
                calculateTotalPrice();
            });

        },
        error: function(xhr, status, error) {
            console.error("AJAX Error: " + status + error);
        }
    });

    function calculateTotalPrice() {
        var totalPrice = 0;
        $('#motherboard, #cpu, #gpu, #ram, #psu, #case').each(function() {
            var price = $(this).find('option:selected').data('price');
            if (price) {
                totalPrice += parseInt(price);
            }
        });
        $('#total-price').text(totalPrice.toLocaleString('id-ID'));
    }
});
