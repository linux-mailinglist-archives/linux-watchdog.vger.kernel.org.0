Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63B5422B919
	for <lists+linux-watchdog@lfdr.de>; Fri, 24 Jul 2020 00:02:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726436AbgGWWC2 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 23 Jul 2020 18:02:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726304AbgGWWC1 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 23 Jul 2020 18:02:27 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9911AC0619D3;
        Thu, 23 Jul 2020 15:02:27 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id q5so6546635wru.6;
        Thu, 23 Jul 2020 15:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=NuQxLm4oh1YqwrzmCOG37rIcHVvqKWOtQLxSpr2Bytw=;
        b=Bmn3inGNBhbZAPmNzvzk0PoF6hhVlHq2zgwDg+7BRgIs/2zN86NtzsLvQfnEaEovCN
         n4Syrzpn67iBgAsn6+Jl3k76bghC9B74OoXOGqDmCtyB9OxIaPN/bYO8Kp4T3LtjJEqY
         iOlCgsxmYgwYmXR7HNIjVN6GsxvyEj5kgJg1ZR7P6Xbg1qLLyYi+GymXIcXDqgqIFXzT
         p64Dp5eMNf/dRyU6Jp6XDSoSDBsA2YsldyBSmMB7SdngDYCObAU4FHxgCY/tAcvJhE4h
         iEt+29rHggNtSgMZzmIAybjz4CbJoSvVi3G4SvSzBc54P1uYyQWTeshS0TvTxRvU6/BF
         6xrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NuQxLm4oh1YqwrzmCOG37rIcHVvqKWOtQLxSpr2Bytw=;
        b=cnyfLCUIiSfaDqgXGiD72yBoYwpHniY9DRdrd4xny4FcFdrNjpV86f/QVT5gXFjO/a
         HtUMk6oOkH/HMQxY1loiwyAFAVEyopVFsoBS7+/iqUEELY3fL14AZ8UZJwBo+ZaQRrNJ
         enlC0FNrvvZExr5Uh7aTAB/rTkVGwULCEENv1tbMtFFDNRkIxD9xTstSXlMNheKEO8Aj
         0PlaXA7wAWBoso7RFIqD7AVcS/NTc+3Xpx86wZgRQKp9b99YQrGIDgWEOOTsY56ajEfg
         yh7Mlq8UmTl3ML9+Lp0jRYreJyimw1rKIhARs2UkceiwNL9YXbLr8i6ClybXk0a5X7yq
         e7Jw==
X-Gm-Message-State: AOAM530bAKmflm6aXFI205IbCTI6YkzM1CPVhUlCBALPCwOuQJ1AA2Op
        VLOM7cOUjeEWdVZJH2VPYFY=
X-Google-Smtp-Source: ABdhPJwCBWjFqfX9LsEETFlHhgqOHXb0/Jb4JGN0sWE1amMRw6DzjP+yqFsILokrocP9sTCgogVagw==
X-Received: by 2002:a5d:6b08:: with SMTP id v8mr5993254wrw.2.1595541746233;
        Thu, 23 Jul 2020 15:02:26 -0700 (PDT)
Received: from ziggy.stardust ([213.195.122.158])
        by smtp.gmail.com with ESMTPSA id 65sm5120618wmd.20.2020.07.23.15.02.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2020 15:02:25 -0700 (PDT)
Subject: Re: [PATCH 4/4] dt-binding: mediatek: mt8192: update mtk-wdt document
To:     Rob Herring <robh@kernel.org>, Seiya Wang <seiya.wang@mediatek.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org, srv_heupstream@mediatek.com,
        Crystal Guo <crystal.guo@mediatek.com>
References: <20200723090731.4482-1-seiya.wang@mediatek.com>
 <20200723090731.4482-5-seiya.wang@mediatek.com>
 <20200723212935.GA889594@bogus>
From:   Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <d69d441d-b8c7-f4a4-7ae1-a0012d8001f3@gmail.com>
Date:   Fri, 24 Jul 2020 00:02:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200723212935.GA889594@bogus>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org



On 23/07/2020 23:29, Rob Herring wrote:
> On Thu, Jul 23, 2020 at 05:07:31PM +0800, Seiya Wang wrote:
>> From: Crystal Guo <crystal.guo@mediatek.com>
>>
>> update mtk-wdt document for MT8192 platform
>>
>> Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
>> ---
>>   Documentation/devicetree/bindings/watchdog/mtk-wdt.txt | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
>> index 4dd36bd3f1ad..d760ca8a630e 100644
>> --- a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
>> +++ b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
>> @@ -12,6 +12,8 @@ Required properties:
>>   	"mediatek,mt7629-wdt", "mediatek,mt6589-wdt": for MT7629
>>   	"mediatek,mt8183-wdt", "mediatek,mt6589-wdt": for MT8183
>>   	"mediatek,mt8516-wdt", "mediatek,mt6589-wdt": for MT8516
>> +	"mediatek,mt8192-wdt": for MT8192
>> +
> 
> So, not compatible with "mediatek,mt6589-wdt"? Is so, perhaps summarize
> what the differences are.
> 

Hm, looks to me as if the binding description for mt2712 and mt8183 isn't 
correct, as we have a OF data just as we have for mt8192 now. Could you fix this 
in a separate patch?

Regards,
Matthias

>>   
>>   - reg : Specifies base physical address and size of the registers.
>>   
>> -- 
>> 2.14.1
