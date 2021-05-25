Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DA8E3909FC
	for <lists+linux-watchdog@lfdr.de>; Tue, 25 May 2021 21:53:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232922AbhEYTym (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 25 May 2021 15:54:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232867AbhEYTym (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 25 May 2021 15:54:42 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FB90C061574;
        Tue, 25 May 2021 12:53:11 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id w127so27575868oig.12;
        Tue, 25 May 2021 12:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=lPGzsw8i+tt3r1NmDCIr0CvauycTrn2jzT4uTRv31Uc=;
        b=YS31K2DsMAzEiA71fiN6JWcSpetBF9DUVaQofVpuH9chWhS04FL922ysARot2HdbV8
         4XmsOdSW6rcRoukjXFotvEYCmjoDJ3RH0v3WtEBX17yoD8e0J1yPq8tQ2UAAjc8IyKeD
         RvHdpmBDddagSU+HKinp6rgQV/n/Cp4l/hNPvtlOShlkrt+z6vhtWZXNdBPZ6Q73bMR0
         iwMe689XO05Lk+A+udyCUUuCDalGjiOtJWz3H1qYgaBZh19fzcphcluw4zujVvs5/wXX
         nIRy+Bg/W6zu1eTxtkyJbWF+mMNs5XTPrZinUrEXWWCyPQuR1SAm3YGyIezRlITrTMAC
         RoeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lPGzsw8i+tt3r1NmDCIr0CvauycTrn2jzT4uTRv31Uc=;
        b=IzLMT2AorIy23c1dxRjvMRiLQSL3oNOkuzA/XHYrInEtfZzm4ZR5WPHlE7+XEAoVBJ
         qDkdl1q67rt6usHSldlS/GVn23J6CwkNdBMaxMxDSVP/Fn0QYLjge6o4epsrqER0vnmk
         SVmuVaTKzvIsstGiagHb0hYiDBBJtxgEOqLRTOAG/zTZBFjnsYUy1iaBWCtnpnNpOUcy
         8E2plkQarFX5SpKpAz0XEJJYFMK5f4hInK8J2HHp6GaUgox/3dJyyJKN/7jkqVb92b12
         dKgRJ9KxM419nJSbUhsX3/Qdf+XL9oKKrrmbFBhgAEXfNptH+pLA5lpve/YfTy1dBWHF
         dupw==
X-Gm-Message-State: AOAM5302qz2437hfXDGitvBPJlyFc1PdAfKxA7LHTJmTiY70n6oPe779
        4OKIQX8om5N3mF5dCm3YrVVjUTmWXB4=
X-Google-Smtp-Source: ABdhPJypPgZr2QWA/k4Y1CuWJ4cvcqib3Uj7Cbas7CRI9ZZgeOcGHM1HAVY3LHP4wDYzjeGfz5vH8g==
X-Received: by 2002:aca:aacd:: with SMTP id t196mr15082338oie.43.1621972388794;
        Tue, 25 May 2021 12:53:08 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x9sm3652020oto.79.2021.05.25.12.53.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 May 2021 12:53:08 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH 2/3] watchdog: Add Mstar MSC313e WDT driver
To:     Randy Dunlap <rdunlap@infradead.org>,
        Romain Perier <romain.perier@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Daniel Palmer <daniel@0x0f.com>,
        Mohammed Billoo <mohammed.billoo@gmail.com>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210525184449.57703-1-romain.perier@gmail.com>
 <20210525184449.57703-3-romain.perier@gmail.com>
 <dfb1173d-7564-9386-10bf-5151ef284635@infradead.org>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <155f6b43-3f18-1c19-2dd2-4c9dc38ccfac@roeck-us.net>
Date:   Tue, 25 May 2021 12:53:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <dfb1173d-7564-9386-10bf-5151ef284635@infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 5/25/21 11:49 AM, Randy Dunlap wrote:
> Hi,
> 
> On 5/25/21 11:44 AM, Romain Perier wrote:
>> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
>> index 355100dad60a..f53634ea0de6 100644
>> --- a/drivers/watchdog/Kconfig
>> +++ b/drivers/watchdog/Kconfig
>> @@ -980,6 +980,19 @@ config VISCONTI_WATCHDOG
>>   	  Say Y here to include support for the watchdog timer in Toshiba
>>   	  Visconti SoCs.
>>   
>> +config MSC313E_WATCHDOG
>> +	tristate "MStar MSC313e watchdog"
>> +	depends on ARCH_MSTARV7 || COMPILE_TEST
>> +	depends on OF
>> +	select WATCHDOG_CORE
>> +	help
>> +	  Say Y here to include support for the Watchdog timer embedded
>> +	  into MStar MSC313e chips. This will reboot your system when the
>> +	  timeout is reached.
>> +
>> +	  To compile this driver as a module, choose M here: the
>> +	  module will be called msc313e_wdt.
> 
> AFAIK, you don't need the "depends on OF" line since
> the of*.h headers provide stubs for the cases of CONFIG_OF
> and/or CONFIG_OF_ADDRESS not set/enabled.
> 

I don't actually see any devicetree API calls in the driver.

Guenter

> Not having that line would also make COMPILE_TEST more effective.
> 
> Can Rob or anyone else comment on this?
> 
> thanks.
> 

