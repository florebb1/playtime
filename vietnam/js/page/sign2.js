$(document).ready(function(){
    // 부모 성별 클릭 이벤트
    $('#parents-m').click(function(){
        if(!$(this).hasClass('ag-active')) {
            $(this).addClass('ag-active');
            $('#parents-f').removeClass('ag-active');
        }
    });
    $('#parents-f').click(function(){
        if(!$(this).hasClass('ag-active')) {
            $(this).addClass('ag-active');
            $('#parents-m').removeClass('ag-active');
        }
    });
    // 자녀 성별 클릭 이벤트
    $(document).on('click', '.child-m', function() {
        if(!$(this).hasClass('ag-active')) {
            $(this).addClass('ag-active');
            $(this).next().removeClass('ag-active');
        }
    });
    $(document).on('click', '.child-f', function() {
        if(!$(this).hasClass('ag-active')) {
            $(this).addClass('ag-active');
            $(this).prev().removeClass('ag-active');
        }
    });

    // 자녀와의 관계 선택 이벤트
    $('#relation').change(function(){
        if($('#relation').val() == '40') {
            $('#relation-input').removeClass('d-none');
            $('#relation-input').addClass('d-flex');
        } else {
            if($('#relation-input').hasClass('d-flex')) {
                $('#relation-input').val('');
                $('#relation-input').removeClass('d-flex');
                $('#relation-input').addClass('d-none');
            }
        }
    });

    // 자녀 추가 버튼
    $('#child-add').click(function(){
       var nc = "";
            nc += "<div>"
            + "<div class='d-flex align-items-center justify-content-end mt-4 info-box'>"
            + "<button type='button' class='close child-close' aria-label='Close'><span class='fs-35' aria-hidden='true'>&times;</span></button>"
            + "</div>"
            + "<div class='info-box text-left font-weight-bold'>"
            + "<label class='px-1'></label>Tên trẻ em / Giới tính</label>"
            + "</div>"
            + "<div class='info-box d-flex justify-content-center align-items-center mb-4'>"
            + "<div class='w-100 col-8 mr-2 p-0'>"
            + "<input type='text' class='sign-input-box w-100 pl-2'>"
            + "</div>"
            + "<div class='col btn-group p-0' role='group'>"
            + "<button class='btn select-left-btn text-secondary col-6 child-m'>M</button>"
            + "<button class='btn select-right-btn text-secondary col-6 child-f'>F</button>"
            + "</div>"
            + "</div>"
            + "<div class='info-box text-left font-weight-bold'>"
            + "<label class='px-1'></label>Ngày sinh của con</label>"
            + "</div>"
            + "<div class='info-box d-flex justify-content-center align-items-center mb-4'>"
            + "<div class='w-100 col-6 mr-2 p-0'>"
            + "<input max='9999' maxlength='4' type='number' class='sign-input-box w-100 text-center' placeholder='Năm' oninput='maxLengthCheck(this);'>"
            + "</div>"
            + "<div class='w-100 col mr-2 p-0'>"
            + "<input max='12' maxlength='2' type='number' class='sign-input-box w-100 text-center' placeholder='Tháng' oninput='maxLengthCheck(this);'>"
            + "</div>"
            + "<div class='w-100 col p-0'>"
            + "<input max='31' maxlength='2' type='number' class='sign-input-box w-100 text-center' placeholder='Ngày' oninput='maxLengthCheck(this);'>"
            + "</div>"
            + "</div>"
            + "</div>";
        $('#add-child-areas').append(nc);
    });

    // 자녀 삭제 버튼
    $(document).on('click', '.child-close', function(){
        $(this).parent().parent().remove();
    });




});