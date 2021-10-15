Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D62A942F9AC
	for <lists+linux-watchdog@lfdr.de>; Fri, 15 Oct 2021 19:07:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237840AbhJORJn (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 15 Oct 2021 13:09:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237786AbhJORJm (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 15 Oct 2021 13:09:42 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 050FDC061570;
        Fri, 15 Oct 2021 10:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=EB2bhSkGUmKRg2FWGp83nuHOGj3W/lJovypuecj5WxA=; b=KOuUpGlzB0A/v08TMJlHm16RtD
        qCzpLXPZfUv9Fx9n4yBXqR1JyhCfyAlt5Jj4sBeMVmoqBf9Lb743XT2zseOvEAlpF4fYeV9ox7zTq
        yqaGQwu+PZQhbiISMJ2kdi21RtayvcJzSElqm2ZzLfYqdhpKr41PxOnedhO+5xn1jjiVMz9DXm1I+
        obvILyHYJRHthW/qka7AmHo8ZsohaLHdde8LxKVafOFsIoPM0YpophrTIKFUKD4jErxNPhKI2uyJx
        3Nnq/SEmxXK+GO+EVGghXYmNlf/LX+niqX5uTiXQT5g2h3Va/0/kn+OMry4g1pc5/MEvZQfqUM61K
        RCopAztA==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mbQg3-008F3i-Ei; Fri, 15 Oct 2021 17:07:27 +0000
Subject: Re: [PATCH 7/8] watchdog: max77714: add driver for the watchdog in
 the MAX77714 PMIC
To:     Luca Ceresoli <luca@lucaceresoli.net>, linux-kernel@vger.kernel.org
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Chiwoong Byun <woong.byun@samsung.com>,
        Laxman Dewangan <ldewangan@nvidia.com>
References: <20211011155615.257529-1-luca@lucaceresoli.net>
 <20211011155615.257529-8-luca@lucaceresoli.net>
 <319589ca-0dfb-008f-052a-01f0f25d86fa@infradead.org>
 <a78a3f69-d84d-727f-4173-2f0498a4c6f7@lucaceresoli.net>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <052a9dfb-46f1-de8b-181a-0dbe11a42b25@infradead.org>
Date:   Fri, 15 Oct 2021 10:07:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <a78a3f69-d84d-727f-4173-2f0498a4c6f7@lucaceresoli.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 10/15/21 9:42 AM, Luca Ceresoli wrote:
> Hi,
> 
> On 12/10/21 03:18, Randy Dunlap wrote:
>> Hi,
>>
>> On 10/11/21 8:56 AM, Luca Ceresoli wrote:
>>> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
>>> index bf59faeb3de1..00bc3f932a6c 100644
>>> --- a/drivers/watchdog/Kconfig
>>> +++ b/drivers/watchdog/Kconfig
>>> @@ -699,6 +699,15 @@ config MAX77620_WATCHDOG
>>>         MAX77620 chips. To compile this driver as a module,
>>>         choose M here: the module will be called max77620_wdt.
>>>    +config MAX77714_WATCHDOG
>>> +    tristate "Maxim MAX77714 Watchdog Timer"
>>> +    depends on MFD_MAX77714 || COMPILE_TEST
>>> +    help
>>> +     This is the driver for watchdog timer in the MAX77714 PMIC.
>>> +     Say 'Y' here to enable the watchdog timer support for
>>> +     MAX77714 chips. To compile this driver as a module,
>>> +     choose M here: the module will be called max77714_wdt.
>>
>> Please follow coding-style for Kconfig files:
>>
>> (from Documentation/process/coding-style.rst, section 10):
>>
>> For all of the Kconfig* configuration files throughout the source tree,
>> the indentation is somewhat different.  Lines under a ``config`` definition
>> are indented with one tab, while help text is indented an additional two
>> spaces.
> 
> Oh dear, I usually don't make such silly mistakes, apologies.
> 
> [...some fast typing later...]
> 
> Uhm, now I noticed many entries in that file have that same mistake.
> Perhaps I copy-pasted and didn't check. I'll send a patch to fix them too.
> 

Thanks. :)

-- 
~Randy
