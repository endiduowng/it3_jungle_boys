var desc = new Array(10)

desc[1] = "Pathetic";
desc[2] = "Dreadful";
desc[3] = "Poor";
desc[4] = "Decent";
desc[5] = "Mediocre";
desc[6] = "Fair";
desc[7] = "Good";
desc[8] = "Very\x20Good";
desc[9] = "Great";
desc[10] = "Outstanding";


function setScore (area, score) {
    document.getElementById('frmreview_' + area + '_score').value     = score;
    document.getElementById('review_' + area + '_scoreval').innerText = score;
    document.getElementById('review_' + area + '_desc').innerText     = desc[score];
}

function changeScoreVal (area, thetext) {

    document.getElementById('review_' + area + '_scoreval').innerText = thetext;
    //document.getElementById('frmreview_' + area + '_score').value = thetext;
    document.getElementById('review_' + area + '_scoreval').className = 'review_score_over';
    document.getElementById('review_' + area + '_desc').innerText     = desc[thetext];
}

function outScore (area, theid) {
    document.getElementById('review_' + area + '_score_' + theid).className = 'review_scoreoff';

    if (document.getElementById('frmreview_' + area + '_score').value == '') {
        changeScoreVal(area, 'Select a score to the right');
        document.getElementById('review_' + area + '_scoreval').className = 'review_score';
        document.getElementById('review_' + area + '_desc').innerHTML     = '';
    }
    else {
        document.getElementById('review_' + area + '_scoreval').className = 'review_score_over';
        document.getElementById('review_' + area + '_desc').innerText     = desc[document.getElementById('frmreview_' + area + '_score').value];
        document.getElementById('review_' + area + '_scoreval').innerText = document.getElementById('frmreview_' + area + '_score').value;
    }

}

function overScore (area, theid) {
    document.getElementById('review_' + area + '_score_' + theid).className = 'review_scoreon';
    changeScoreVal(area, theid);
}

function setSeenAll (inVal) {
    document.getElementById("seeneps").value = inVal;
}

function checkValid (typeVal) {
    a = true;
    if (document.getElementById('frmreview_overall_score').value == '') {
        a = false;
        errorVal = 'Select an Overall score';
    // } else {
    //     $seeneps = $('#seeneps');
    //     if ($seeneps.data('type') == 'anime') {
    //         // Do not check the progress number when editing anime review
    //         if (!$('body').hasClass('edit') && (parseInt($seeneps.val()) || 0) <= 0) {
    //             a = false;
    //             errorVal = 'You must enter an Episodes Watched number larger than 0';
    //         }
    //     } else {
    //         if ((parseInt($seeneps.val()) || 0) <= 0) {
    //             a = false;
    //             errorVal = 'You must enter a Chapters Read number larger than 0';
    //         }
    //     }
    }

    //次の単語の一番最初の文字を取得して配列に格納する
    matches = document.reviews.frm_review_text.value.match(/(\s\w)/g);

    //レビューの最低文字数を増やす
    if ((matches == null) || ((matches.length + 1) < 100) || (document.reviews.frm_review_text.value.length < 500)) {
        errorVal = 'Please enter a longer review';
        b        = false;
    }
    else {
        b = true;
    }

    if ((a && b) || (typeVal == 'delete')) {
        if (typeVal == 'preview') {
            document.reviews.frm_preview.value = 1;
        }
        else if (typeVal == 'post') {
            document.reviews.frm_submit.value = 1;
        }
        else if (typeVal == 'delete') {
            var deleteForm = confirm('Are you sure you want to delete this review?')
            if (!deleteForm) {
                return false;
            }
            document.reviews.frm_delete.value = 1;
        }

        document.reviews.submit();
    }
    else {
        alert(errorVal);
        return false;
    }
}