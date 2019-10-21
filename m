Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75D09DEDC6
	for <lists+linux-watchdog@lfdr.de>; Mon, 21 Oct 2019 15:38:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728976AbfJUNiF (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 21 Oct 2019 09:38:05 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:34793 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728083AbfJUNiF (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 21 Oct 2019 09:38:05 -0400
Received: by mail-pg1-f194.google.com with SMTP id k20so7859379pgi.1;
        Mon, 21 Oct 2019 06:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=b1PZ6SOJ7OdDQt8+lVytXILJGAVRFkgpcJ5+dAG12fw=;
        b=LB+tV9MYjiaR8vrVT25ivC09xXjhdonxNFWid2hDBLzWPHw3/GK/90NtR4BjlhHJxx
         DGa7cp7EM16xC3BDXNfXntsX2rMAAGvvjN3/e+U83apLVZDuDF/OzNXLLdaZoyehtx3H
         ckLQZbuyW37o5YO58jyRWIiQxLr6gil8Ea/E5NjS/W+SxICC2p7Mk+sVhzSdTyvM1h1y
         zTP9SxbdSvdtjwVAF1Yo+4wrGLf4j0bImlu1nLV6MxrJPuTYkRV9xrQUMnfmg6SW5W+Q
         Ajm+6jkPOjljf1SybFLdxWn1S7hzIzXMO0dWanbUnst1OAvPkRkIFdupDgeEm0ZhZ7TQ
         2OvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=b1PZ6SOJ7OdDQt8+lVytXILJGAVRFkgpcJ5+dAG12fw=;
        b=irR+GoIisnh62PssvmOGV5IhEH046Ohu8P5UIobgz3bAOv1IF06Xp97K0pcc9Z+JCR
         dZntZQ71pAUixAKZd/ZLf0dOG9ZrRgDlRlDe2skumBIsYSYbCGY3JnPiiP2sSmhGGOvI
         IyPJVZXbqrIU7/Yqbfote5hnPRNyEQj0cJmO/0hVyzcfesh7aOF9Wdc/m9SwDsTE8P+o
         BMVDCTdn13AHkleJlr+G35FZlapo4hy3VULRlo4bxunMcK8H1V4OQx32Dn4WDDsBAQ6H
         BnZ+Y3M0e+1FrbkBrTUbN+ZoMdgda6F0+7UQ2A8uJXOgOaRvBlBn3SQjxXqjp/QSHeqM
         YrfA==
X-Gm-Message-State: APjAAAWkCW+xkajmRMatBa166jXOsGAGpt7kS/eDpDVNzJO0RxueMJiz
        x2iX7YVkTZG6IEwvgjCh6HafQK2L
X-Google-Smtp-Source: APXvYqx6UmiUNJ8OsgobEge2zBLNBqpn+JDBOATMHXfa+4BF+S0SfCYz4R9XSX0QOoH8TvkXgpov4w==
X-Received: by 2002:a17:90a:8048:: with SMTP id e8mr30110326pjw.0.1571665083089;
        Mon, 21 Oct 2019 06:38:03 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m12sm5595043pjk.13.2019.10.21.06.38.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Oct 2019 06:38:01 -0700 (PDT)
Subject: Re: [PATCH v2 3/4] watchdog: add meson secure watchdog driver
To:     Xingyu Chen <xingyu.chen@amlogic.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Qianggui Song <qianggui.song@amlogic.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Jian Hu <jian.hu@amlogic.com>, linux-watchdog@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <1571387622-35132-1-git-send-email-xingyu.chen@amlogic.com>
 <1571387622-35132-4-git-send-email-xingyu.chen@amlogic.com>
 <7397f6db-1dc8-3abd-41ff-2e47323c7ffa@roeck-us.net>
 <bfc892af-1cd3-1437-75b2-5ba2b7913284@amlogic.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <bd5ed275-4ae4-4163-b585-23fbead9833f@roeck-us.net>
Date:   Mon, 21 Oct 2019 06:38:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <bfc892af-1cd3-1437-75b2-5ba2b7913284@amlogic.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 10/21/19 1:03 AM, Xingyu Chen wrote:
> Hi, Guenter
> 
> On 2019/10/21 0:56, Guenter Roeck wrote:
>> On 10/18/19 1:33 AM, Xingyu Chen wrote:
>>> The watchdog controller on the Meson-A/C series SoCs is moved to secure
>>> world, watchdog operation needs to be done in secure EL3 mode via ATF,
>>> Non-secure world can call SMC instruction to trap to AFT for watchdog
>>> operation.
>>>
>>> Signed-off-by: Xingyu Chen <xingyu.chen@amlogic.com>
>>> ---
>>>   drivers/watchdog/Kconfig         |  17 ++++
>>>   drivers/watchdog/Makefile        |   1 +
>>>   drivers/watchdog/meson_sec_wdt.c | 187 +++++++++++++++++++++++++++++++++++++++
>>>   3 files changed, 205 insertions(+)
>>>   create mode 100644 drivers/watchdog/meson_sec_wdt.c
>>>
>>> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
>>> index 58e7c10..e84be42 100644
>>> --- a/drivers/watchdog/Kconfig
>>> +++ b/drivers/watchdog/Kconfig
>>> @@ -826,6 +826,23 @@ config MESON_GXBB_WATCHDOG
>>>         To compile this driver as a module, choose M here: the
>>>         module will be called meson_gxbb_wdt.
>>> +config MESON_SEC_WATCHDOG
>>> +    tristate "Amlogic Meson Secure watchdog support"
>>> +    depends on MESON_SM
>>> +    depends on ARCH_MESON || COMPILE_TEST
>>
>> This dependency is pointless. MESON_SM already depends on ARCH_MESON,
>> thus specifying "COMPILE_TEST" here adds no value but only
>> creates confusion.
> Thanks for your analysis, perhaps i should remove the line below.
> - depends on ARCH_MESON || COMPILE_TEST
> 
> Is it ok to modify code above like this ?

Yes.
[ ... ]

>>> +static unsigned int meson_sec_wdt_get_timeleft(struct watchdog_device *wdt_dev)
>>> +{
>>> +    int ret;
>>> +    unsigned int timeleft;
>>> +    struct meson_sec_wdt *data = watchdog_get_drvdata(wdt_dev);
>>> +
>>> +    ret = meson_sm_call(data->fw, SM_WATCHDOG_OPS, &timeleft,
>>> +                MESON_SIP_WDT_GETTIMELEFT, 0, 0, 0, 0);
>>> +
>>> +    if (ret)
>>> +        return ret;
>>
>> Meh, that doesn't work. I just realized that the return type is unsigned,
>> so returning a negative error code is pointless. Guess we'll have to
>> live with returning 0 in this case after all. I wonder if we should
>> fix the API and return an integer (with negative error code), but that
>> is a different question.
> Thanks for your review.
> 
> IMO, if returning an integer, and the value which copy to user buf should be formatted with %d instead of %u (see timeleft_show), it will cause the max value of timeleft is reduced from 4294967295 to 2147483647. but i'am not sure whether it will bring risk.

Not that it matters right now, but I don't think that limiting 'timeleft'
reporting to 2147483647 seconds, or ~68 years, would cause any risk.
It would just be a large patch changing several drivers all at once,
that is all.

> 
> So i also think returning 0 may be better in this case.

Yes, please do that.

Thanks,
Guenter
