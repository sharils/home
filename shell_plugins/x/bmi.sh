#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

bmi() {
  if [ $1 -eq 21 ] && [ $# -eq 2 ]; then
    printf 'H: %s, W: %s–%s %s, BMI: %s' \
      "$2" \
      "$(bc --mathlib --expression="scale=2; 21*($2/100)^2")" \
      "$(bc --mathlib --expression="scale=2; 21.7*($2/100)^2")" \
      "$(bc --mathlib --expression="scale=2; 21.35*($2/100)^2")" \
      "$1"

  elif [ $1 -ne 21 ]; then
    cat <<'EOF'
Underweight (Severe thinness)    < 16.0
Underweight (Moderate thinness)  16.0 – 16.9
Underweight (Mild thinness)      17.0 – 18.4
Normal range                     18.5 – 24.9
Overweight (Pre-obese)           25.0 – 29.9
Obese (Class I)                  30.0 – 34.9
Obese (Class II)                 35.0 – 39.9
Obese (Class III)                ≥ 40.0
EOF
    echo
    printf 'H: %s, W: %s, BMI: %s (Normal 18.5 – 24.9)' "$1" "$2" "$(bc --mathlib --expression="scale=2; $2 / ($1 / 100)^2")"

  elif [ $1 -eq 21 ] && [ $# -eq 1 ]; then
    cat <<'EOF'
H    W
140  41–43
141  42–43
142  42–44
143  43–44
144  43–45
145  44–46
146  45–46
147  45–47
148  46–48
149  47–48
150  47–49
150  47–49
151  48–49
152  49–50
153  49–51
154  50–51
155  50–52
156  51–53
157  52–53
158  52–54
159  53–55
160  54–56
161  54–56
162  55–57
163  56–58
164  56–58
165  57–59
166  58–60
167  59–61
168  59–61
169  60–62
170  61–63
171  61–63
172  62–64
173  63–65
174  64–66
175  64–66
176  65–67
177  66–68
178  67–69
179  67–70
180  68–70
181  69–71
182  70–72
183  70–73
184  71–73
185  72–74
186  73–75
187  73–76
188  74–77
189  75–78
190  76–78
191  77–79
192  77–80
193  78–81
194  79–82
195  80–83
196  81–83
197  81–84
198  82–85
199  83–86
200  84–87
EOF

  fi
}

bmi "$@"
