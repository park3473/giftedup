import UploadAdapter from '/resources/ckeditor2/UploadAdapter.js'

export default function makeEditor(target) {
    return ClassicEditor.create(document.querySelector(target), {
     	fontSize: {
            // 원하는 폰트 크기 옵션을 정의합니다.
            options: [
                9 ,10, 11, 12, 14, 'default', 18, 20, 22
            ]
        },
        alignment: {
            options: [ 'left', 'right' ]
        },
        extraPlugins: [MyCustomUploadAdapterPlugin]
    })

}

function MyCustomUploadAdapterPlugin(editor) {
    editor.plugins.get('FileRepository').createUploadAdapter = (loader) => {
        return new UploadAdapter(loader)
    }
}