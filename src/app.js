var app = Elm.Main.init({node: document.getElementById("elm-node")});
var initializer = setInterval(function () {
    var textarea = document.getElementById("editor");
    if (!textarea) {
        return;
    }
    var editor = CodeMirror.fromTextArea(textarea, {
        lineNumbers: true,
        mode:  "brainfuck",
        theme: "material"
    });
    editor.on('change', () => {
        app.ports.codeOnInput.send(editor.doc.getValue());
        console.log(editor.doc.getValue());
    });
    editor.setOption("extraKeys", {
        ["Ctrl-S"]: function (cm) {
            app.ports.save.send(editor.doc.getValue());
        },
        ["Cmd-S"]: function (cm) {
            app.ports.save.send(editor.doc.getValue());
        }
    });
    clearInterval(initializer);
}, 10);
