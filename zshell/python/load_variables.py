#!/usr/bin/env python3
import json
import os

ZVARFILE = os.environ.get("ZVARFILE")
DOT_ZVARFILE = os.environ.get("DOT_ZVARFILE")

if os.path.isfile(ZVARFILE):
    sh = "#!/usr/bin/env zsh\n"
    try:
        with open(ZVARFILE, "r") as f:
            jd = json.load(f)
            for k, v in jd.items():
                if k.startswith("//"):
                    var_name = f"{k[2:].upper()}"
                else:
                    var_name = f"ZSH_VAR_{k.upper()}"
                sh += f'''export {var_name}="{v}"\n'''

    except Exception as e:
        print(e)

    else:
        with open(DOT_ZVARFILE, "w") as f:
            f.write(sh)


