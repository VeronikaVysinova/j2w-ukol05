[#ftl]
[#import "/spring.ftl" as spring]
<!DOCTYPE html>
<html lang="cs">
<head>
    <meta charset="UTF-8">
    <title>Registrace na letní dětský tábor</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" type="image/png" href="/images/favicon.png">
    <link rel="stylesheet" href="/css/style.css" />
</head>
<body>
<main>
    <h1 style="text-align: center">Registrace na letní dětský tábor</h1>
    <form action="/objednano" method="post" class="form">

        <div class="mb-3">
            <label for="jmeno" class="form-label">Jméno</label>
            <p>${form.jmeno}</p>
            <input type="hidden" class="form-control" id="jmeno" name="jmeno" value="${form.jmeno}" readonly>
        </div>


        <div class="mb-3">
            <label for="prijmeni" class="form-label">Příjmení</label>
            <p>${form.prijmeni}</p>
            <input type="hidden" class="form-control" id="prijmeni" name="prijmeni" value="${form.prijmeni}"readonly>
        </div>


        <label>Datum narození</label>
        <p>${form.datumNarozeni?string("dd. MM. yyyy")}</p>
        <input type="hidden" name="datumNarozeni" value="${form.datumNarozeni?string("yyyy-MM-dd")}">


        <div class="form-label">
            <label class="form-label">Pohlaví</label>
            <p>${form.pohlavi?capitalize}</p>
            <input type="hidden" name="pohlavi" value="${form.pohlavi}">
        </div>

        <div class="radek">Turnus</div>
        <p>
            [#list TurnusEnum as turnus]
                [#if form.turnus?? && form.turnus?string == turnus?string]
                    ${turnus.datum}
                [/#if]
            [/#list]
        </p>
        <input type="hidden" name="turnus" value="${form.turnus?string}" readonly>


        <div class="mb-3">
            <label for="email" class="form-label">Email</label>
            <p>${form.email}</p>
            <input type="hidden" class="form-control" id="email" name="email" value="${form.email}" readonly>
        </div>


        <div class="mb-3">
            <label for="telefon" class="form-label">Telefon</label>
            <p>${form.telefon}</p>
            <input type="hidden" class="form-control" id="telefon" name="telefon" value="${form.telefon}" readonly>
        </div>



        <button type="submit" name="submit" class="btn btn-primary">Odeslat</button>

       <button type="submit" formaction="/formular" name="cancel" class="btn btn-primary">Upravit</button>

    </form>
</main>
</body>
</html>