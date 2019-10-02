Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 164C6C478D
	for <lists+linux-watchdog@lfdr.de>; Wed,  2 Oct 2019 08:11:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726194AbfJBGLr (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 2 Oct 2019 02:11:47 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:42273 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725977AbfJBGLr (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 2 Oct 2019 02:11:47 -0400
Received: by mail-wr1-f68.google.com with SMTP id n14so18074393wrw.9
        for <linux-watchdog@vger.kernel.org>; Tue, 01 Oct 2019 23:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=w9w4LiqpKs4FK/R+mWuzG3CCyo0oAebsDkqY0m2hiIc=;
        b=k2kwFeEsr4Bs8dOrw4RYwIJtJeq3JeLNeBapZ509DnZPJJKj82XizJZilqi/bAVoJo
         3Sh6ThKzdxjfbbrDjyMNAbzwyBhvqVVA0Ekhy75kZqEm6L9GQ+dPrZptAfYfvJzywSSV
         849h3pVKuuYd3qUoZGig8ENhqSIitZMJBfi8IGB9rVqg84U84l0vFJjjB/2JWmz9aOwk
         lrKRiN0QiXySCfnSU7ghLfTiF1vSwa12WyAm+B5zdTEZQP1FSZwh8HNwMJ+JX46nl83v
         bofaj1ER8qTPbbmo91Ej8/9qSIV79XoiIGZNG0rpVeN9QHPm24ypFnq9FDh2iuYjGTE4
         r8JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=w9w4LiqpKs4FK/R+mWuzG3CCyo0oAebsDkqY0m2hiIc=;
        b=ZJ/RSKGEfh9gre6kPDnte74gUVlDGTq3rJJJyR1I18BeB887kN28sgCF78R4y3l880
         jyHg6UJB24DO5YzDGum8o4fOsp4eBHeeNwwRDt++EwIsbD5TuWsNsEu6WqaoH6v9Uakc
         WXAso4IvYZmPUhjLROzOj9tgx9/NoPSdgMrJYRZnPzG2zhCQrtpyAW0YHPEofUmExmZP
         PFdGkScZauFItc1SVGpnJ5a7E3qmpwU5OcQ80ZRf3AuAbiEmOoBqvKn5vADKYaZg0s2C
         am5jD9SLt4YwUkTNTPJsCioxxMHNyw0iRDRa89Gpl9zzCRcJqG/051vYDKs2XuTrzbrx
         oLcw==
X-Gm-Message-State: APjAAAXcd82h8OKZrLUAre5KYwtXJz//B+KAkD9P5X+goVVpqLhjJ2rX
        jInZJYboqUpWIgzCLGdgRKf8/bOXHMvWxHB2Ob8=
X-Google-Smtp-Source: APXvYqyCSXllv3Y35jUg4MbqcxBjI2yfE5f8oQ0p0SpgiFJJ1UVi/3Q6/3lea90+2xmm74LMNF1YO43HS1ZE9WApjwE=
X-Received: by 2002:adf:f341:: with SMTP id e1mr1150174wrp.1.1569996704895;
 Tue, 01 Oct 2019 23:11:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190924143116.69823-1-andriy.shevchenko@linux.intel.com> <CAJAoKi_c2XRi_tdJcc3MMS1=9d4WH_Tq9EmH30-GyXcPoJhXGA@mail.gmail.com>
In-Reply-To: <CAJAoKi_c2XRi_tdJcc3MMS1=9d4WH_Tq9EmH30-GyXcPoJhXGA@mail.gmail.com>
From:   razvan becheriu <razvan.becheriu@gmail.com>
Date:   Wed, 2 Oct 2019 09:11:33 +0300
Message-ID: <CAJAoKi_C85WDxu_XppFhn7BjZC1GznqQrPFKW9W2wEpHzz4wPw@mail.gmail.com>
Subject: Re: [PATCH v1] watchdog: intel-mid_wdt: Add WATCHDOG_NOWAYOUT support
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Razvan Becheriu <razvan.becheriu@qualitance.com>,
        linux-watchdog@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Ferry Toth <fntoth@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi,

regarding the test for the WATCHDOG_NOWAYOUT patch:

```
Tested-by: Razvan Becheriu <razvan.becheriu@gmail.com>
The patch works.
By configuring the CONFIG_WATCHDOG_NOWAYOUT in the kernel and stopping
the watchdog.service, the board reboots.
Previously, the watchdog.service was able to disable the watchdog
counter, and no reboot was performed.
```

Thank you,
Razvan


On Tue, Oct 1, 2019 at 10:06 PM razvan becheriu
<razvan.becheriu@gmail.com> wrote:
>
> Hi,
>
> regarding the test for the WATCHDOG_NOWAYOUT patch:
>
> ...
> Tested-by: Razvan Becheriu <razvan.becheriu@gmail.com>
> The patch works.
> By configuring the CONFIG_WATCHDOG_NOWAYOUT in the kernel and stopping the watchdog.service, the board reboots.
> Previously, the watchdog.service was able to disable the watchdog counter, and no reboot was performed.
> ...
>
> Thank you,
> Razvan
>
> On Tue, Sep 24, 2019 at 6:13 PM Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
>>
>> Normally, the watchdog is disabled when /dev/watchdog is closed, but if
>> CONFIG_WATCHDOG_NOWAYOUT is defined, then it means that the watchdog should
>> remain enabled. So we should keep it enabled if CONFIG_WATCHDOG_NOWAYOUT
>> is defined.
>>
>> Reported-by: Razvan Becheriu <razvan.becheriu@qualitance.com>
>> Cc: Ferry Toth <fntoth@gmail.com>
>> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>> ---
>>  drivers/watchdog/intel-mid_wdt.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/watchdog/intel-mid_wdt.c b/drivers/watchdog/intel-mid_wdt.c
>> index 2cdbd37c700c..470213abfd3d 100644
>> --- a/drivers/watchdog/intel-mid_wdt.c
>> +++ b/drivers/watchdog/intel-mid_wdt.c
>> @@ -134,6 +134,7 @@ static int mid_wdt_probe(struct platform_device *pdev)
>>         wdt_dev->timeout = MID_WDT_DEFAULT_TIMEOUT;
>>         wdt_dev->parent = dev;
>>
>> +       watchdog_set_nowayout(wdt_dev, WATCHDOG_NOWAYOUT);
>>         watchdog_set_drvdata(wdt_dev, dev);
>>
>>         ret = devm_request_irq(dev, pdata->irq, mid_wdt_irq,
>> --
>> 2.23.0
>>
