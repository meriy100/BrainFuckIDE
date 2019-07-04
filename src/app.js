import "./style/style.scss";
import CodeMirror from "codemirror/lib/codemirror"
import "codemirror/mode/brainfuck/brainfuck"
import initial from './initial'

const app = Elm.Main.init({node: document.getElementById("elm-node"), flags: initial});
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
        app.ports.codeOnInput.send({ inputType: "mainEditor", snippetId: null, codeString: editor.doc.getValue() });
    });
    editor.setOption("extraKeys", {
        ["Ctrl-R"]: (cm) => {
            app.ports.run.send(0);
        },
        ["Ctrl-S"]: (cm) => {
        },
        ["Cmd-S"]: (cm) => {
        }
    });
    clearInterval(initializer);
}, 10);
