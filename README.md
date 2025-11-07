# City Mayor Game 🏙️

Miesto mero simuliatorius - OOP kurso projektas.

## 📝 Aprašymas
Žaidėjas valdo mažą miestą, priimdamas sprendimus dėl resursų paskirstymo ir infrastruktūros statybos.

## 🎮 Kaip žaisti
1. Atidarykite projektą Godot 4.x
2. Paleiskite `scenes/main.tscn`
3. Spauskite mygtukus norėdami priimti sprendimus

## 🎯 Žaidimo tikslai
- **Laimėjimas:** Išgyventi 15 turų
- **Pralaimėjimas:** Bankrutuoti arba per daug sumažinti gyventojų laimę

## 📊 Sprendimai
- **Statyti parką** - Kainuoja 10,000€ | +Laimė +Aplinka
- **Statyti policijos nuovadą** - Kainuoja 15,000€ | +Saugumas -Laimė
- **Didinti mokesčius** - Gauna 8,000€ | -Laimė
- **Praleisti turą** - Nieko nedaryti

## 🎲 Atsitiktiniai įvykiai
- Gaisras (-5,000€, -laimė, -saugumas)
- Protestas (-laimė, -saugumas)

## 🏗️ OOP Koncepcijos
- **Inheritance:** Decision klasės, RandomEvent klasės
- **Encapsulation:** Privatūs City kintamieji su getteriais
- **Polymorphism:** Skirtingų tipų Decision objektai
- **Abstraction:** Bazinės Decision ir RandomEvent klasės

## 🎨 Design Patterns
- **Factory Pattern:** DecisionFactory kuria decision objektus
- **Strategy Pattern:** EventStrategy generuoja atsitiktinius įvykius

## 🧪 Unit Testai
6 unit testai naudojant GUT (Godot Unit Test) framework.

## 🛠️ Technologijos
- Godot Engine 4.x
- GDScript
- GUT (testing framework)
