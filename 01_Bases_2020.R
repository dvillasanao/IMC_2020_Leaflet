# Librerías
require(openxlsx)
require(dplyr)

# Base a nivel colonia
IMC_2020 <- read.xlsx("Data/IMC_2020.xlsx", sheet = "IMC_2020") %>%
             select(CVE_COL, NOM_COLONIA, NOM_ENT, NOM_MUN, POB_TOT, P6A14NAE,	SBASC,	PSDSS,	OVSDE,	OVSEE,	OVSAE,
                    OVPT,	OVHAC,	OVSREF,	OVSINT,	OVSCEL,	IM_2020,	GM_2020,	IMN_2020) %>%
               mutate(across(.cols = 5, ~formatC(.x, digits = 0, format = "f"))) %>%
                mutate(across(.cols = 6:16, ~formatC(.x, digits = 2,format = "f"))) %>%
                 mutate(across(.cols = c(17,19), ~formatC(.x, digits = 2, format = "f"))) %>%
                  mutate_at(.vars = c(5:17, 19), as.numeric) 

save(IMC_2020, file = "Output/IMC_2020.RData")
str(IMC_2020)
