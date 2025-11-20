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
        <form action="/" method="post" clas="form">

            <div class="mb-3">
                <label for="jmeno" class="form-label">Jméno</label>
                <input type="text" class="form-control" id="jmeno" name="jmeno" required>
            </div>
            [@spring.bind "form.jmeno"/]
            <div class="error">[@spring.showErrors "<br>"/]</div>



            <div class="mb-3">
                <label for="prijmeni" class="form-label">Příjmení</label>
                <input type="text" class="form-control" id="prijmeni" name="prijmeni" required>
            </div>
            [@spring.bind "form.prijmeni"/]
            <div class="error">[@spring.showErrors "<br>"/]</div>



            <label for="datumNarozeni">Datum narození</label>
            <input type="date" id="datumNarozeni" name="datumNarozeni" required>
            [@spring.bind "form.datumNarozeni"/]
            <div class="error">[@spring.showErrors "<br>"/]</div>



            <div class="form-label">
                <label for="pohlavi" class="form-label">Pohlaví</label>
                <select id="pohlavi" name="pohlavi" class="form-select" required>
                    <option value="" [#if !form.pohlavi?has_content]selected[/#if]>– vyberte –</option>

                    [#list PohlaviEnum as item]
                        <option value="${item}" [#if form.pohlavi?has_content && form.pohlavi == item]selected[/#if]>
                            ${item?capitalize}
                        </option>
                    [/#list]
                </select>
                [@spring.bind "form.pohlavi"/]
                <div class="error">[@spring.showErrors"<br>"/]</div>
            </div>

            <div class="radek">Turnus</div>
            <div class="skupina-horizontal">
                [#list TurnusEnum as turnus]
                    <div class="turnus-volba">
                        <input required type="radio" name="turnus" id="${turnus?string}" value="${turnus?string}"
                               [#if form.turnus?? && form.turnus?string == turnus?string]checked[/#if]/>
                        <label for="${turnus?string}">${turnus.datum}</label>
                    </div>
                [/#list]
            </div>

            [@spring.bind "form.turnus"/]
            <div class="error">[@spring.showErrors"<br>"/]</div>



            <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <input type="email" class="form-control" id="email" name="email" placeholder="example@example.com" >
            </div>


            <div class="mb-3">
                <label for="telefon" class="form-label">Telefon</label>
                <input type="tel" class="form-control" id="telefon" name="telefon" placeholder="+xx xxx xxx" >
            </div>



            <button type="submit" class="btn btn-primary">Rekapitulace</button>


        </form>
    </main>
</body>
</html>
