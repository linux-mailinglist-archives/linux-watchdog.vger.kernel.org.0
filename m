Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D7485925A7
	for <lists+linux-watchdog@lfdr.de>; Sun, 14 Aug 2022 18:56:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241958AbiHNQ4s (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 14 Aug 2022 12:56:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242170AbiHNQ4g (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 14 Aug 2022 12:56:36 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EE9520C
        for <linux-watchdog@vger.kernel.org>; Sun, 14 Aug 2022 09:45:13 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id bv3so6615291wrb.5
        for <linux-watchdog@vger.kernel.org>; Sun, 14 Aug 2022 09:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=a/dxPKPN4fhcrwTrBaC3Hq/b1uExDnZHuLhB57AI+i8=;
        b=ImfMMcsjIom0g+PMWXwRCd5fALa+ewij7aHto1lqvV1289wiaDELyx8TGWZKpF4Hch
         XoNLnZhPX8ts57k4fyMjfNkZV9Ch8Lf97yQGhkcOiqZJxJkpPPBc1NTYSmTZRWvF0ngO
         x1v3EBL8yywlJhQWH1BZ+3l6AUiNCxfvIekZThzoZc6oREqimsjvV+N/VP7ploAmvzHb
         NKgYK75tM4kooD+mxh3An4vGfM1NbLfLY2Znp/ghv33H5rcBoS5d5IpZ28Zlk2Nd0T3m
         d+Y0/GQD3Tuybo94mAhBAjFgp6QPs4L8mhJkv8SZVzslr4i43KsG9Jgg6kGPFa3WMq0S
         w6HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=a/dxPKPN4fhcrwTrBaC3Hq/b1uExDnZHuLhB57AI+i8=;
        b=fM5Bqfna75riGUFWvrfJczR8uodwLzP/oevNC0lucn5ttaG6969inxuBFtTthc1tbk
         3BtUtm2WhKFzpuR5jn1xvTiBXAhjviEEXI+6rD9UZ7crrF6yJu15CAha9kNOTzLmVbpb
         xgUimx05pSUGBqGWYr6Idb9+1HFoD5uKp1NXzahG9I1hdBSuPKxB1OC8hBYo4iQQIOu5
         gg4v3aXT5I3jyMmt3LZ2u0uuR/HI1E8XYKhN6aPCq5YhHYx+F3zjNXGNou2d5aq1lckj
         TmIT6rBQ+8U5JSaFEgmnRIXTEjgVyMhsCkJShuRF3EvVKi1KYjJ/3pwasVKtwpOo3yId
         VzXw==
X-Gm-Message-State: ACgBeo0Z76m+aDHIG6+8Utym9YzPqYJZopKiARD1jFuljRuRAyK1oLzb
        KPS6pVNimzsW3Fa7M9SwNHcAiQ+4Uqzx7luMnBbJ7u8jo5M=
X-Google-Smtp-Source: AA6agR4Wniq5EJXS6mpr2uGNmx4nEyT9ZrctGOWLrdkJ4A9i2GQr4ibVCYpqt3KrMAy8/6lUp6eLrUU7g2c5YdMej9s=
X-Received: by 2002:a5d:6e5d:0:b0:21f:1631:6dd4 with SMTP id
 j29-20020a5d6e5d000000b0021f16316dd4mr6489435wrz.535.1660495511795; Sun, 14
 Aug 2022 09:45:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAMeyCbiVVTmpV8pazAPLtew0yQSYeb5ykeHzCs_A=nBUK7d1bg@mail.gmail.com>
 <20569aac-b76b-0aa9-e716-0030fc37f265@roeck-us.net>
In-Reply-To: <20569aac-b76b-0aa9-e716-0030fc37f265@roeck-us.net>
From:   Kegl Rohit <keglrohit@gmail.com>
Date:   Sun, 14 Aug 2022 18:44:59 +0200
Message-ID: <CAMeyCbhCN18S4YD3qkb-rDcqxohH3_ieQFFRGSHcRotH1x1t4w@mail.gmail.com>
Subject: Re: rn5t618_wdt: WATCHDOG_NOWAYOUT not working
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Thanks for clarifying some parts.

> I'd rather assume that your usage pattern is one that no one ever tried
> before because it is quite unusual. Why enable NOWAYOUT just to violate
> it continuously ?
Why violate? NOWAYOUT should be a pretty straight forward kernel config...
When starting an in-place firmware update its quite useful to stop the
wdt before terminating all applications.
After the upgrade is done the applications and wdt are restarted.


> Anyway, I think you are a bit off track here.
> The register 0x13 should probably be volatile.

> However, register 0x0b is not updated by the chip and thus does not need =
to be volatile.
That right, but if regmap_read and regmap_write is cached then it
would be necessary to cause some read or write.
I did not find documentation about the regmap caching.
I am new to regmap, therefore i asked for others input.

For example this part:

/* The counter is restarted after a R/W access to watchdog register */
ret =3D regmap_read(wdt->rn5t618->regmap, RN5T618_WATCHDOG, &val);
if (ret)
return ret;
ret =3D regmap_write(wdt->rn5t618->regmap, RN5T618_WATCHDOG, val);

Will regmap_read always bypass the cache?
Will regmap_write always bypass the cache?
Then it is not needed to set 0x0b volatile.


> Replacing the various regmap_update_bits() with regmap_write() is just
> papering over the problem. To force the write to the chip even if nothing
> changed, regmap_write_bits() should be used instead of regmap_update_bits=
()
> where appropriate.

Will regmap_write_bits always bypass the cache?

If 0x13 is set volatile regmap_write_bits will always execute an I2C
read and write transmission?
This I2C read would be overhead in each ping(). The datasheet says an
IRQ can be reset by simply writing '0' to the corresponding bit.
Writing '1' to any other bits has no effect.
So I used regmap_write(wdt->rn5t618->regmap, RN5T618_PWRIRQ,
~RN5T618_PWRIRQ_IR_WDOG) to clear only the wdt irq bit and save a i2c
read transmission in each ping().


> That is probably also the core of the problem: rn5t618_wdt_start() calls
> regmap_update_bits(). Since no bit was changed, there is actually no writ=
e
> to the chip. Ultimately this causes a timeout since the watchdog is never
> stopped and the counter is never reset. To avoid that and to make
> sure that the counter is reset, it is probably sufficient to replace the
> regmap_update_bits() to enable the watchdog with regmap_write_bits().

You meant regmap_update_bits(wdt->rn5t618->regmap, RN5T618_PWRIRQ
(0x13), RN5T618_PWRIRQ_IR_WDOG, 0) in rn5t618_wdt_ping()?
No other function will reset the wdt irq status bit. And no other
function accesses the volatile RN5T618_PWRIRQ (0x13) register.
So regmap_update_bits RN5T618_PWRIREN (not RN5T618_PWRIRQ 0x13!)
usage in rn5t618_wdt_start is fine for me and the watchdog was stopped
as I stated!


> The read operation in rn5t618_wdt_ping() doesn't really do anything
> because the register value is cached. The read only happens to have
> a value to write.

So regmap_read(wdt->rn5t618->regmap, RN5T618_WATCHDOG, &val) is cached?
If it is cached and regmap_write(wdt->rn5t618->regmap,
RN5T618_WATCHDOG, val) is also cached then the counter will never be
reset.
But the ping is working and so one of them or both must be non cached.


> I can not follow your logic that that write could
> somehow be dangerous. It writes the value that is expected for the
> register. There is nothing dangerous about it. If there was indeed
> a problem, you would have to provide specifics; you can not just make
> such a claim without basis in fact.

My main point is the unnecessary additional I2C write or read
transmission. A single read or write of the register should be enough.

Dangerous is maybe somewhat overcautious. I2C is not the most reliable
thing, so if the write went wrong maybe the wdt will be disabled
without knowing.
So a read (+checking the enable bit) is in my opinion more defensive
than a read+write with zero checks. Only i2c transfer return code is
checked, not sure how reliable this is.


> The interrupt status register at 0x13 should probably be declared volatil=
e
> to avoid "loss" of interrupt status for other drivers. Clearing the inter=
rupt
> bit is only necessary to ensure that an expired interrupt is caught if th=
e
> 'ping' comes late. The same is true for the start function. In normal ope=
ration
> it should not be needed.

Ok, I have the same thought. The datasheet says something about an
additional 1 second until the wdt really fires.
And maybe if the irq is cleared before this additional second is
expired the pending wdt reset is cleared.
So it makes sense to reset the irq status in every ping to gain some
extra time e.g. if the wdt timeout is set to the minimum of 1 second.


> Either case, if you want your code to be considered, you'll have to split
> it into two patches, one for mfd and one for watchdog, and you'll have to=
 submit
> proper patches as outlined in Documentation/process/submitting-patches.rs=
t.

As I am not an expert and do not want to break some foreign code, I
only wanted to share my findings and get feedback if they are wrong.
It would be great if it gets fixed for everyone. There are some
reports online which are maybe facing the same issue, but could not
find the real cause.

On Sat, Aug 13, 2022 at 12:08 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 8/12/22 02:56, Kegl Rohit wrote:
> > Hello!
> >
> > Our board uses the RN5T567 as /dev/watchdog source via i2c communicatio=
n.
> > RN5T567 is using the rn5t618_wdt.c driver
> >
> > Our kernel has CONFIG_WATCHDOG_NOWAYOUT=3Dy enabled
> >
> > # Starting the wdt works as expected
> > echo -n '1' > /dev/watchdog
> >
> > # Stopping the wdt works as expected no reboot will be issued
> > echo -n 'V' > /dev/watchdog
> >
> > # Starting the wdt again will enable the wdt again
> > # BUT while the wdt is triggered every second the system reboots
> > while true; do echo -n '1' > /dev/watchdog; sleep 1; done
> >
> > Digging deeper into the issue I could find out that the remap is
> > initialized to cache the register accesses RN5T618_WATCHDOG (0x0b) and
> > RN5T618_PWRIRQ (0x13).
> >
> > So I expect that because of this caching the IRQ status bit was never r=
eset.
> > The status register must not be cached because its set by the RN5T567.
> > Also it is not ideal to cache the access to the watchdog register
> > which resets the counter via read write cycle.
> >
> > debugfs shows the regmap setting for these registers:
> > [root@imx7d /sys/kernel/debug]# cat regmap/0-0033/access
> > // third column means volatile yes or no
> > =E2=80=A6
> > 0b: y y n n
> > =E2=80=A6
> > 13: y y n n
> >
> > After marking these registers volatile, stopping the wdt and starting
> > again seems to work.
> >
> > Furthermore it is not necessary to do a RN5T618_WATCHDOG read AND
> > write cycle to reset the wdt counter.
> > The source code states:
> > /* The counter is restarted after a R/W access to watchdog register */
> >
> > The RN5T567 datasheet states:
> > =E2=80=9CThe count value of watchdog timer is cleared by accessing (R/W=
) to
> > this register.=E2=80=9D
> >
> > Tests showed that a single read is enough. I did not check other chip
> > variants which use the same driver.
> >
> > In my opinion a write cycle is even dangerous if there is some strange
> > situation and the write cycle disables the wdt or changes the wdt
> > settings stored in this register.
> >
> > I still don't know why the irq status bit is cleared on every ping()
> > but I kept it there.
> > Attached is my patch tested with RN5T567.
>
> It is sent as attachment and thus unusable. In addition to that, it is
> not a proper patch.
>
> > Is the rn5t618_wdt.c driver maintained? Strange that such issue was
> > never noticed.
>
> I'd rather assume that your usage pattern is one that no one ever tried
> before because it is quite unusual. Why enable NOWAYOUT just to violate
> it continuously ?
>
> Anyway, I think you are a bit off track here.
>
> The register 0x13 should probably be volatile. However, register 0x0b
> is not updated by the chip and thus does not need to be volatile.
>
> Replacing the various regmap_update_bits() with regmap_write() is just
> papering over the problem. To force the write to the chip even if nothing
> changed, regmap_write_bits() should be used instead of regmap_update_bits=
()
> where appropriate.
> That is probably also the core of the problem: rn5t618_wdt_start() calls
> regmap_update_bits(). Since no bit was changed, there is actually no writ=
e
> to the chip. Ultimately this causes a timeout since the watchdog is never
> stopped and the counter is never reset. To avoid that and to make
> sure that the counter is reset, it is probably sufficient to replace the
> regmap_update_bits() to enable the watchdog with regmap_write_bits().
>
> The read operation in rn5t618_wdt_ping() doesn't really do anything
> because the register value is cached. The read only happens to have
> a value to write. I can not follow your logic that that write could
> somehow be dangerous. It writes the value that is expected for the
> register. There is nothing dangerous about it. If there was indeed
> a problem, you would have to provide specifics; you can not just make
> such a claim without basis in fact.
>
> The interrupt status register at 0x13 should probably be declared volatil=
e
> to avoid "loss" of interrupt status for other drivers. Clearing the inter=
rupt
> bit is only necessary to ensure that an expired interrupt is caught if th=
e
> 'ping' comes late. The same is true for the start function. In normal ope=
ration
> it should not be needed.
>
> Either case, if you want your code to be considered, you'll have to split
> it into two patches, one for mfd and one for watchdog, and you'll have to=
 submit
> proper patches as outlined in Documentation/process/submitting-patches.rs=
t.
>
> Thanks,
> Guenter
