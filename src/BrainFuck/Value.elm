module BrainFuck.Value exposing (Value(..), decrement, fromInt, increment, toInt)


type Value
    = Value0
    | Value1
    | Value2
    | Value3
    | Value4
    | Value5
    | Value6
    | Value7
    | Value8
    | Value9
    | Value10
    | Value11
    | Value12
    | Value13
    | Value14
    | Value15
    | Value16
    | Value17
    | Value18
    | Value19
    | Value20
    | Value21
    | Value22
    | Value23
    | Value24
    | Value25
    | Value26
    | Value27
    | Value28
    | Value29
    | Value30
    | Value31
    | Value32
    | Value33
    | Value34
    | Value35
    | Value36
    | Value37
    | Value38
    | Value39
    | Value40
    | Value41
    | Value42
    | Value43
    | Value44
    | Value45
    | Value46
    | Value47
    | Value48
    | Value49
    | Value50
    | Value51
    | Value52
    | Value53
    | Value54
    | Value55
    | Value56
    | Value57
    | Value58
    | Value59
    | Value60
    | Value61
    | Value62
    | Value63
    | Value64
    | Value65
    | Value66
    | Value67
    | Value68
    | Value69
    | Value70
    | Value71
    | Value72
    | Value73
    | Value74
    | Value75
    | Value76
    | Value77
    | Value78
    | Value79
    | Value80
    | Value81
    | Value82
    | Value83
    | Value84
    | Value85
    | Value86
    | Value87
    | Value88
    | Value89
    | Value90
    | Value91
    | Value92
    | Value93
    | Value94
    | Value95
    | Value96
    | Value97
    | Value98
    | Value99
    | Value100
    | Value101
    | Value102
    | Value103
    | Value104
    | Value105
    | Value106
    | Value107
    | Value108
    | Value109
    | Value110
    | Value111
    | Value112
    | Value113
    | Value114
    | Value115
    | Value116
    | Value117
    | Value118
    | Value119
    | Value120
    | Value121
    | Value122
    | Value123
    | Value124
    | Value125
    | Value126
    | Value127
    | Value128
    | Value129
    | Value130
    | Value131
    | Value132
    | Value133
    | Value134
    | Value135
    | Value136
    | Value137
    | Value138
    | Value139
    | Value140
    | Value141
    | Value142
    | Value143
    | Value144
    | Value145
    | Value146
    | Value147
    | Value148
    | Value149
    | Value150
    | Value151
    | Value152
    | Value153
    | Value154
    | Value155
    | Value156
    | Value157
    | Value158
    | Value159
    | Value160
    | Value161
    | Value162
    | Value163
    | Value164
    | Value165
    | Value166
    | Value167
    | Value168
    | Value169
    | Value170
    | Value171
    | Value172
    | Value173
    | Value174
    | Value175
    | Value176
    | Value177
    | Value178
    | Value179
    | Value180
    | Value181
    | Value182
    | Value183
    | Value184
    | Value185
    | Value186
    | Value187
    | Value188
    | Value189
    | Value190
    | Value191
    | Value192
    | Value193
    | Value194
    | Value195
    | Value196
    | Value197
    | Value198
    | Value199
    | Value200
    | Value201
    | Value202
    | Value203
    | Value204
    | Value205
    | Value206
    | Value207
    | Value208
    | Value209
    | Value210
    | Value211
    | Value212
    | Value213
    | Value214
    | Value215
    | Value216
    | Value217
    | Value218
    | Value219
    | Value220
    | Value221
    | Value222
    | Value223
    | Value224
    | Value225
    | Value226
    | Value227
    | Value228
    | Value229
    | Value230
    | Value231
    | Value232
    | Value233
    | Value234
    | Value235
    | Value236
    | Value237
    | Value238
    | Value239
    | Value240
    | Value241
    | Value242
    | Value243
    | Value244
    | Value245
    | Value246
    | Value247
    | Value248
    | Value249
    | Value250
    | Value251
    | Value252
    | Value253
    | Value254
    | Value255


increment : Value -> Value
increment value =
    case value of
        Value0 ->
            Value1

        Value1 ->
            Value2

        Value2 ->
            Value3

        Value3 ->
            Value4

        Value4 ->
            Value5

        Value5 ->
            Value6

        Value6 ->
            Value7

        Value7 ->
            Value8

        Value8 ->
            Value9

        Value9 ->
            Value10

        Value10 ->
            Value11

        Value11 ->
            Value12

        Value12 ->
            Value13

        Value13 ->
            Value14

        Value14 ->
            Value15

        Value15 ->
            Value16

        Value16 ->
            Value17

        Value17 ->
            Value18

        Value18 ->
            Value19

        Value19 ->
            Value20

        Value20 ->
            Value21

        Value21 ->
            Value22

        Value22 ->
            Value23

        Value23 ->
            Value24

        Value24 ->
            Value25

        Value25 ->
            Value26

        Value26 ->
            Value27

        Value27 ->
            Value28

        Value28 ->
            Value29

        Value29 ->
            Value30

        Value30 ->
            Value31

        Value31 ->
            Value32

        Value32 ->
            Value33

        Value33 ->
            Value34

        Value34 ->
            Value35

        Value35 ->
            Value36

        Value36 ->
            Value37

        Value37 ->
            Value38

        Value38 ->
            Value39

        Value39 ->
            Value40

        Value40 ->
            Value41

        Value41 ->
            Value42

        Value42 ->
            Value43

        Value43 ->
            Value44

        Value44 ->
            Value45

        Value45 ->
            Value46

        Value46 ->
            Value47

        Value47 ->
            Value48

        Value48 ->
            Value49

        Value49 ->
            Value50

        Value50 ->
            Value51

        Value51 ->
            Value52

        Value52 ->
            Value53

        Value53 ->
            Value54

        Value54 ->
            Value55

        Value55 ->
            Value56

        Value56 ->
            Value57

        Value57 ->
            Value58

        Value58 ->
            Value59

        Value59 ->
            Value60

        Value60 ->
            Value61

        Value61 ->
            Value62

        Value62 ->
            Value63

        Value63 ->
            Value64

        Value64 ->
            Value65

        Value65 ->
            Value66

        Value66 ->
            Value67

        Value67 ->
            Value68

        Value68 ->
            Value69

        Value69 ->
            Value70

        Value70 ->
            Value71

        Value71 ->
            Value72

        Value72 ->
            Value73

        Value73 ->
            Value74

        Value74 ->
            Value75

        Value75 ->
            Value76

        Value76 ->
            Value77

        Value77 ->
            Value78

        Value78 ->
            Value79

        Value79 ->
            Value80

        Value80 ->
            Value81

        Value81 ->
            Value82

        Value82 ->
            Value83

        Value83 ->
            Value84

        Value84 ->
            Value85

        Value85 ->
            Value86

        Value86 ->
            Value87

        Value87 ->
            Value88

        Value88 ->
            Value89

        Value89 ->
            Value90

        Value90 ->
            Value91

        Value91 ->
            Value92

        Value92 ->
            Value93

        Value93 ->
            Value94

        Value94 ->
            Value95

        Value95 ->
            Value96

        Value96 ->
            Value97

        Value97 ->
            Value98

        Value98 ->
            Value99

        Value99 ->
            Value100

        Value100 ->
            Value101

        Value101 ->
            Value102

        Value102 ->
            Value103

        Value103 ->
            Value104

        Value104 ->
            Value105

        Value105 ->
            Value106

        Value106 ->
            Value107

        Value107 ->
            Value108

        Value108 ->
            Value109

        Value109 ->
            Value110

        Value110 ->
            Value111

        Value111 ->
            Value112

        Value112 ->
            Value113

        Value113 ->
            Value114

        Value114 ->
            Value115

        Value115 ->
            Value116

        Value116 ->
            Value117

        Value117 ->
            Value118

        Value118 ->
            Value119

        Value119 ->
            Value120

        Value120 ->
            Value121

        Value121 ->
            Value122

        Value122 ->
            Value123

        Value123 ->
            Value124

        Value124 ->
            Value125

        Value125 ->
            Value126

        Value126 ->
            Value127

        Value127 ->
            Value128

        Value128 ->
            Value129

        Value129 ->
            Value130

        Value130 ->
            Value131

        Value131 ->
            Value132

        Value132 ->
            Value133

        Value133 ->
            Value134

        Value134 ->
            Value135

        Value135 ->
            Value136

        Value136 ->
            Value137

        Value137 ->
            Value138

        Value138 ->
            Value139

        Value139 ->
            Value140

        Value140 ->
            Value141

        Value141 ->
            Value142

        Value142 ->
            Value143

        Value143 ->
            Value144

        Value144 ->
            Value145

        Value145 ->
            Value146

        Value146 ->
            Value147

        Value147 ->
            Value148

        Value148 ->
            Value149

        Value149 ->
            Value150

        Value150 ->
            Value151

        Value151 ->
            Value152

        Value152 ->
            Value153

        Value153 ->
            Value154

        Value154 ->
            Value155

        Value155 ->
            Value156

        Value156 ->
            Value157

        Value157 ->
            Value158

        Value158 ->
            Value159

        Value159 ->
            Value160

        Value160 ->
            Value161

        Value161 ->
            Value162

        Value162 ->
            Value163

        Value163 ->
            Value164

        Value164 ->
            Value165

        Value165 ->
            Value166

        Value166 ->
            Value167

        Value167 ->
            Value168

        Value168 ->
            Value169

        Value169 ->
            Value170

        Value170 ->
            Value171

        Value171 ->
            Value172

        Value172 ->
            Value173

        Value173 ->
            Value174

        Value174 ->
            Value175

        Value175 ->
            Value176

        Value176 ->
            Value177

        Value177 ->
            Value178

        Value178 ->
            Value179

        Value179 ->
            Value180

        Value180 ->
            Value181

        Value181 ->
            Value182

        Value182 ->
            Value183

        Value183 ->
            Value184

        Value184 ->
            Value185

        Value185 ->
            Value186

        Value186 ->
            Value187

        Value187 ->
            Value188

        Value188 ->
            Value189

        Value189 ->
            Value190

        Value190 ->
            Value191

        Value191 ->
            Value192

        Value192 ->
            Value193

        Value193 ->
            Value194

        Value194 ->
            Value195

        Value195 ->
            Value196

        Value196 ->
            Value197

        Value197 ->
            Value198

        Value198 ->
            Value199

        Value199 ->
            Value200

        Value200 ->
            Value201

        Value201 ->
            Value202

        Value202 ->
            Value203

        Value203 ->
            Value204

        Value204 ->
            Value205

        Value205 ->
            Value206

        Value206 ->
            Value207

        Value207 ->
            Value208

        Value208 ->
            Value209

        Value209 ->
            Value210

        Value210 ->
            Value211

        Value211 ->
            Value212

        Value212 ->
            Value213

        Value213 ->
            Value214

        Value214 ->
            Value215

        Value215 ->
            Value216

        Value216 ->
            Value217

        Value217 ->
            Value218

        Value218 ->
            Value219

        Value219 ->
            Value220

        Value220 ->
            Value221

        Value221 ->
            Value222

        Value222 ->
            Value223

        Value223 ->
            Value224

        Value224 ->
            Value225

        Value225 ->
            Value226

        Value226 ->
            Value227

        Value227 ->
            Value228

        Value228 ->
            Value229

        Value229 ->
            Value230

        Value230 ->
            Value231

        Value231 ->
            Value232

        Value232 ->
            Value233

        Value233 ->
            Value234

        Value234 ->
            Value235

        Value235 ->
            Value236

        Value236 ->
            Value237

        Value237 ->
            Value238

        Value238 ->
            Value239

        Value239 ->
            Value240

        Value240 ->
            Value241

        Value241 ->
            Value242

        Value242 ->
            Value243

        Value243 ->
            Value244

        Value244 ->
            Value245

        Value245 ->
            Value246

        Value246 ->
            Value247

        Value247 ->
            Value248

        Value248 ->
            Value249

        Value249 ->
            Value250

        Value250 ->
            Value251

        Value251 ->
            Value252

        Value252 ->
            Value253

        Value253 ->
            Value254

        Value254 ->
            Value255

        Value255 ->
            Value0


decrement : Value -> Value
decrement value =
    case value of
        Value0 ->
            Value255

        Value1 ->
            Value0

        Value2 ->
            Value1

        Value3 ->
            Value2

        Value4 ->
            Value3

        Value5 ->
            Value4

        Value6 ->
            Value5

        Value7 ->
            Value6

        Value8 ->
            Value7

        Value9 ->
            Value8

        Value10 ->
            Value9

        Value11 ->
            Value10

        Value12 ->
            Value11

        Value13 ->
            Value12

        Value14 ->
            Value13

        Value15 ->
            Value14

        Value16 ->
            Value15

        Value17 ->
            Value16

        Value18 ->
            Value17

        Value19 ->
            Value18

        Value20 ->
            Value19

        Value21 ->
            Value20

        Value22 ->
            Value21

        Value23 ->
            Value22

        Value24 ->
            Value23

        Value25 ->
            Value24

        Value26 ->
            Value25

        Value27 ->
            Value26

        Value28 ->
            Value27

        Value29 ->
            Value28

        Value30 ->
            Value29

        Value31 ->
            Value30

        Value32 ->
            Value31

        Value33 ->
            Value32

        Value34 ->
            Value33

        Value35 ->
            Value34

        Value36 ->
            Value35

        Value37 ->
            Value36

        Value38 ->
            Value37

        Value39 ->
            Value38

        Value40 ->
            Value39

        Value41 ->
            Value40

        Value42 ->
            Value41

        Value43 ->
            Value42

        Value44 ->
            Value43

        Value45 ->
            Value44

        Value46 ->
            Value45

        Value47 ->
            Value46

        Value48 ->
            Value47

        Value49 ->
            Value48

        Value50 ->
            Value49

        Value51 ->
            Value50

        Value52 ->
            Value51

        Value53 ->
            Value52

        Value54 ->
            Value53

        Value55 ->
            Value54

        Value56 ->
            Value55

        Value57 ->
            Value56

        Value58 ->
            Value57

        Value59 ->
            Value58

        Value60 ->
            Value59

        Value61 ->
            Value60

        Value62 ->
            Value61

        Value63 ->
            Value62

        Value64 ->
            Value63

        Value65 ->
            Value64

        Value66 ->
            Value65

        Value67 ->
            Value66

        Value68 ->
            Value67

        Value69 ->
            Value68

        Value70 ->
            Value69

        Value71 ->
            Value70

        Value72 ->
            Value71

        Value73 ->
            Value72

        Value74 ->
            Value73

        Value75 ->
            Value74

        Value76 ->
            Value75

        Value77 ->
            Value76

        Value78 ->
            Value77

        Value79 ->
            Value78

        Value80 ->
            Value79

        Value81 ->
            Value80

        Value82 ->
            Value81

        Value83 ->
            Value82

        Value84 ->
            Value83

        Value85 ->
            Value84

        Value86 ->
            Value85

        Value87 ->
            Value86

        Value88 ->
            Value87

        Value89 ->
            Value88

        Value90 ->
            Value89

        Value91 ->
            Value90

        Value92 ->
            Value91

        Value93 ->
            Value92

        Value94 ->
            Value93

        Value95 ->
            Value94

        Value96 ->
            Value95

        Value97 ->
            Value96

        Value98 ->
            Value97

        Value99 ->
            Value98

        Value100 ->
            Value99

        Value101 ->
            Value100

        Value102 ->
            Value101

        Value103 ->
            Value102

        Value104 ->
            Value103

        Value105 ->
            Value104

        Value106 ->
            Value105

        Value107 ->
            Value106

        Value108 ->
            Value107

        Value109 ->
            Value108

        Value110 ->
            Value109

        Value111 ->
            Value110

        Value112 ->
            Value111

        Value113 ->
            Value112

        Value114 ->
            Value113

        Value115 ->
            Value114

        Value116 ->
            Value115

        Value117 ->
            Value116

        Value118 ->
            Value117

        Value119 ->
            Value118

        Value120 ->
            Value119

        Value121 ->
            Value120

        Value122 ->
            Value121

        Value123 ->
            Value122

        Value124 ->
            Value123

        Value125 ->
            Value124

        Value126 ->
            Value125

        Value127 ->
            Value126

        Value128 ->
            Value127

        Value129 ->
            Value128

        Value130 ->
            Value129

        Value131 ->
            Value130

        Value132 ->
            Value131

        Value133 ->
            Value132

        Value134 ->
            Value133

        Value135 ->
            Value134

        Value136 ->
            Value135

        Value137 ->
            Value136

        Value138 ->
            Value137

        Value139 ->
            Value138

        Value140 ->
            Value139

        Value141 ->
            Value140

        Value142 ->
            Value141

        Value143 ->
            Value142

        Value144 ->
            Value143

        Value145 ->
            Value144

        Value146 ->
            Value145

        Value147 ->
            Value146

        Value148 ->
            Value147

        Value149 ->
            Value148

        Value150 ->
            Value149

        Value151 ->
            Value150

        Value152 ->
            Value151

        Value153 ->
            Value152

        Value154 ->
            Value153

        Value155 ->
            Value154

        Value156 ->
            Value155

        Value157 ->
            Value156

        Value158 ->
            Value157

        Value159 ->
            Value158

        Value160 ->
            Value159

        Value161 ->
            Value160

        Value162 ->
            Value161

        Value163 ->
            Value162

        Value164 ->
            Value163

        Value165 ->
            Value164

        Value166 ->
            Value165

        Value167 ->
            Value166

        Value168 ->
            Value167

        Value169 ->
            Value168

        Value170 ->
            Value169

        Value171 ->
            Value170

        Value172 ->
            Value171

        Value173 ->
            Value172

        Value174 ->
            Value173

        Value175 ->
            Value174

        Value176 ->
            Value175

        Value177 ->
            Value176

        Value178 ->
            Value177

        Value179 ->
            Value178

        Value180 ->
            Value179

        Value181 ->
            Value180

        Value182 ->
            Value181

        Value183 ->
            Value182

        Value184 ->
            Value183

        Value185 ->
            Value184

        Value186 ->
            Value185

        Value187 ->
            Value186

        Value188 ->
            Value187

        Value189 ->
            Value188

        Value190 ->
            Value189

        Value191 ->
            Value190

        Value192 ->
            Value191

        Value193 ->
            Value192

        Value194 ->
            Value193

        Value195 ->
            Value194

        Value196 ->
            Value195

        Value197 ->
            Value196

        Value198 ->
            Value197

        Value199 ->
            Value198

        Value200 ->
            Value199

        Value201 ->
            Value200

        Value202 ->
            Value201

        Value203 ->
            Value202

        Value204 ->
            Value203

        Value205 ->
            Value204

        Value206 ->
            Value205

        Value207 ->
            Value206

        Value208 ->
            Value207

        Value209 ->
            Value208

        Value210 ->
            Value209

        Value211 ->
            Value210

        Value212 ->
            Value211

        Value213 ->
            Value212

        Value214 ->
            Value213

        Value215 ->
            Value214

        Value216 ->
            Value215

        Value217 ->
            Value216

        Value218 ->
            Value217

        Value219 ->
            Value218

        Value220 ->
            Value219

        Value221 ->
            Value220

        Value222 ->
            Value221

        Value223 ->
            Value222

        Value224 ->
            Value223

        Value225 ->
            Value224

        Value226 ->
            Value225

        Value227 ->
            Value226

        Value228 ->
            Value227

        Value229 ->
            Value228

        Value230 ->
            Value229

        Value231 ->
            Value230

        Value232 ->
            Value231

        Value233 ->
            Value232

        Value234 ->
            Value233

        Value235 ->
            Value234

        Value236 ->
            Value235

        Value237 ->
            Value236

        Value238 ->
            Value237

        Value239 ->
            Value238

        Value240 ->
            Value239

        Value241 ->
            Value240

        Value242 ->
            Value241

        Value243 ->
            Value242

        Value244 ->
            Value243

        Value245 ->
            Value244

        Value246 ->
            Value245

        Value247 ->
            Value246

        Value248 ->
            Value247

        Value249 ->
            Value248

        Value250 ->
            Value249

        Value251 ->
            Value250

        Value252 ->
            Value251

        Value253 ->
            Value252

        Value254 ->
            Value253

        Value255 ->
            Value254


fromInt : Int -> Maybe Value
fromInt n =
    case n of
        0 ->
            Just Value0

        1 ->
            Just Value1

        2 ->
            Just Value2

        3 ->
            Just Value3

        4 ->
            Just Value4

        5 ->
            Just Value5

        6 ->
            Just Value6

        7 ->
            Just Value7

        8 ->
            Just Value8

        9 ->
            Just Value9

        10 ->
            Just Value10

        11 ->
            Just Value11

        12 ->
            Just Value12

        13 ->
            Just Value13

        14 ->
            Just Value14

        15 ->
            Just Value15

        16 ->
            Just Value16

        17 ->
            Just Value17

        18 ->
            Just Value18

        19 ->
            Just Value19

        20 ->
            Just Value20

        21 ->
            Just Value21

        22 ->
            Just Value22

        23 ->
            Just Value23

        24 ->
            Just Value24

        25 ->
            Just Value25

        26 ->
            Just Value26

        27 ->
            Just Value27

        28 ->
            Just Value28

        29 ->
            Just Value29

        30 ->
            Just Value30

        31 ->
            Just Value31

        32 ->
            Just Value32

        33 ->
            Just Value33

        34 ->
            Just Value34

        35 ->
            Just Value35

        36 ->
            Just Value36

        37 ->
            Just Value37

        38 ->
            Just Value38

        39 ->
            Just Value39

        40 ->
            Just Value40

        41 ->
            Just Value41

        42 ->
            Just Value42

        43 ->
            Just Value43

        44 ->
            Just Value44

        45 ->
            Just Value45

        46 ->
            Just Value46

        47 ->
            Just Value47

        48 ->
            Just Value48

        49 ->
            Just Value49

        50 ->
            Just Value50

        51 ->
            Just Value51

        52 ->
            Just Value52

        53 ->
            Just Value53

        54 ->
            Just Value54

        55 ->
            Just Value55

        56 ->
            Just Value56

        57 ->
            Just Value57

        58 ->
            Just Value58

        59 ->
            Just Value59

        60 ->
            Just Value60

        61 ->
            Just Value61

        62 ->
            Just Value62

        63 ->
            Just Value63

        64 ->
            Just Value64

        65 ->
            Just Value65

        66 ->
            Just Value66

        67 ->
            Just Value67

        68 ->
            Just Value68

        69 ->
            Just Value69

        70 ->
            Just Value70

        71 ->
            Just Value71

        72 ->
            Just Value72

        73 ->
            Just Value73

        74 ->
            Just Value74

        75 ->
            Just Value75

        76 ->
            Just Value76

        77 ->
            Just Value77

        78 ->
            Just Value78

        79 ->
            Just Value79

        80 ->
            Just Value80

        81 ->
            Just Value81

        82 ->
            Just Value82

        83 ->
            Just Value83

        84 ->
            Just Value84

        85 ->
            Just Value85

        86 ->
            Just Value86

        87 ->
            Just Value87

        88 ->
            Just Value88

        89 ->
            Just Value89

        90 ->
            Just Value90

        91 ->
            Just Value91

        92 ->
            Just Value92

        93 ->
            Just Value93

        94 ->
            Just Value94

        95 ->
            Just Value95

        96 ->
            Just Value96

        97 ->
            Just Value97

        98 ->
            Just Value98

        99 ->
            Just Value99

        100 ->
            Just Value100

        101 ->
            Just Value101

        102 ->
            Just Value102

        103 ->
            Just Value103

        104 ->
            Just Value104

        105 ->
            Just Value105

        106 ->
            Just Value106

        107 ->
            Just Value107

        108 ->
            Just Value108

        109 ->
            Just Value109

        110 ->
            Just Value110

        111 ->
            Just Value111

        112 ->
            Just Value112

        113 ->
            Just Value113

        114 ->
            Just Value114

        115 ->
            Just Value115

        116 ->
            Just Value116

        117 ->
            Just Value117

        118 ->
            Just Value118

        119 ->
            Just Value119

        120 ->
            Just Value120

        121 ->
            Just Value121

        122 ->
            Just Value122

        123 ->
            Just Value123

        124 ->
            Just Value124

        125 ->
            Just Value125

        126 ->
            Just Value126

        127 ->
            Just Value127

        128 ->
            Just Value128

        129 ->
            Just Value129

        130 ->
            Just Value130

        131 ->
            Just Value131

        132 ->
            Just Value132

        133 ->
            Just Value133

        134 ->
            Just Value134

        135 ->
            Just Value135

        136 ->
            Just Value136

        137 ->
            Just Value137

        138 ->
            Just Value138

        139 ->
            Just Value139

        140 ->
            Just Value140

        141 ->
            Just Value141

        142 ->
            Just Value142

        143 ->
            Just Value143

        144 ->
            Just Value144

        145 ->
            Just Value145

        146 ->
            Just Value146

        147 ->
            Just Value147

        148 ->
            Just Value148

        149 ->
            Just Value149

        150 ->
            Just Value150

        151 ->
            Just Value151

        152 ->
            Just Value152

        153 ->
            Just Value153

        154 ->
            Just Value154

        155 ->
            Just Value155

        156 ->
            Just Value156

        157 ->
            Just Value157

        158 ->
            Just Value158

        159 ->
            Just Value159

        160 ->
            Just Value160

        161 ->
            Just Value161

        162 ->
            Just Value162

        163 ->
            Just Value163

        164 ->
            Just Value164

        165 ->
            Just Value165

        166 ->
            Just Value166

        167 ->
            Just Value167

        168 ->
            Just Value168

        169 ->
            Just Value169

        170 ->
            Just Value170

        171 ->
            Just Value171

        172 ->
            Just Value172

        173 ->
            Just Value173

        174 ->
            Just Value174

        175 ->
            Just Value175

        176 ->
            Just Value176

        177 ->
            Just Value177

        178 ->
            Just Value178

        179 ->
            Just Value179

        180 ->
            Just Value180

        181 ->
            Just Value181

        182 ->
            Just Value182

        183 ->
            Just Value183

        184 ->
            Just Value184

        185 ->
            Just Value185

        186 ->
            Just Value186

        187 ->
            Just Value187

        188 ->
            Just Value188

        189 ->
            Just Value189

        190 ->
            Just Value190

        191 ->
            Just Value191

        192 ->
            Just Value192

        193 ->
            Just Value193

        194 ->
            Just Value194

        195 ->
            Just Value195

        196 ->
            Just Value196

        197 ->
            Just Value197

        198 ->
            Just Value198

        199 ->
            Just Value199

        200 ->
            Just Value200

        201 ->
            Just Value201

        202 ->
            Just Value202

        203 ->
            Just Value203

        204 ->
            Just Value204

        205 ->
            Just Value205

        206 ->
            Just Value206

        207 ->
            Just Value207

        208 ->
            Just Value208

        209 ->
            Just Value209

        210 ->
            Just Value210

        211 ->
            Just Value211

        212 ->
            Just Value212

        213 ->
            Just Value213

        214 ->
            Just Value214

        215 ->
            Just Value215

        216 ->
            Just Value216

        217 ->
            Just Value217

        218 ->
            Just Value218

        219 ->
            Just Value219

        220 ->
            Just Value220

        221 ->
            Just Value221

        222 ->
            Just Value222

        223 ->
            Just Value223

        224 ->
            Just Value224

        225 ->
            Just Value225

        226 ->
            Just Value226

        227 ->
            Just Value227

        228 ->
            Just Value228

        229 ->
            Just Value229

        230 ->
            Just Value230

        231 ->
            Just Value231

        232 ->
            Just Value232

        233 ->
            Just Value233

        234 ->
            Just Value234

        235 ->
            Just Value235

        236 ->
            Just Value236

        237 ->
            Just Value237

        238 ->
            Just Value238

        239 ->
            Just Value239

        240 ->
            Just Value240

        241 ->
            Just Value241

        242 ->
            Just Value242

        243 ->
            Just Value243

        244 ->
            Just Value244

        245 ->
            Just Value245

        246 ->
            Just Value246

        247 ->
            Just Value247

        248 ->
            Just Value248

        249 ->
            Just Value249

        250 ->
            Just Value250

        251 ->
            Just Value251

        252 ->
            Just Value252

        253 ->
            Just Value253

        254 ->
            Just Value254

        255 ->
            Just Value255

        _ ->
            Nothing


toInt : Value -> Int
toInt value =
    case value of
        Value0 ->
            0

        Value1 ->
            1

        Value2 ->
            2

        Value3 ->
            3

        Value4 ->
            4

        Value5 ->
            5

        Value6 ->
            6

        Value7 ->
            7

        Value8 ->
            8

        Value9 ->
            9

        Value10 ->
            10

        Value11 ->
            11

        Value12 ->
            12

        Value13 ->
            13

        Value14 ->
            14

        Value15 ->
            15

        Value16 ->
            16

        Value17 ->
            17

        Value18 ->
            18

        Value19 ->
            19

        Value20 ->
            20

        Value21 ->
            21

        Value22 ->
            22

        Value23 ->
            23

        Value24 ->
            24

        Value25 ->
            25

        Value26 ->
            26

        Value27 ->
            27

        Value28 ->
            28

        Value29 ->
            29

        Value30 ->
            30

        Value31 ->
            31

        Value32 ->
            32

        Value33 ->
            33

        Value34 ->
            34

        Value35 ->
            35

        Value36 ->
            36

        Value37 ->
            37

        Value38 ->
            38

        Value39 ->
            39

        Value40 ->
            40

        Value41 ->
            41

        Value42 ->
            42

        Value43 ->
            43

        Value44 ->
            44

        Value45 ->
            45

        Value46 ->
            46

        Value47 ->
            47

        Value48 ->
            48

        Value49 ->
            49

        Value50 ->
            50

        Value51 ->
            51

        Value52 ->
            52

        Value53 ->
            53

        Value54 ->
            54

        Value55 ->
            55

        Value56 ->
            56

        Value57 ->
            57

        Value58 ->
            58

        Value59 ->
            59

        Value60 ->
            60

        Value61 ->
            61

        Value62 ->
            62

        Value63 ->
            63

        Value64 ->
            64

        Value65 ->
            65

        Value66 ->
            66

        Value67 ->
            67

        Value68 ->
            68

        Value69 ->
            69

        Value70 ->
            70

        Value71 ->
            71

        Value72 ->
            72

        Value73 ->
            73

        Value74 ->
            74

        Value75 ->
            75

        Value76 ->
            76

        Value77 ->
            77

        Value78 ->
            78

        Value79 ->
            79

        Value80 ->
            80

        Value81 ->
            81

        Value82 ->
            82

        Value83 ->
            83

        Value84 ->
            84

        Value85 ->
            85

        Value86 ->
            86

        Value87 ->
            87

        Value88 ->
            88

        Value89 ->
            89

        Value90 ->
            90

        Value91 ->
            91

        Value92 ->
            92

        Value93 ->
            93

        Value94 ->
            94

        Value95 ->
            95

        Value96 ->
            96

        Value97 ->
            97

        Value98 ->
            98

        Value99 ->
            99

        Value100 ->
            100

        Value101 ->
            101

        Value102 ->
            102

        Value103 ->
            103

        Value104 ->
            104

        Value105 ->
            105

        Value106 ->
            106

        Value107 ->
            107

        Value108 ->
            108

        Value109 ->
            109

        Value110 ->
            110

        Value111 ->
            111

        Value112 ->
            112

        Value113 ->
            113

        Value114 ->
            114

        Value115 ->
            115

        Value116 ->
            116

        Value117 ->
            117

        Value118 ->
            118

        Value119 ->
            119

        Value120 ->
            120

        Value121 ->
            121

        Value122 ->
            122

        Value123 ->
            123

        Value124 ->
            124

        Value125 ->
            125

        Value126 ->
            126

        Value127 ->
            127

        Value128 ->
            128

        Value129 ->
            129

        Value130 ->
            130

        Value131 ->
            131

        Value132 ->
            132

        Value133 ->
            133

        Value134 ->
            134

        Value135 ->
            135

        Value136 ->
            136

        Value137 ->
            137

        Value138 ->
            138

        Value139 ->
            139

        Value140 ->
            140

        Value141 ->
            141

        Value142 ->
            142

        Value143 ->
            143

        Value144 ->
            144

        Value145 ->
            145

        Value146 ->
            146

        Value147 ->
            147

        Value148 ->
            148

        Value149 ->
            149

        Value150 ->
            150

        Value151 ->
            151

        Value152 ->
            152

        Value153 ->
            153

        Value154 ->
            154

        Value155 ->
            155

        Value156 ->
            156

        Value157 ->
            157

        Value158 ->
            158

        Value159 ->
            159

        Value160 ->
            160

        Value161 ->
            161

        Value162 ->
            162

        Value163 ->
            163

        Value164 ->
            164

        Value165 ->
            165

        Value166 ->
            166

        Value167 ->
            167

        Value168 ->
            168

        Value169 ->
            169

        Value170 ->
            170

        Value171 ->
            171

        Value172 ->
            172

        Value173 ->
            173

        Value174 ->
            174

        Value175 ->
            175

        Value176 ->
            176

        Value177 ->
            177

        Value178 ->
            178

        Value179 ->
            179

        Value180 ->
            180

        Value181 ->
            181

        Value182 ->
            182

        Value183 ->
            183

        Value184 ->
            184

        Value185 ->
            185

        Value186 ->
            186

        Value187 ->
            187

        Value188 ->
            188

        Value189 ->
            189

        Value190 ->
            190

        Value191 ->
            191

        Value192 ->
            192

        Value193 ->
            193

        Value194 ->
            194

        Value195 ->
            195

        Value196 ->
            196

        Value197 ->
            197

        Value198 ->
            198

        Value199 ->
            199

        Value200 ->
            200

        Value201 ->
            201

        Value202 ->
            202

        Value203 ->
            203

        Value204 ->
            204

        Value205 ->
            205

        Value206 ->
            206

        Value207 ->
            207

        Value208 ->
            208

        Value209 ->
            209

        Value210 ->
            210

        Value211 ->
            211

        Value212 ->
            212

        Value213 ->
            213

        Value214 ->
            214

        Value215 ->
            215

        Value216 ->
            216

        Value217 ->
            217

        Value218 ->
            218

        Value219 ->
            219

        Value220 ->
            220

        Value221 ->
            221

        Value222 ->
            222

        Value223 ->
            223

        Value224 ->
            224

        Value225 ->
            225

        Value226 ->
            226

        Value227 ->
            227

        Value228 ->
            228

        Value229 ->
            229

        Value230 ->
            230

        Value231 ->
            231

        Value232 ->
            232

        Value233 ->
            233

        Value234 ->
            234

        Value235 ->
            235

        Value236 ->
            236

        Value237 ->
            237

        Value238 ->
            238

        Value239 ->
            239

        Value240 ->
            240

        Value241 ->
            241

        Value242 ->
            242

        Value243 ->
            243

        Value244 ->
            244

        Value245 ->
            245

        Value246 ->
            246

        Value247 ->
            247

        Value248 ->
            248

        Value249 ->
            249

        Value250 ->
            250

        Value251 ->
            251

        Value252 ->
            252

        Value253 ->
            253

        Value254 ->
            254

        Value255 ->
            255
