[#ftl]
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

<div class="container">
    <div class="vek-chyba">
        <h1>Děkujeme!</h1>
        <div>${form.jmeno} ${form.prijmeni} byl/a zařazen/a do tábora v termínu [#if turnus == "TURNUS_1"]5.-11.7.2026.
            [#elseif turnus == "TURNUS_2"] 12.-18.7.2026. [#elseif turnus == "TURNUS_2"]19.-25.7.2026.[/#if]
            [#if form.email??]
                Na e-mail ${form.email} byly zaslány informace o objednávce.
            [/#if]
            Těšíme se!
        </div>
    </div>
</div>
</body>
</html>