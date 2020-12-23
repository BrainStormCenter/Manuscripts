#	Need to compare mood pre positive by group
#	Need to compare mood pre negative by group
#	Need to compare mood post positive by group
#	Need to compare mood post negative by group

##			USED FOR FINDING ORIGINAL VARIABLES		##
colnames(select(dat1, contains("mood")))
colnames(select(dat1, contains("cond")))

dat1 %>% count(group.factor)

v1Pos1_dat <- dat1 %>%
	filter(v1mood.factor == "PosV1")
v1Pos1_dat %>% count(group.factor)
v1Pos1_dat2 %>% count(gp)

v1Pos1_dat <- dat1 %>% dplyr::select("ID","group.factor",
									 "v1mood.factor",
									 "visit1moodpre"
)


v1Pos1_dat <- v1Pos1_dat %>%
	filter(v1mood == "PosV1") %>%
	filter(visit1moodpre != "NA")



view(v1Pos1_dat)
view(v1Pos1_dat2)

names(v1Pos1_dat)[names(v1Pos1_dat) == 'group.factor'] <- 'gp'
names(v1Pos1_dat)[names(v1Pos1_dat) == 'v1mood.factor'] <- 'v1mood'

#		Converting data to long format
dat2 <- dat1 %>% dplyr::select("ID", "group.factor",
							   "v1.mood", "v2.mood",
							   "visit1moodpre", "visit1moodpost",
							   # contains("mood")
							   "visit2moodpre", "visit2moodpost"
)

# dat1  <- filter(dat1, group.factor != 0, dat1$bdi1 != "NA")
dat2 <- filter(dat2, dat2$visit1moodpre != "NA")

dat2$ID <- factor(dat2$ID) # ID must be a factor

dat2 %>% count(group.factor)



