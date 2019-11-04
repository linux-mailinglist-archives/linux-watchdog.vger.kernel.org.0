Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A459AEE177
	for <lists+linux-watchdog@lfdr.de>; Mon,  4 Nov 2019 14:45:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727782AbfKDNpb (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 4 Nov 2019 08:45:31 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:40989 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727663AbfKDNpb (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 4 Nov 2019 08:45:31 -0500
Received: by mail-lf1-f66.google.com with SMTP id j14so12280658lfb.8
        for <linux-watchdog@vger.kernel.org>; Mon, 04 Nov 2019 05:45:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NHq8wVmw+cjPCCjcl7EdD3hOeqo6OXvWMReV9D2ww2o=;
        b=sIrQwB60nJXfN7/9uPBf3WTPp8gB6DN9UIaXQBsd3W5xLWou261GvTzv0wh8ENmpUa
         v+9ZEo1MNDpeXW7pgwzznsjiMMWqck+u2YJajXK6mEKpIXjFVNtuJlXlJdDqv7IoRZNP
         tYwZIp+jB6FBPvT9uEarm3uKqbROqR1G41PgPPPcymiGQTzxJYOnJMRG58iTk41JU1BU
         lTygoQ3xqcUJsr5ogGNAQhtNSINhUmAGFdIXBuF49owOymeVMV8/odrSmYv81ixbEgU2
         1B68+pkgKwO8Fbnm2kyDMgvmJhjYyOnjYHn8DFu4kae2xWT0h/3slQYkKqCyGkWfVHCQ
         yyzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NHq8wVmw+cjPCCjcl7EdD3hOeqo6OXvWMReV9D2ww2o=;
        b=JwxWOO0NreZpelXMZigPdHT9BgEuvxllJ54PLvPAb3fpYshiOthlQ6xdVMvWeRt2SY
         +bEBKyl+Ra9ruXSKhiqpECCgFkBkZEYhsjJzH3hvTGbY2NRPxOCjDQX2ky8jsBm3YWi8
         afLLtP8zPZCy7U7n+sa7DDoLQrsMw3AopZFmskxSpeqf3Z143d6JqMav/hHd5jgjmRL0
         EU3LwTI5IybiU9awaIJDPuPIYLIHeLwi0ff0doNHxT8sVIdwDAvil+NzUcO6UPMoLjwI
         9SUGEEzS8c+b5gDK7H5tIflP+3ygfmpcymtMqpgdClpF+WVaQb7XB4R5ZbBCm2S/c6j3
         aB+w==
X-Gm-Message-State: APjAAAUUEHau6i9kPGKgifJlRYEnE6coJzYIqeITwO2k9a6G7J1721Gh
        LOIOY1VYFiWlim7G6HsEz+3JCseXmKH0qAaKIh8=
X-Google-Smtp-Source: APXvYqwqckCNM7MlPs1MopU83fu8QVrGHNRpgclFlfBQlqytbgSp4m5zX1kab3JFiuWILMJB7FAKC6qHoIbB/MDxFdo=
X-Received: by 2002:a19:6759:: with SMTP id e25mr16110325lfj.80.1572875128743;
 Mon, 04 Nov 2019 05:45:28 -0800 (PST)
MIME-Version: 1.0
References: <20191029174037.25381-1-festevam@gmail.com> <20191102153631.GA5514@roeck-us.net>
In-Reply-To: <20191102153631.GA5514@roeck-us.net>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Mon, 4 Nov 2019 10:45:18 -0300
Message-ID: <CAOMZO5AvCHo6pOfX32Bz-r8AjmbuqFWc5YUho9S1Gz8Tdo2SBA@mail.gmail.com>
Subject: Re: [PATCH 1/5] watchdog: imx7ulp: Fix reboot hang
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        Yongcai Huang <Anson.Huang@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Sascha Hauer <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Guenter,

On Sat, Nov 2, 2019 at 12:36 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Tue, Oct 29, 2019 at 02:40:33PM -0300, Fabio Estevam wrote:
> > The following hang is observed when a 'reboot' command is issued:
> >
> > # reboot
> > # Stopping network: OK
> > Stopping klogd: OK
> > Stopping syslogd: OK
> > umount: devtmpfs busy - remounted read-only
> > [    8.612079] EXT4-fs (mmcblk0p2): re-mounted. Opts: (null)
> > The system is going down NOW!
> > Sent SIGTERM to all processes
> > Sent SIGKILL to all processes
> > Requesting system reboot
> > [   10.694753] reboot: Restarting system
> > [   11.699008] Reboot failed -- System halted
> >
> > Fix this problem by adding a .restart ops member.
> >
> > Fixes: 41b630f41bf7 ("watchdog: Add i.MX7ULP watchdog support")
> > Signed-off-by: Fabio Estevam <festevam@gmail.com>
>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
>
> However, just to be sure: This registers the watchdog based restart handler
> as restart handler of last resort. I assume this on purpose, I just want
> to make sure it is intentional since it is not explicitly mentioned in
> the commit message.

To be honest, I thought that registering the restart handler was mandatory.

By the way, I have just noticed that even though this patch fixes the
reboot on a imx7ulp evk board, it does not work on a imx7ulp com
board.

I will debug this, so please discard this patch for now. The other
ones of this series should be fine to apply.

Thanks
