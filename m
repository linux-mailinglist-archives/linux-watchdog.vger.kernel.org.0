Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BECD0CD379
	for <lists+linux-watchdog@lfdr.de>; Sun,  6 Oct 2019 18:19:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726420AbfJFQTR (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 6 Oct 2019 12:19:17 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:46551 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726349AbfJFQTQ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 6 Oct 2019 12:19:16 -0400
Received: by mail-pg1-f196.google.com with SMTP id b8so338885pgm.13;
        Sun, 06 Oct 2019 09:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4frgni2vdysAeIB1TB0xly8wMKJ6GjANVDjC42JRG1w=;
        b=u1ggQJBGSpToQpIoT+WKk9WBuZb9a3IY9wjyHHIakKXo+T459NDFasQrS93DZHkPMF
         ZX2acTCUXafFR6gX3yPUJKltl9NPTGw/C8vkBK30JA9qpAxKgN611ArVXICtaK5cx6xw
         dpjVLDDwx60KMzXD9ILM8v5OQDyA07ixiZLSXFxuRYR8ye2AV/sGOeWgCf45ioLhXw/n
         zrLv2TJBIsdyRraBQXDDCQaLHgkcD5FYwUQVJzOCPhMU/aSei0VqLs97N3lq5mn9p0si
         fpOasYNmuLYKNwRw2asiKFelBIPfFaBd0OG24cd/eBUHJry4zKQTfE3ULdVugK7se1xO
         m1eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4frgni2vdysAeIB1TB0xly8wMKJ6GjANVDjC42JRG1w=;
        b=WvnmlcgYewI9L5l2K74qMs1BhzjNaxCQJNYRqqU6TuFDuwCPFR/W0tU/7XCLE3O66S
         dJRykIzmOc2Yix8L3ep1NGmzceeF8tX2v5KCr2zFARwTVBpYHPX+OB+2LXvXM66xuzLc
         rTQ1Q8s/1l24m8TOvz5+YJXXI9dBtNc4PJUl8zOnyArY0gFH4GKjoDlcBPrzUJgWvJIv
         kosxsrp1rJWb0iukNpxBYuri3qm201Ybv8eZFUJN0/nd7NiR1QMdUjcRVn00Y+QPdimi
         cGf+24WoKfru9eIIlfGIXQ68z6A1KkJZrLdjczzmjah0+jNf77EpO4WB7vxBJwTqi5Rm
         BWug==
X-Gm-Message-State: APjAAAX1eCXjkheI0cotvbMtoHCakV1rwnZBoMLUFMAu0UJjj7BXnrur
        hXB8Yw9HoPzVh+NAEVsYicBD1gDw
X-Google-Smtp-Source: APXvYqzeYB21gZzMjAfZ+DHIIy2O5PSx4hcLBVGiQeoXW2Ee4eMf2/UXbjWPVBFMGTl+RlDBg9H/sA==
X-Received: by 2002:a17:90a:d98c:: with SMTP id d12mr29153697pjv.88.1570378755178;
        Sun, 06 Oct 2019 09:19:15 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s17sm11544035pgg.77.2019.10.06.09.19.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 06 Oct 2019 09:19:14 -0700 (PDT)
Subject: Re: [PATCHv2] rtc: pcf2127: handle boot-enabled watchdog feature
To:     =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <martin@geanix.com>,
        Bruno Thomsen <bruno.thomsen@gmail.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20191003124849.117888-1-martin@geanix.com>
 <20191003133351.118538-1-martin@geanix.com>
 <CAH+2xPAtxcxd1xXuCmHc25X-Ai2_w-5rxZrgYbavjAzntMxX-Q@mail.gmail.com>
 <f741d1bd-bcde-d1e1-09b7-98bb6a30db33@roeck-us.net>
 <CC1D25DB-F95B-4110-809C-E8BE1493CDB7@geanix.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <403595f7-99b4-142d-b4ff-7c574a3974fa@roeck-us.net>
Date:   Sun, 6 Oct 2019 09:19:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CC1D25DB-F95B-4110-809C-E8BE1493CDB7@geanix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 10/6/19 8:58 AM, Martin Hundebøll wrote:
> 
> 
> On 6 October 2019 16.29.45 CEST, Guenter Roeck <linux@roeck-us.net> wrote:
>> On 10/6/19 2:07 AM, Bruno Thomsen wrote:
>>> Hi Martin,
>>>
>>> Den tor. 3. okt. 2019 kl. 15.33 skrev Martin Hundebøll
>> <martin@geanix.com>:
>>>>
>>>> Linux should handle when the pcf2127 watchdog feature is enabled by
>> the
>>>> bootloader. This is done by checking the watchdog timer value during
>>>> init, and set the WDOG_HW_RUNNING flag if the value differs from
>> zero.
>>>>
>>>> Signed-off-by: Martin Hundebøll <martin@geanix.com>
>>>> ---
>>>>
>>>> Change since v1:
>>>>    * remove setting of WDOG_HW_RUNNING in pcf2127_wdt_start()
>>>>
>>>>    drivers/rtc/rtc-pcf2127.c | 12 +++++++++++-
>>>>    1 file changed, 11 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
>>>> index cb3472f..4229915 100644
>>>> --- a/drivers/rtc/rtc-pcf2127.c
>>>> +++ b/drivers/rtc/rtc-pcf2127.c
>>>> @@ -420,6 +420,7 @@ static int pcf2127_probe(struct device *dev,
>> struct regmap *regmap,
>>>>                           const char *name, bool has_nvmem)
>>>>    {
>>>>           struct pcf2127 *pcf2127;
>>>> +       u32 wdd_timeout;
>>>>           int ret = 0;
>>>>
>>>>           dev_dbg(dev, "%s\n", __func__);
>>>> @@ -462,7 +463,6 @@ static int pcf2127_probe(struct device *dev,
>> struct regmap *regmap,
>>>>           /*
>>>>            * Watchdog timer enabled and reset pin /RST activated when
>> timed out.
>>>>            * Select 1Hz clock source for watchdog timer.
>>>> -        * Timer is not started until WD_VAL is loaded with a valid
>> value.
>>>
>>> Your patch does not change the fact that the watchdog timer is first
>>> started after loading a
>>> valid value into WD_VAL register. This driver can be used perfectly
>>> fine without enabling the
>>> watchdog feature from userspace. If someone chooses to reboot without
>>> stopping the watchdog
>>> it is of course expected to still run on next boot (e.g. device
>> probe).
>>>
>>>> +       /* Test if watchdog timer is started by bootloader */
>>>> +       ret = regmap_read(pcf2127->regmap, PCF2127_REG_WD_VAL,
>> &wdd_timeout);
>>>> +       if (ret) {
>>>> +               dev_err(dev, "%s: watchdog value (wd_wal) failed\n",
>> __func__);
>>>> +               return ret;
>>>> +       }
>>>> +
>>>> +       if (wdd_timeout)
>>>> +               set_bit(WDOG_HW_RUNNING, &pcf2127->wdd.status);
>>>> +
>>>
>>> I do not agree that this should be the default setting as
>>> WDOG_HW_RUNNING bit causes
>>> watchdog core to kick watchdog until userland takes over, e.g. you
>>> have just broken the
>>> chain-of-monitoring in the embedded Linux device:
>>>
>>> Hardware watchdog -> systemd -> daemon(s) / application(s)
>>>
>>> At this point in time you only know that u-boot / barebox can load
>> and
>>> start the kernel with
>>> a device tree blob.
>>>
>>> What if mounting of rootfs fails?
>>> What if systemd fails to start?
>>>
>>> When doing a reboot due to ex. firmware upgrade, systemd will keep
>>> kicking the watchdog
>>> until the last sec before restart handler is called and the hardware
>>> watchdog should not be
>>> touched before systemd is in control of the system again.
>>>
>>> Bruno
>>>
>>
>> This should not be decided on driver level. The intended means to
>> enforce
>> an initial timeout would be to set CONFIG_WATCHDOG_OPEN_TIMEOUT, or to
>> use
>> the open_timeout kernel parameter.
> 
> That, and WATCHDOG_HANDLE_BOOT_ENABLED
> 

To clarify: If WATCHDOG_HANDLE_BOOT_ENABLED is disabled, the watchdog core
does not ping the watchdog on its own, and Bruno's argument does not apply
in the first place.

Guenter
