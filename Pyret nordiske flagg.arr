use context essentials2021
fun flagg(Rektangel1, Rektangel2, Rektangel3, Rektangel4, Bakgrunn):
  frame(
    overlay-xy(rectangle(400, 25, "solid", Rektangel1), 0, -113,
      overlay-xy(rectangle(25, 250, "solid", Rektangel2), -137, 0,
        overlay-xy(rectangle(50, 250, "solid", Rektangel3), -125, 0,
          overlay-xy(rectangle(400, 50, "solid", Rektangel4), 0, -100,
            rectangle(400, 250, "solid", Bakgrunn))))))
end
# Funksjon for å definere størrelse på de div. rektangelene man trenger for å tegne ett flagg med kors i. Definert "flagg" som ett rektangel bestående av 5 rektangler (1 hoved bakgrunn). Bestemt størrelse på rektanglene og brukt overlay-xy for å bestemme hvor rektanglene skal plasseres i bakgrunnen ved hjelp av kordinater.

flagg("dark-blue", "dark-blue", "white", "white", "crimson")
flagg("yellow", "yellow", "yellow", "yellow", "steel-blue")
flagg("red", "red", "white", "white", "medium-blue")
flagg("white", "white","red","red", "red")
flagg("Darkblue", "Darkblue", "Darkblue", "Darkblue", "white")
flagg("red", "red", "royal-blue", "royal-blue", "white")

# Definert hvordan flagget skal se ut ved hjelp av å bruke farger. Fargene skrives i rekkefølge slik det er blitt definert i funksjonen. Hvis man ønsker at rektangel 1 skal være "blue" må det skrives først i setningen. Studerte fargene i flaggene nøye og brukt de fargene pyret tilbyr som passer flaggene best mulig. 

