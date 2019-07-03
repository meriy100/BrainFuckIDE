import "./app.scss";
import CodeMirror from "codemirror/lib/codemirror"
import "codemirror/mode/brainfuck/brainfuck"

const app = Elm.Main.init({node: document.getElementById("elm-node")});
const initializer = setInterval(() => {
    const textarea = document.getElementById("editor");
    if (!textarea) {
        return;
    }
    const editor = CodeMirror.fromTextArea(textarea, {
        lineNumbers: true,
        mode:  "brainfuck",
        theme: "material"
    });
    editor.on('change', () => {
        app.ports.codeOnInput.send(editor.doc.getValue());
    });
    editor.setOption("extraKeys", {
        ["Ctrl-S"]: (cm) => {
            app.ports.save.send(editor.doc.getValue());
        },
        ["Cmd-S"]: (cm) => {
            app.ports.save.send(editor.doc.getValue());
        }
    });
    clearInterval(initializer);
}, 10);
