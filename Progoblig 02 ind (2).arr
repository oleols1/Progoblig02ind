use context essentials2021

include shared-gdrive("dcic-2021", "1wyQZj_L0qqV9Ekgr9au6RX2iqt2Ga8Ep")
include gdrive-sheets
include data-source
ssid = "1RYN0i4Zx_UETVuYacgaGfnFcv4l9zd9toQTTdkQkj7g"

kWh-wealthy-consumer-data = load-table: komponent, energi
  source: load-spreadsheet(ssid).sheet-by-name("kWh", true)
  sanitize energi using string-sanitizer
end

fun energi-to-number(s :: String) -> Number:
  cases(Option) string-to-number(s):
    | some(a) => a
    | none=> 0
  end
# gjør om verdier til strings og sanitizer energi med string-sanitizer
where:
  energi-to-number("") is 0
  energi-to-number("30") is 30
  energi-to-number("37") is 37
  energi-to-number("5") is 5
  energi-to-number("4") is 4 
  energi-to-number("15") is 15
  energi-to-number("48") is 48
  energi-to-number("12") is 12 
  energi-to-number("4") is 4 
end

# oppdatert tabell med nummer i energi row
kWh-wealthy-consumer-data
ny_tabell = transform-column(kWh-wealthy-consumer-data, "energi", energi-to-number)
ny_tabell

# summerer verdiene i energi kolonne
fun sum-on-energi():
  t = transform-column(kWh-wealthy-consumer-data, "energi", energi-to-number)
  sum(t, "energi")
  end
sum-on-energi()

# visualisert tabellen uten bil komponent
bar-chart(ny_tabell, "komponent", "energi")

# funksjon beregner energiforbruket for bil
fun energy-per-day-car(distance-travelled-per-day, distance-per-unit-of-fuel, energy-per-unit-of-fuel):
  (distance-travelled-per-day / distance-per-unit-of-fuel) * energy-per-unit-of-fuel
where:
  energy-per-day-car(20, 10, 5) is 10
end
distance-travelled-per-day2 = 20
distance-per-unit-of-fuel2 = 10
energy-per-unit-of-fuel2 = 5

# summerer på nytt verdier i energi kolonne nå oppdatert med energi for bilforbruk
total-energy-consumption = sum(ny_tabell, "energi") + energy-per-day-car(distance-travelled-per-day2, distance-per-unit-of-fuel2, energy-per-unit-of-fuel2)

total-energy-consumption

fun energi-to-number-with-car(str :: String) -> Number:
  cases(Option) string-to-number(str):
    | some(a) => a
    | none => energy-per-day-car(20, 10, 5)
  end
where:
  energi-to-number("") is 0
  energi-to-number("48") is 48
end
# Lagd ny tabell med riktig energiforbruk for "bil" kategorien
  ny_tabell_med_bil = transform-column(kWh-wealthy-consumer-data, "energi", energi-to-number-with-car)
ny_tabell_med_bil

# visualiserer tabellen igjen, nå med verdiene for bilforbruk
bar-chart(ny_tabell_med_bil, "komponent", "energi")




      