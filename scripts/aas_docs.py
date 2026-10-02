#!/usr/bin/env python3
"""Gera índices dos documentos AAS usados pelas skills e agents.

Uso:
    aas_docs.py constraints "<docs>/AAS Specifications"
    aas_docs.py catalog     "<docs>/AAS Submodel Templates"
"""
import collections
import json
import os
import re
import sys

SPEC_TXT = {
    "IDTA-01001": "Part1_Metamodel.txt",
    "IDTA-01002": "Part2_API.txt",
    "IDTA-01003-a": "Part3a_DataSpec_IEC61360.txt",
    "IDTA-01003-b": "Part3b_DataSpec_UoM.txt",
    "IDTA-01004": "Part4_Security.txt",
    "IDTA-01005": "Part5_AASX.txt",
}


def constraints(spec_dir: str) -> None:
    """Extrai as constraints de Part1_Metamodel.txt para constraints.md."""
    text = open(os.path.join(spec_dir, "Part1_Metamodel.txt"), encoding="utf-8").read()
    lines = text.split("\n")
    changes = next((i for i, l in enumerate(lines) if l.startswith("Changes V3")), len(lines))
    body = "\n".join(lines[:changes])
    flat = re.sub(r"[ \t]+", " ", text)

    found = {}
    for m in re.finditer(
        r"Constraint (AAS[a-z]{1,3}-\d{3}[a-z]?):\s*(.{0,600}?)(?=\n\s*\n|Constraint AAS|\f)", flat, re.S
    ):
        key, desc = m.group(1), " ".join(m.group(2).split())
        if key not in found or len(desc) > len(found[key]):
            found[key] = desc
    # só definições ("Constraint AASd-xxx:"), não menções em exemplos ("violates Constraint AASd-xxx.")
    active = set(re.findall(r"Constraint (AASd-\d{3}[a-z]?):", body))

    out = [
        "# Constraints do metamodelo AAS (IDTA-01001)",
        "",
        "Gerado por `scripts/aas_docs.py constraints`. **ativa** = aparece no corpo normativo "
        "(antes do anexo de mudanças); **removida/histórica** = só no histórico. AASc são da Parte 3a "
        "e AASs da Parte 4. Confirme no PDF antes de citar.",
        "",
        "| ID | Status | Texto (resumido) |",
        "|---|---|---|",
    ]
    for k in sorted(found):
        if k.startswith("AASc"):
            status = "Parte 3a"
        elif k.startswith("AASs"):
            status = "Parte 4"
        else:
            status = "ativa" if k in active else "removida/histórica"
        out.append(f"| {k} | {status} | {found[k][:230].replace('|', '/')} |")
    path = os.path.join(spec_dir, "constraints.md")
    open(path, "w", encoding="utf-8").write("\n".join(out) + "\n")
    print(f"{path}: {len(found)} constraints, {len([k for k in found if k in active])} ativas")


def catalog(smt_dir: str) -> None:
    """Gera CATALOG.md a partir de repo/published/."""
    published = os.path.join(smt_dir, "repo", "published")
    groups = collections.OrderedDict()
    for root, _, files in os.walk(published):
        if not any(f.endswith((".aasx", ".json", ".pdf")) for f in files):
            continue
        rel = os.path.relpath(root, published).split(os.sep)
        depth = 2 if rel[0] == "Digital Battery Passport" else 1
        name, version = "/".join(rel[:depth]), ".".join(rel[depth:]) or "-"
        semantic_id = ""
        for f in sorted(files):
            if not f.endswith(".json"):
                continue
            try:
                data = json.load(open(os.path.join(root, f), encoding="utf-8-sig"))
                keys = data["submodels"][0]["semanticId"]["keys"]
                semantic_id = keys[0]["value"]
                break
            except Exception:  # noqa: BLE001 - arquivos fora do padrão são ignorados
                continue
        groups.setdefault(name, []).append((version, semantic_id))

    out = [
        "# Catálogo de Submodel Templates (IDTA)",
        "",
        "Gerado por `scripts/aas_docs.py catalog` a partir de `repo/published/` "
        "(github.com/admin-shell-io/submodel-templates).",
        "",
        "| Template | Versões | semanticId (mais recente) |",
        "|---|---|---|",
    ]
    for name, versions in sorted(groups.items(), key=lambda x: x[0].lower()):
        sid = next((s for _, s in reversed(versions) if s), "")
        out.append(f"| {name} | {', '.join(v for v, _ in versions)} | {f'`{sid}`' if sid else ''} |")
    path = os.path.join(smt_dir, "CATALOG.md")
    open(path, "w", encoding="utf-8").write("\n".join(out) + "\n")
    print(f"{path}: {len(groups)} templates")


if __name__ == "__main__":
    if len(sys.argv) != 3 or sys.argv[1] not in ("constraints", "catalog"):
        sys.exit(__doc__)
    {"constraints": constraints, "catalog": catalog}[sys.argv[1]](sys.argv[2])
