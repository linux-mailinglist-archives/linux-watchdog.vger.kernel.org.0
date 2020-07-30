Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4A2D232F1F
	for <lists+linux-watchdog@lfdr.de>; Thu, 30 Jul 2020 11:02:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728693AbgG3JC2 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 30 Jul 2020 05:02:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726273AbgG3JC1 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 30 Jul 2020 05:02:27 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BA98C061794;
        Thu, 30 Jul 2020 02:02:27 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id b6so24118493wrs.11;
        Thu, 30 Jul 2020 02:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6AdvSzH8Ud3oWLaS+qrTxwwZZQDqRX8Mvzyvl4juDeM=;
        b=Isjp6sJOCLivxUv00q7fZSH+/0xUw2/Fz4Kyb1h+QlTNcVydr7vre/wbrI+E1Od6zM
         dOBga5snkHQxgj+j7idiktj7U4baNVv84g5l1v95skr9FA+rp1Ur9VE1G3Zw206gj3Fs
         1Txs3/d+fkTlY4Jxr1JA1bKwhhEQS36mizitqovJZ9YR77gPCiFGxRFCe6vcFCuapP9f
         feay/4KoLVBbPCSN8Q/yUxqFugkeViyWPSAKmmLbcfdWQfLpQLbdVYAtcB66971H3kpw
         VdzDoPThqaiVuB+lZ/hSkNKLRoet3eMcbmLNzOYP4AothWWOEPTnPmzjoq+a2kkxYTW8
         rRUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6AdvSzH8Ud3oWLaS+qrTxwwZZQDqRX8Mvzyvl4juDeM=;
        b=KumCDMtOEPknM9Nf40G9Ku5ksUt2Gu90ZGZyDdVuvgyvEFFncPE+Z/MCqxic3WzWaC
         jb/JHvC/A3519hWx3rh49q3g7ehuYiTuOpVEbLT9KQ4Z1fZ38+rWfSVmm8EaBmxDSBol
         M6W0ocTvFgw2XWE1gdH3Wly+thqPTTtWxndcgr4WQtGHt7oCXWpdEFrYB5E0r+E8+PN8
         Rwj583auZKHVOS1ErIuy3yl6um4yRYgPe3x6aTzNrbr0WUqZpp3okTPCOsTU/ug0cvt/
         H0GJ6eAdh5MQQqbZtFZ8YlLjHu0q2RYw/bAGuVV+3PpWIkAjhsVX7fnRN8ayV75j+t6/
         BowA==
X-Gm-Message-State: AOAM532me9WpaQ4z4DAHj9VZ5P933NaLD6CVuz9O7ZzkjfZe/amQqzAp
        5m6qnVYW4Q1+lRcB5zDcD4g=
X-Google-Smtp-Source: ABdhPJyf7RFP56DLxmpIyOGANhgyPuiolEwtFsmlL7gEqELMH0knJsUDmjdz1zG9fOpI5LqQbHF5jQ==
X-Received: by 2002:a5d:414e:: with SMTP id c14mr1991900wrq.57.1596099746227;
        Thu, 30 Jul 2020 02:02:26 -0700 (PDT)
Received: from ziggy.stardust (81.172.57.81.dyn.user.ono.com. [81.172.57.81])
        by smtp.gmail.com with ESMTPSA id g25sm7619605wmh.35.2020.07.30.02.02.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2020 02:02:25 -0700 (PDT)
Subject: Re: [v2,1/3] dt-binding: mediatek: mt8192: update mtk-wdt document
To:     Crystal Guo <crystal.guo@mediatek.com>
Cc:     "linux@roeck-us.net" <linux@roeck-us.net>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        =?UTF-8?B?U2VpeWEgV2FuZyAo546L6L+65ZCbKQ==?= 
        <seiya.wang@mediatek.com>,
        =?UTF-8?B?RXJpbiBMbyAo576F6ZuF6b2hKQ==?= <erin.lo@mediatek.com>
References: <1596016922-13184-1-git-send-email-crystal.guo@mediatek.com>
 <1596016922-13184-2-git-send-email-crystal.guo@mediatek.com>
 <c6ea8852-0381-0924-185e-083ea167f8fa@gmail.com>
 <1596072913.11360.12.camel@mhfsdcap03>
From:   Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <47a351dd-7b67-6280-a80f-c5299a4f260a@gmail.com>
Date:   Thu, 30 Jul 2020 11:02:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1596072913.11360.12.camel@mhfsdcap03>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org



On 30/07/2020 03:35, Crystal Guo wrote:
> On Wed, 2020-07-29 at 18:18 +0800, Matthias Brugger wrote:
>>
>> On 29/07/2020 12:02, Crystal Guo wrote:
>>> update mtk-wdt document for MT8192 platform
>>
>>
>> should be two patches. one fixing the compatibles and second adding new board.
>>
>>>
>>> Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
>>> ---
>>>    Documentation/devicetree/bindings/watchdog/mtk-wdt.txt | 5 +++--
>>>    1 file changed, 3 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
>>> index 4dd36bd..e36ba60 100644
>>> --- a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
>>> +++ b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
>>> @@ -4,14 +4,15 @@ Required properties:
>>>    
>>>    - compatible should contain:
>>>    	"mediatek,mt2701-wdt", "mediatek,mt6589-wdt": for MT2701
>>> -	"mediatek,mt2712-wdt", "mediatek,mt6589-wdt": for MT2712
>>> +	"mediatek,mt2712-wdt": for MT2712
>>>    	"mediatek,mt6589-wdt": for MT6589
>>>    	"mediatek,mt6797-wdt", "mediatek,mt6589-wdt": for MT6797
>>>    	"mediatek,mt7622-wdt", "mediatek,mt6589-wdt": for MT7622
>>>    	"mediatek,mt7623-wdt", "mediatek,mt6589-wdt": for MT7623
>>>    	"mediatek,mt7629-wdt", "mediatek,mt6589-wdt": for MT7629
>>> -	"mediatek,mt8183-wdt", "mediatek,mt6589-wdt": for MT8183
>>> +	"mediatek,mt8183-wdt": for MT8183
>>
>> We will need to update the DTSI in a seperate patch as well.
> 
> Yes, this patch is based on
> https://patchwork.kernel.org/patch/11690401/ , which modify description
> for mt2712 and mt8183.
> 

I don't understand your comment. This patch modifies the binding. The link you 
provide is from an older version of the series (which is called v2 as well...)

So repeating myself: if you are updating the binding descritpion you will have 
to update the dtsi as well as otherwise the binding and the dtsi are out of sync.

Regards,
Matthias
