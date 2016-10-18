FROM ubuntu:16.04
MAINTAINER dreamcat4 <dreamcat4@gmail.com>

ENV _clean="rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*"
ENV _apt_clean="eval apt-get clean && $_clean"


# 1. Set Timezone
RUN mkdir -p /config/.etc/ && echo "Europe/Berlin" > /config/.etc/timezone

# 2. Set locale - change 'en_US.UTF-8' --> the correct one for your county / region
# 2b. You will also need to specify the locale at run time e.g. `docker run -e LANG="en_US.UTF-8" ...`
ENV LANG="en_GB.UTF-8"

RUN apt-get update -qqy && apt-get install -qqy locales && $_apt_clean \
 && grep "$LANG" /usr/share/i18n/SUPPORTED >> /etc/locale.gen && locale-gen \
 && update-locale LANG=$LANG

# 3. Must always move the lang files into '/config dir', where dreamcat4/deluge expects
RUN mkdir -p /config/.link/usr/lib/ /config/.link/etc \
 && mv /usr/lib/locale /config/.link/usr/lib/ \
 && mv /etc/locale.gen /config/.link/etc


# 4. Populate the Tvheadend Config Folder with the config pieces you need

# Instructions:
# a. Run the cmd './print-config' in the build folder, to show all available ADD cmds
# b. Paste the output of './print-config' in here. Comment out the ones you don't require
# c. Create your own config pieces for tvheadend - must be taken from an existing setup


# EXAMPLE for a generic 'UK' setup
#ADD config/backup/unknown.tar.bz2+ /config/
#ADD config/dvr/recordings+ /config/
#ADD config/epg/ota/uk+ /config/
#ADD config/global/language/uk+ /config/
#ADD config/users/admin+ /config/

RUN mkdir -p /config/.xmltv/
ADD config/tv_grab_eu_egon.conf /config/.xmltv/tv_grab_eu_egon.conf
RUN chown -R 9981:9981 /config/.xmltv


# Default parts - don't change this bit
VOLUME /config
ENTRYPOINT ["/bin/echo","/config volume for the dreamcat4/tvheadend image"]


