Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4488B7A6E
	for <lists+linux-watchdog@lfdr.de>; Thu, 19 Sep 2019 15:26:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389648AbfISN0b (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 19 Sep 2019 09:26:31 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:37919 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389604AbfISN0a (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 19 Sep 2019 09:26:30 -0400
Received: by mail-pg1-f193.google.com with SMTP id x10so1923635pgi.5;
        Thu, 19 Sep 2019 06:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=CoB4KmaHfq+yxd87gkGVs6nwrNH2bvGH19ka5K/5+7s=;
        b=V9YQYFxmlUNCybjvdRLrQvPOvSMjndmjun4zivZO+oRyzN0pCcKs6DrBWmtSRf4oy4
         jePI3xFYjTbHTZBowP6zr6KxFzy2EN2ZaJgzFLp//LY5rnbzvgBCyKThcXevmZj6JLYX
         C6TbcKFRpJ+/yCdLxuTyw3XRFeFy23iwJ4QDgoXTciqvwDVlCdvqX1LC+awXUsLSjn8S
         j8CaygQUaTIVjUsAKYPxgTej9bAgQ6q1FcCews42UwY+aMHgL5sPkO5RaBzr7DHtKL9H
         cEyP7UJUV247uLJ/YS2aK5veRcEn5btm7Osk3MShGzsSbKNmELDb14jjX2ygKunvRfBh
         ITWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CoB4KmaHfq+yxd87gkGVs6nwrNH2bvGH19ka5K/5+7s=;
        b=iHAPDkf/6OrDn2t/7Rp6d666/xf5Gcr+cFAwR211+5Gur54Wo9ZAmqPtoI9iVrmARx
         MdjfvXk8I5rZCm19NKUyIzc77jv0Byiq/WHV7EKd+rYy2R7nIcagLXx5hUvTdZUPbLpJ
         yvedlkO/CRr50YqrWszxfj9Tob6lncsnZ1O1/mqnztbC4YehUV4dVtFijQ5LHC/+N3LL
         qtxzcNMTg9Cr4XTjrTxtoua4tvljVK28EVNAtt5UX0Ft6V1MX9zDH2b2fP2hqyg7R5oi
         xSeXHWg0vJjNtc9f/v7/nRXPsJGlpVXcB0MqM2/Cp4tjvYqqKxl7KUcdyNgyuN62EuY0
         QzHg==
X-Gm-Message-State: APjAAAVG15kBuoZz4tF2N3UMMZ6Ommu0/1GGSHrOgT08jfeX2flPFNBc
        G4Bijm4efX/9WOOzioVFGI8P/Ywg
X-Google-Smtp-Source: APXvYqxXBFANc621yv4NEdqoHo25S849CFrx4vJkjX5759Pvs2XA1B976aIlXE9jZz3GZcwcPyGjsg==
X-Received: by 2002:a17:90a:b114:: with SMTP id z20mr3721493pjq.113.1568899588392;
        Thu, 19 Sep 2019 06:26:28 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u31sm30617181pgn.93.2019.09.19.06.26.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Sep 2019 06:26:27 -0700 (PDT)
Subject: Re: Samsung based S3C2440A chipset - watchdog timer issue
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Suniel Mahesh <sunil.m@techveda.org>
Cc:     kgene@kernel.org, wim@linux-watchdog.org, heiko@sntech.de,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>, linux-watchdog@vger.kernel.org
References: <652bf0b2-3681-47f2-3b50-40edff52a7b5@techveda.org>
 <CAJKOXPdoYZTr_4ysVxN17bo8FZzQXRJS=ch4BAZzY+bLsLhS9Q@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <19a79d6b-e373-3ac6-0339-2ef06f14818b@roeck-us.net>
Date:   Thu, 19 Sep 2019 06:26:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAJKOXPdoYZTr_4ysVxN17bo8FZzQXRJS=ch4BAZzY+bLsLhS9Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 9/19/19 1:38 AM, Krzysztof Kozlowski wrote:
> On Thu, 19 Sep 2019 at 09:40, Suniel Mahesh <sunil.m@techveda.org> wrote:
>>
>> Hi,
>>
>> I am working on one of the Samsung based S3C2440A chipset based target .
>>
>> I have couple of questions and I request someone to shed some light on these: (Thank you)
>>
>> The watchdog driver in linux, looks like, it just configured WDT but didn't start it (code snippet included below).
>>
>> May i know the reasson why WDT is not started ? Is it because u-boot already started WDT, implies it is not required to do the
>> same once we jump into linux ? or is there any specific reason ?
>>
>> drivers/watchdog/s3c2410_wdt.c (line 53 and lines 616 - 625)
>>
>> #define S3C2410_WATCHDOG_ATBOOT         (0)
>> ....
>> static int tmr_atboot   = S3C2410_WATCHDOG_ATBOOT;
>> ...
>> ...
>> if (tmr_atboot && started == 0) {
>>                  dev_info(dev, "starting watchdog timer\n");
>>                  s3c2410wdt_start(&wdt->wdt_device);
>>          } else if (!tmr_atboot) {
>>                  /* if we're not enabling the watchdog, then ensure it is
>>                   * disabled if it has been left running from the bootloader
>>                   * or other source */
>>
>>                  s3c2410wdt_stop(&wdt->wdt_device);
>>          }
>> ...
>> ...
>>
>> Tried to start WDT in linux by assigning value 1 to S3C2410_WATCHDOG_ATBOOT. The target resets.
>>
>> please comment.
> 
> I think watchdog should not start during boot before user-space is
> brought up. Otherwise who will ping it? Usually watchdog is started by
> opening the watchdog device by user-space. If you need it to be
> running without user-space, there are special flags for this (see
> WDOG_HW_RUNNING and others).
> 
That is not entirely correct. There are use cases where the watchdog
is started on purpose and userspace has to open it within a specified
period of time to prevent the system from rebooting. Presumably this is
what the current driver tries to implement. WDOG_HW_RUNNING was added
to the core after the driver was written, so it is not surprising that
the driver does not support it. Patches welcome.

Thanks,
Guenter
