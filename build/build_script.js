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
            var powerSupplies = data.powersupply;
            var cases = data.cases;

            // Populate motherboard dropdown
            motherboards.forEach(function(mb) {
                var optionText = mb.brand + " " + mb.item_name + " (" + mb.socket + ") | Rp" + mb.price.toLocaleString('id-ID');
                $('#motherboard').append('<option value="' + mb.item_id + '" data-socket="' + mb.socket + '" data-price="' + mb.price + '" data-img="' + mb.image_url + '" data-power="' + mb.power_usage + '" data-type="' + mb.type + '">' + optionText + '</option>');
            });

            // Populate GPU dropdown
            gpus.forEach(function(gpu) {
                var optionText = gpu.brand + " " + gpu.item_name + " | Rp" + gpu.price.toLocaleString('id-ID');
                $('#gpu').append('<option value="' + gpu.item_id + '" data-price="' + gpu.price + '" data-img="' + gpu.image_url + '" data-power="' + gpu.power_usage + '">' + optionText + '</option>');
            });

            // Populate RAM dropdown
            rams.forEach(function(ram) {
                var optionText = ram.brand + " " + ram.item_name + " (" + ram.type + ") | Rp" + ram.price.toLocaleString('id-ID');
                $('#ram').append('<option value="' + ram.item_id + '" data-price="' + ram.price + '" data-img="' + ram.image_url + '" data-power="' + ram.power_usage + '">' + optionText + '</option>');
            });

            // Populate CPU dropdown based on selected motherboard
            $('#motherboard').change(function() {
                var selectedSocket = $(this).find('option:selected').data('socket');
                var selectedImg = $(this).find('option:selected').data('img');
                var selectedType = $(this).find('option:selected').data('type');
                $('#motherboard-img').attr('src', selectedImg).show();

                $('#cpu').empty().append('<option value="">Select a CPU</option>');
                if (selectedSocket) {
                    $('#cpu').prop('disabled', false);
                    processors.forEach(function(cpu) {
                        if (cpu.socket === selectedSocket) {
                            var optionText = cpu.brand + " " + cpu.item_name + " (" + cpu.socket + ") | Rp" + cpu.price.toLocaleString('id-ID');
                            $('#cpu').append('<option value="' + cpu.item_id + '" data-price="' + cpu.price + '" data-img="' + cpu.image_url + '" data-power="' + cpu.power_usage + '">' + optionText + '</option>');
                        }
                    });
                } else {
                    $('#cpu').prop('disabled', true);
                    $('#cpu-img').hide();
                }
                updateCaseDropdown(selectedType);
                calculateTotalPrice();
            });

            // Populate Power Supply dropdown
            powerSupplies.forEach(function(ps) {
                var optionText = ps.model + " | Rp" + ps.price.toLocaleString('id-ID');
                $('#psu').append('<option value="' + ps.id + '" data-price="' + ps.price + '" data-img="' + ps.image_url + '" data-power_watt="' + ps.wattage + '">' + optionText + '</option>');
            });

            // Populate Case dropdown
            function updateCaseDropdown(motherboardType) {
                $('#case').empty().append('<option value="">Select a Case</option>');
                cases.forEach(function(caseItem) {
                    var optionText = caseItem.model + " (" + caseItem.type + ") | Rp" + caseItem.price.toLocaleString('id-ID');
                    if (motherboardType === 'ATX' && (caseItem.type === 'Mid Tower' || caseItem.type === 'Full Tower')) {
                        $('#case').append('<option value="' + caseItem.id + '" data-price="' + caseItem.price + '" data-img="' + caseItem.image_url + '">' + optionText + '</option>');
                    } else if (motherboardType === 'Micro ATX' && (caseItem.type === 'MicroATX' || caseItem.type === 'Mid Tower' || caseItem.type === 'Full Tower')) {
                        $('#case').append('<option value="' + caseItem.id + '" data-price="' + caseItem.price + '" data-img="' + caseItem.image_url + '">' + optionText + '</option>');
                    }
                });
            }

            // Enable/disable CPU dropdown based on motherboard selection
            $('#motherboard').change(function() {
                calculateTotalPower();
            });

            // Add change event listeners to all dropdowns to calculate total price and show images
            $('#motherboard, #cpu, #gpu, #ram, #psu, #case').change(function() {
                var selectedImg = $(this).find('option:selected').data('img');
                var imgId = $(this).attr('id') + '-img';
                if (selectedImg) {
                    $('#' + imgId).attr('src', selectedImg).show();
                } else {
                    $('#' + imgId).hide();
                }
                calculateTotalPower();
                calculateTotalPrice();
            });
        },
        error: function(xhr, status, error) {
            console.error("AJAX Error: " + status + error);
        }
    });

    function checkPowerSupply(totalPower) {
        var selectedPSUWattage = $('#psu').find('option:selected').data('power_watt');
        if (selectedPSUWattage && totalPower > selectedPSUWattage) {
            // Handle insufficient power supply
            $('#power-warning').text('Warning: Selected PSU may not provide sufficient power!');
        } else {
            $('#power-warning').text('');
        }
    }
    
    function calculateTotalPower() {
        var totalPower = 0;
        $('#motherboard, #cpu, #gpu, #ram').each(function() {
            var selectedOption = $(this).find('option:selected');
            var power = selectedOption.data('power');
            if (power) {
                totalPower += parseInt(power);
            }
        });
        $('#total-power').text(totalPower + ' W');
        checkPowerSupply(totalPower);
    }

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
