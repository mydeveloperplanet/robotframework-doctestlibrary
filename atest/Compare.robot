*** Settings ***
Library    DocTest.VisualTest    show_diff=true    take_screenshots=true    screenshot_format=png

*** Test Cases ***
Compare two Beach images
    Run Keyword And Expect Error    The compared images are different.    Compare Images    testdata/Beach_left.jpg    testdata/Beach_right.jpg

Compare two Farm images
    Run Keyword And Expect Error    The compared images are different.    Compare Images    testdata/Farm_left.jpg    testdata/Farm_right.jpg

Compare two Farm images with date pattern
    Compare Images    testdata/Beach_date.png    testdata/Beach_left.png    placeholder_file=testdata/pattern_mask.json

Compare two different PDF Files
    Run Keyword And Expect Error    The compared images are different.    Compare Images    testdata/sample_1_page.pdf    testdata/sample_1_page_changed.pdf

Compare two different PDF Files with pattern mask
    Compare Images    testdata/sample_1_page.pdf    testdata/sample_1_page_changed.pdf    placeholder_file=testdata/pdf_pattern_mask.json

Compare two different PDF Files with area mask
    Compare Images    testdata/sample_1_page.pdf    testdata/sample_1_page_changed.pdf    placeholder_file=testdata/pdf_area_mask.json

Compare two different PDF Files with pattern mask as parameter
    Compare Images    testdata/sample_1_page.pdf    testdata/sample_1_page_changed.pdf    mask=[{"page": "all","name": "Ref ID","type": "pattern","pattern": ".*RTMOE.*"},{"page": "all","name": "Job ID","type": "pattern","pattern": "JobID.*"}]

Compare two different PDF Files with moved text
    Run Keyword And Expect Error    The compared images are different.    Compare Images    testdata/sample_1_page.pdf    testdata/sample_1_page_moved.pdf

Compare two different PDF Files with moved text but same content OCR
    Compare Images    testdata/sample_1_page.pdf    testdata/sample_1_page_moved.pdf    check_text_content=${true}

Compare two different PDF Files with moved text but same content pdfminer
    Compare Images    testdata/sample_1_page.pdf    testdata/sample_1_page_moved.pdf    check_text_content=${true}    get_pdf_content=${true}

Compare two different PDF Files with moved text within tolerance
    Compare Images    testdata/sample_1_page.pdf    testdata/sample_1_page_moved.pdf    move_tolerance=20

Compare two different PDF Files with moved text outside tolerance
    Run Keyword And Expect Error    The compared images are different.    Compare Images    testdata/sample_1_page.pdf    testdata/sample_1_page_moved.pdf    move_tolerance=5