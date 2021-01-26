Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45E06305CD8
	for <lists+linux-watchdog@lfdr.de>; Wed, 27 Jan 2021 14:19:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S313095AbhAZWln (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 26 Jan 2021 17:41:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727845AbhAZE4p (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 25 Jan 2021 23:56:45 -0500
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2B3BC06178C;
        Mon, 25 Jan 2021 20:56:02 -0800 (PST)
Received: by mail-ot1-x330.google.com with SMTP id d7so7411698otf.3;
        Mon, 25 Jan 2021 20:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yALqx1UqbrSQ2m94P/zDtfRsAyQWBDEffV5GmgAKnrI=;
        b=BTMHxeavLcP+HR4sG9nQcgd+R2OUJIwC/kfEDFYStNMWoOXxDu4KJIFSqLBxJoiEOQ
         wNycAqzMFr2jgKV7R22QfQLpOXEQfT/V0GqzgALI3eiXWbyd6awJ+dt8oD731XFIYh6z
         9twObuFZrN8s2eu9sHiekvruXJmlsVcBNaNjsxWQeSGgJvS+PSTYd3Hh32ly4nBOWd9R
         tb8Erp2i4LIxw5sd2RHCHhWh13uxRrAyf2wEvrJPsO+wNXDrv0XqJ9Zo+1L0v8uDx17m
         qhDlYK0DlWnyZKQLSMde5+D/D7YiWearJKdSkPa9TCEO8FbvzK7Ylg7z0ajDMZS/HNc0
         oCbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=yALqx1UqbrSQ2m94P/zDtfRsAyQWBDEffV5GmgAKnrI=;
        b=pXkcuWf3a63AmgzvYxlKqehdSpJMwIEQKHj+9fUgmdgZNQ74QB9u3AbG/0g3nWaFJS
         Hd0U7OILN5na5vfGPprpAflkYmo+YZ5mcq255I+LA/ABhnJtHSBuOxv5oNNAfKN0tr2E
         A4PiIiR2ompyVdsD/J4AaXQcuPmY8nRsK2LFTD9BaxCMZ0z7Qi6gIPCDMwDsRYY54Nba
         gJOjqtYM1pdUDaUGijd4H3kwUMgiLgYehKjQRk90BKHFAZdtqKmRlc2ZTJebyIOxNjd3
         oEtBAFcNxuOwPJt4x9Pc4sT4rRyKPEe1BmH/pbLRz3VG75G8RfpFTKO6+vRSMExkPyUl
         TLwg==
X-Gm-Message-State: AOAM531ysaE5ve8e9KVxRq+iGg4IAMgjRfwBTDsZfKO+9OnPkMuZvaiW
        4lUlgEqphFv1GLdQZ8TTVtk=
X-Google-Smtp-Source: ABdhPJyVE4RfhDy82DQin+65tTzC7hch34YfbEtJ0SN3nW4NAwKxxcctexxLA55numSyz1rMSRGeAA==
X-Received: by 2002:a9d:6a58:: with SMTP id h24mr2815547otn.146.1611636962076;
        Mon, 25 Jan 2021 20:56:02 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v2sm2163396ooq.25.2021.01.25.20.55.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Jan 2021 20:56:01 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH 1/8] dt-binding: watchdog: add more Rockchip compatibles
 to snps,dw-wdt.yaml
To:     Heiko Stuebner <heiko@sntech.de>, Johan Jonker <jbx6244@gmail.com>
Cc:     robh+dt@kernel.org, wim@linux-watchdog.org, jamie@jamieiles.com,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org
References: <20201218120534.13788-1-jbx6244@gmail.com>
 <20210123173401.GA57343@roeck-us.net> <11680602.O9o76ZdvQC@phil>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <d6814912-ebbe-642d-161f-a005f40634d6@roeck-us.net>
Date:   Mon, 25 Jan 2021 20:55:59 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <11680602.O9o76ZdvQC@phil>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Heiko,

On 1/25/21 3:40 PM, Heiko Stuebner wrote:
> Hi Guenter,
> 
> Am Samstag, 23. Januar 2021, 18:34:01 CET schrieb Guenter Roeck:
>> On Fri, Dec 18, 2020 at 01:05:27PM +0100, Johan Jonker wrote:
>>> The watchdog compatible strings are suppose to be SoC orientated.
>>> In the more recently added Rockchip SoC dtsi files only
>>> the fallback string "snps,dw-wdt" is used, so add the following
>>> compatible strings:
>>>
>>> "rockchip,px30-wdt", "snps,dw-wdt"
>>> "rockchip,rk3228-wdt", "snps,dw-wdt"
>>> "rockchip,rk3308-wdt", "snps,dw-wdt"
>>> "rockchip,rk3328-wdt", "snps,dw-wdt"
>>> "rockchip,rk3399-wdt", "snps,dw-wdt"
>>> "rockchip,rv1108-wdt", "snps,dw-wdt"
>>>
>>> make ARCH=arm dtbs_check
>>> DT_SCHEMA_FILES=Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
>>>
>>> make ARCH=arm64 dtbs_check
>>> DT_SCHEMA_FILES=Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
>>>
>>> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
>>> Acked-by: Rob Herring <robh@kernel.org>
>>> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
>>
>> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> 
> just to clarify, do you expect me to pick up the dt-binding patch
> with the devicetree patches or do you want to take this individual
> patch through the watchdog tree instead?
> 

You'd have to ask Wim since he takes care of actually sending pull requests.
But didn't you say earlier that you wanted to apply the rest of the series
after this one is applied through the watchdog tree ?

Thanks,
Guenter

> 
> Thanks
> Heiko
> 
>>> ---
>>>  Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml | 6 ++++++
>>>  1 file changed, 6 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
>>> index f7ee9229c..b58596b18 100644
>>> --- a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
>>> +++ b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
>>> @@ -18,10 +18,16 @@ properties:
>>>        - const: snps,dw-wdt
>>>        - items:
>>>            - enum:
>>> +              - rockchip,px30-wdt
>>>                - rockchip,rk3066-wdt
>>>                - rockchip,rk3188-wdt
>>> +              - rockchip,rk3228-wdt
>>>                - rockchip,rk3288-wdt
>>> +              - rockchip,rk3308-wdt
>>> +              - rockchip,rk3328-wdt
>>>                - rockchip,rk3368-wdt
>>> +              - rockchip,rk3399-wdt
>>> +              - rockchip,rv1108-wdt
>>>            - const: snps,dw-wdt
>>>  
>>>    reg:
>>
> 
> 
> 
> 

