function formatRupiah(number) {
    return 'Rp' + number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
}

$(document).ready(function() {
    $.ajax({
        url: 'database.php',
        method: 'GET',
        dataType: 'json',
        success: function(data) {
            var motherboards = data.motherboard;
            var processors = data.processor;
            var gpus = data.gpu;
            var rams = data.ram;

            // Populate motherboard dropdown
            motherboards.forEach(function(mb) {
                var optionText = mb.item_name + " | " + formatRupiah(mb.price);
                $('#motherboard').append('<option value="' + mb.item_id + '" data-socket="' + mb.socket + '">' + optionText + '</option>');
            });

            // Populate GPU dropdown
            gpus.forEach(function(gpu) {
                var optionText = gpu.item_name + " | " + formatRupiah(gpu.price);
                $('#gpu').append('<option value="' + gpu.item_id + '">' + optionText + '</option>');
            });

            // Populate RAM dropdown
            rams.forEach(function(ram) {
                var optionText = ram.item_name + " | " + formatRupiah(ram.price);
                $('#ram').append('<option value="' + ram.item_id + '">' + optionText + '</option>');
            });

            // Update CPU dropdown based on selected motherboard
            $('#motherboard').change(function() {
                var selectedSocket = $(this).find('option:selected').data('socket');
                $('#cpu').empty().append('<option value="">Select a CPU</option>');
                if (selectedSocket) {
                    $('#cpu').prop('disabled', false);
                    processors.forEach(function(cpu) {
                        if (cpu.socket === selectedSocket) {
                            var optionText = cpu.item_name + " | " + formatRupiah(cpu.price);
                            $('#cpu').append('<option value="' + cpu.item_id + '">' + optionText + '</option>');
                        }
                    });
                } else {
                    $('#cpu').prop('disabled', true);
                }
            });
        },
        error: function(xhr, status, error) {
            console.error("AJAX Error: " + status + error);
        }
    });
});