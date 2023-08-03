read1month <- function(file) {
  file %>%
    fread(sep=",", header=TRUE, encoding = "UTF-8") %>%
    mutate(across(c("ChanDoanRa", "ChanDoanPhuRa", "TinhTrangRa")),
           stri_trans_general, id = "Latin-ASCII") %>%
    mutate(across(c("NgayVaovien", "NgayRavien")), as.Date, format="%m/%d/%Y") %>%
    mutate(month_yr=format(NgayVaovien, "%Y-%m"),
           GenID=gsub(paste0("^(.{", 0, "})(.*)$"),
                      paste0("\\1", "HN32", "\\2"),
                      Countba+11)) %>% 
    filter(!is.na(NgayVaovien),!is.na(NgayRavien)) 
}


dth_admin_jun20 <- read1month(here::here("DTH Data", "32HN_ITS_DTH_Admin_from 2020Jun to 2021May.txt"))
dth_admin_jun21 <- read1month(here::here("DTH Data", "32HN_ITS_DTH_Admin_discharge from Jun2021.txt"))





