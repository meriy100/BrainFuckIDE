import "./style/style.scss";
import CodeMirror from "codemirror/lib/codemirror"
import "codemirror/mode/brainfuck/brainfuck"
import initial from './initial'

const initialMainCode = () => {
    return localStorage.getItem('mainCode') || initial
};

const app = Elm.Main.init({node: document.getElementById("elm-node"), flags: initialMainCode()});
const initializer = setInterval(() => {
    const textarea = document.getElementById("editor");
    if (!textarea) {
        return;
    }
    const editor = CodeMirror.fromTextArea(textarea, {
        lineNumbers: true,
        mode:  "brainfuck",
        theme: "material",
        gutters: ["CodeMirror-linenumbers", "CodeMirror__breakpoints"]
    });

    editor.on('change', () => {
        app.ports.codeOnInput.send({ inputType: "mainEditor", snippetId: null, codeString: editor.doc.getValue() });
    });
    editor.setOption("extraKeys", {
        ["Ctrl-R"]: (cm) => {
            app.ports.run.send(0);
        },
        ["Ctrl-S"]: (cm) => {
            localStorage.setItem('mainCode', editor.doc.getValue())
        },
        ["Cmd-S"]: (cm) => {
            localStorage.setItem('mainCode', editor.doc.getValue())
        }
    });

    editor.on("gutterClick", (cm, n) => {
        const info = cm.lineInfo(n);
        console.log(info)
        cm.setGutterMarker(n, "CodeMirror__breakpoints", info.gutterMarkers ? null : makeMarker());
    });
    clearInterval(initializer);
}, 10);

const makeMarker = () =>  {
    const marker = document.createElement("div");
    marker.setAttribute('class', 'CodeMirror__marker');
    return marker;
};
