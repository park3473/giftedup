/**
 * @license Copyright (c) 2003-2020, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see https://ckeditor.com/legal/ckeditor-oss-license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
	config.language = 'ko';

	config.font_names = '맑은 고딕; 돋움; 굴림; 궁서; 바탕;' + 'Arial; Courier New; Tahoma; Verdana;';

	config.enterMode = CKEDITOR.ENTER_BR;       // 엔터를 <br/> 태그로

	config.shiftEnterMode = CKEDITOR.ENTER_P;

 

	config.allowedContent = true;
	config.filebrowserUploadMethod = 'form';
	config.pasteFilter = null;
};
CKEDITOR.editorConfig = function( config ) {
    config.pasteFilter = null;
};