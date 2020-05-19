(function() {
    form = document.querySelector('#sectionForm');               
    checkboxes = form.querySelectorAll('input[type=checkbox]');     
    checkboxLength = checkboxes.length;
    firstCheckbox = checkboxLength > 0 ? checkboxes[0] : null;

    function init() {
        if (firstCheckbox) {
            for (let i = 0; i < checkboxLength; i++) {
                checkboxes[i].addEventListener('change', checkValidity);
            }
            checkValidity();
        }
    }

    function isChecked() { 
        for (let i = 0; i < checkboxLength; i++) {
            if (checkboxes[i].checked) return true;
        }
        return false;
    }

    function checkValidity() {
        errorMessage = !isChecked() ? 'At least one checkbox must be selected!' : '';
        firstCheckbox.setCustomValidity(errorMessage);
    }
    init();
})();