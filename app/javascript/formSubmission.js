document.addEventListener("submit", function(event) {
    event.preventDefault();
    // console.log("Form Submitted");


    var popupScreening = {}; // Initialize an empty dictionary

    function handlePopupSelection(toothNumber, selectedValue) {

        popupScreening[toothNumber.toString()] = selectedValue;
    //   console.log(popupData); // Optional: Log the dictionary to the console
    }


    for (var toothNumber = 1; toothNumber <= 32; toothNumber++) {
        var button = document.getElementById('ScreeningButton' + toothNumber);
        var selectedValue = button.innerText.trim();

        if (selectedValue == "Make a Selection")
        {
            selectedValue=""
        }
        handlePopupSelection(toothNumber.toString(), selectedValue);
      }


    if (event.submitter && event.submitter.id === "submitButton") {
        var form = event.target;

        // Set the value of TeethScreening using your existing logic
        var TeethScreeningStr = JSON.stringify(popupScreening);
        var TeethScreeningInput = form.querySelector('[name="child_level_detail[TeethScreening]"]');
        TeethScreeningInput.value = TeethScreeningStr;

        form.submit();
    }
});