read1month <- function(file) {
  file %>%
    fread(sep=",", header=TRUE, encoding = "UTF-8") %>%
    mutate(ChanDoanRa=stri_trans_general(ChanDoanRa, id = "Latin-ASCII"),
           ChanDoanPhuRa=stri_trans_general(ChanDoanPhuRa, id = "Latin-ASCII"),
           TinhTrangRa=stri_trans_general(TinhTrangRa, id = "Latin-ASCII")) %>%
    mutate(NgayVaovien=as.Date(NgayVaovien,
                               format="%m/%d/%Y"),
           NgayRavien=as.Date(NgayRavien,
                              format="%m/%d/%Y"),
           month_yr=format(NgayVaovien, "%Y-%m"),
           GenID=gsub(paste0("^(.{", 0, "})(.*)$"),
                      paste0("\\1", "HN32", "\\2"),
                      Countba+11)) %>% 
    filter(!is.na(NgayVaovien),!is.na(NgayRavien)) 
}


dth_admin_jun20 <- read1month("~/32HN ITS/32HN-ITS/DTH Data/32HN_ITS_DTH_Admin_from 2020Jun to 2021May.txt")
dth_admin_jun21 <- read1month("~/32HN ITS/32HN-ITS/DTH Data/32HN_ITS_DTH_Admin_discharge from Jun2021.txt")

