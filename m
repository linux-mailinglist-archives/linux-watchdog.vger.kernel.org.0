Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16BFC45D3EC
	for <lists+linux-watchdog@lfdr.de>; Thu, 25 Nov 2021 05:27:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239566AbhKYEbH (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 24 Nov 2021 23:31:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232676AbhKYE3G (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 24 Nov 2021 23:29:06 -0500
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4596BC061574;
        Wed, 24 Nov 2021 20:25:56 -0800 (PST)
Received: by mail-ot1-x32d.google.com with SMTP id x43-20020a056830246b00b00570d09d34ebso7657720otr.2;
        Wed, 24 Nov 2021 20:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=DdeJPo6tJcjQ6xie/UumZbsGMzKs8XH6jxPocbq/GOY=;
        b=owNTj+xoM2efuT1AeqWP7Ar0Ldpyqr7d8VrQAl8M2MHlzo+UE1wtryHpZt/QuxfwW0
         nJ/z1B7acFQckLtAI4eA9VpI8OM+CtuTLwpmUlH2FkjYuXf/MrFeH+xJJyE/2z1RdlBZ
         F7Am7bs3KAS2PIwE425Op6eaqcK9UuVzuZjBIyBi5MyOkflpjUIlGS3c+43AiqZ7/Yvx
         qxdRwZPv7ynB9v/O+5sQCPytpjBwOE4TcskYc9lg0i4rRbQlc6NU1AZjDVVJPlc+byWU
         zi1ulSfgzFPJyzxby1xsMBpv0IL13PsHpDzMN4J17s1AbfIXO+7B1wcKr/LL/ZYfo9pX
         P8CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DdeJPo6tJcjQ6xie/UumZbsGMzKs8XH6jxPocbq/GOY=;
        b=8FpFqItEU+oIA+GswJuGsKqWyzfK6mEshaZVBXFvCtUh4Aaedk15xURvkf7eGYn3Ng
         sM0dv/fLw4Aa7+wrgpNalVAT1dxbpMSbkfSnGNxbLRJBIXNQb4gez172w3jY+n/m7CaY
         NiP4RqWbmt+1hJLjtfSKvxxBdJTVyY1ik0SRvY9awWtXZFl1xGaqo5By9T+TiXyhjp7a
         o0VvxI1syKEQp8gcmSpGHnLJnhSIkfZy4U9sIYrPX675vqeoL3/ak/EVhsjaXlZiq0Im
         rpAmPMk0+WvGvZjr4NKCLlxLKNajKwyoe7Jh7xg901gXm1rXcvy8cUjqr64YoSvDI+1Y
         ggAA==
X-Gm-Message-State: AOAM532wDbdbgq48xCapBxSEMlBlxNVZe6zRN9amV9O121fLFJEy6JdK
        yXBUyfsjOePwMq6JOdpAE7Q=
X-Google-Smtp-Source: ABdhPJx2gS9gKHFKnz8bq9xfVY9i16CW/t/zsixskFtXbOTKx6DS6p7Um1R/uDagC8MmuwfGHqfvpQ==
X-Received: by 2002:a05:6830:2053:: with SMTP id f19mr18054260otp.295.1637814355582;
        Wed, 24 Nov 2021 20:25:55 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m5sm402026oim.45.2021.11.24.20.25.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Nov 2021 20:25:54 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
To:     =?UTF-8?B?eHQuaHVb6IOh5YWI6Z+sXQ==?= <xt.hu@cqplus1.com>
Cc:     "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        =?UTF-8?B?V2VsbHMgTHUg5ZGC6Iqz6aiw?= <wells.lu@sunplus.com>,
        =?UTF-8?B?cWluamlhblvopoPlgaVd?= <qinjian@cqplus1.com>
References: <20211112105952.216280-1-xt.hu@cqplus1.com>
 <20211124104149.361019-1-xt.hu@cqplus1.com>
 <20211124104149.361019-2-xt.hu@cqplus1.com>
 <20211124142522.GA3939252@roeck-us.net>
 <0024d27919c04c84a3f13ecba86a3c70@cqplus1.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2 1/2] watchdog: Add watchdog driver for Sunplus SP7021
Message-ID: <f69d663a-982b-5876-08c9-b1a4f35e8098@roeck-us.net>
Date:   Wed, 24 Nov 2021 20:25:52 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <0024d27919c04c84a3f13ecba86a3c70@cqplus1.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 11/24/21 6:42 PM, xt.hu[胡先韬] wrote:
> Hi
> 	Thanks for your review. I explain this in detail below the comment.
> 
> Best Regards,
> Xiantao
>> -----Original Message-----
>> From: Guenter Roeck [mailto:groeck7@gmail.com] On Behalf Of Guenter Roeck
>> Sent: Wednesday, November 24, 2021 10:25 PM
>> To: xt.hu[胡先韬] <xt.hu@cqplus1.com>
>> Cc: wim@linux-watchdog.org; p.zabel@pengutronix.de; linux-kernel@vger.kernel.org;
>> linux-watchdog@vger.kernel.org; robh+dt@kernel.org; devicetree@vger.kernel.org; Wells Lu 呂芳騰
>> <wells.lu@sunplus.com>; qinjian[覃健] <qinjian@cqplus1.com>
>> Subject: Re: [PATCH v2 1/2] watchdog: Add watchdog driver for Sunplus SP7021
>>
>> On Wed, Nov 24, 2021 at 06:41:48PM +0800, Xiantao Hu wrote:
>>> Sunplus SP7021 requires watchdog timer support.
>>> Add watchdog driver to enable this.
>>>
>>> Signed-off-by: Xiantao Hu <xt.hu@cqplus1.com>
>>> ---
>>> +
>>> +	priv->base = devm_platform_ioremap_resource(pdev, 0);
>>> +	if (IS_ERR(priv->base))
>>> +		return PTR_ERR(priv->base);
>>> +
>>> +	/* The registers accessed here shared by multiple drivers. */
>>> +	wdt_res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
>>
>> This is unusual. Why would other drivers access WDT_CTRL and WDT_CNT registers, and how is it
>> ensured that the other drivers do not interfer with the accesses by this driver ?
>>
>> Normally such a resource would be shared through a parent driver with appropriate access functions to
>> ensure that accesses are synchronized.
>>
> 
> The register used by this driver consists of two parts. The first part which contains WDT_CTRL and WDT_CNT
> registers is exclusive by watchdog.
> In specially, the second part is belong to a multifunctional register group which control IP and bus. Refer to
> register manual below:
> -------------------------------------------------------------------------------------------------------------------------------------------------
> MO1_STC_WDG_RST_EN	4	RW		STC Watchdog Timeout Trigger System Reset Enable
> 									0: STC watchdog 2 timeout will not trigger system reset(default)
> 									1: STC watchdog 2 timeout will trigger system reset
> MO1_RI_WDG_RST_EN		1	RW		RBUS Watchdog Timeout Trigger System Reset Enable
> 									0: RBUS watchdog timeout will not trigger system reset(default)
> 									1: RBUS watchdog timeout will trigger system reset
> MO1_TIMER_STAND_BY_EN	0	RW		Timer Standby Mode Enable
> 									0: Disable (default)
> 									1: Enable Active high to enter timer standby mode,
> 											default not in standby mode
> -------------------------------------------------------------------------------------------------------------------------------------------------
> You can see that in addition to the bits for watchdog there are bit fields for other modules.
> I use this register bit4 and bit1. Default value is 0 that watchdog internal interrupt signal can't trigger system
> and RBUS reset. I need set 1 when watchdog probe. Early I implement the operation in
> arch/arm/mach-sunplus/sp7021.c and configure by macro. But in arch/arm64, directory mach-XXX is removed.
> So I solve in this way. Any better way?
> 
If the register at 0x9C000274 is accessed by other drivers, accesses
to it must be protected against each other to avoid race conditions.
How to do that would be up to you.

Guenter
