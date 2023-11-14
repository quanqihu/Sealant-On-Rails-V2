document.addEventListener("submit", function(event) {
    event.preventDefault();
    // console.log("Form Submitted");


    var popupScreening = {}; // Initialize an empty dictionary
    var popupPreventative = {}; // Initialize an empty dictionary
    var popupFollowup = {}; // Initialize an empty dictionary

    function handlePopupSelection(toothNumber, selectedValue, formName) {

        if (formName ==="Screening"){
            popupScreening[toothNumber.toString()] = selectedValue;

        }
        elif(formName ==="Preventative"){
            popupPreventative[toothNumber.toString()] = selectedValue;

        }
        elif(formName ==="Followup")
        {
            popupFollowup[toothNumber.toString()] = selectedValue;
        }


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

      for (var toothNumber = 1; toothNumber <= 32; toothNumber++) {
        var button = document.getElementById('PreventativeButton' + toothNumber);
        var selectedValue = button.innerText.trim();

        if (selectedValue == "Make a Selection")
        {
            selectedValue=""
        }
        handlePopupSelection(toothNumber.toString(), selectedValue);
      }

      for (var toothNumber = 1; toothNumber <= 32; toothNumber++) {
        var button = document.getElementById('FollowupButton' + toothNumber);
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
        var TeethPreventativeStr = JSON.stringify(popupPreventative);
        var TeethFollowupStr = JSON.stringify(popupFollowup);
        var TeethScreeningInput = form.querySelector('[name="child_level_detail[TeethScreening]"]');
        var TeethPreventativeInput = form.querySelector('child_level_detail[TeethPreventative]');
        var TeethFollowupInput = form.querySelector('child_level_detail[TeethFollowup]');
        
        TeethScreeningInput.value = TeethScreeningStr;
        TeethPreventativeInput.value = TeethPreventativeStr;
        TeethFollowupInput.value = TeethFollowupStr;
        form.submit();
    }
});