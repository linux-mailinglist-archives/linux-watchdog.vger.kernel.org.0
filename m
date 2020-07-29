Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2733E231C93
	for <lists+linux-watchdog@lfdr.de>; Wed, 29 Jul 2020 12:18:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726365AbgG2KSp (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 29 Jul 2020 06:18:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726336AbgG2KSp (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 29 Jul 2020 06:18:45 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F49FC061794;
        Wed, 29 Jul 2020 03:18:45 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id f1so20530570wro.2;
        Wed, 29 Jul 2020 03:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=L+8hZ3DUqeSgXJLLu1cI0x5JkwDrCOyHENvm/ECikNc=;
        b=bIdFvI3/b8pv4BIyHsFtohM1EZp7ZiWGwuY25r0zJSXFAfX9+sd5ktN+PbRNZDbqlV
         zRzoLtSlknW5G4ti5ZRIywZWxbhkff5gJSsFZgfpNT6NN6Xipbo8mNa63fWGVtdwWe/4
         OpJGFH4susK10dQS6o3d40MIExTwIPmnfKyZtNNAIwRfuLaLluuJ++DYQToe4lqGulPo
         ItRdwZeTv/4AbPPpZPwojxn37JkFcbE59xemrKMVMQ6WL7Vxo1ft7Svp9S/x6lHX1mLs
         psxI/L8x+LyZcR6Wr5hK0BQn7X2nDQ9zESvULQ7XE+gJA/vMonbnWzDz91SCuPUWA/LV
         IOeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=L+8hZ3DUqeSgXJLLu1cI0x5JkwDrCOyHENvm/ECikNc=;
        b=DqNkP67puBWEHqJfqYy1lCcd08JF+JmczkfrYFE8cvqFaTxvQ++xqvcRadSamxicbf
         clpc1O2TmFWZfnmTMFYIbu8ruZZfnkv2ZlOYvT35rZH+BRR7H5bjkgO5EdNC1/JJn9Jd
         0LKPcgEiZJay1pVsKq8g6DJQ1pEV9LC5XbxYazoJZJ+RGb55HiQhizQ4DueNuAUauqB6
         9qQmt1TDVEpvd4MqQcPjsU3c0KdMbazuNwTSoqUE0O8ODKZGf0byoQXwPJpIBjokM0nn
         +4qmA9WYV57ohr0n8CdhpJHIl8/vmaS5vhm2rheMipLU7k35c6ACmjXlJuPY/mxAGt36
         2PMQ==
X-Gm-Message-State: AOAM532KUy94BRYm7cfDKHOJbq/sf8RVmcgYfqZbj13RHoR/5BG4QPi5
        y/7qzO3UzpsDebrKwO+RJyUNRpFdxBo=
X-Google-Smtp-Source: ABdhPJyVVOF7Ria9gxZG0U9j3Vr6Dep9PAZVLWiHJbAHm04ETXwhwhaGwQN1UKqYu3/SAS/3h3B7qg==
X-Received: by 2002:a5d:6702:: with SMTP id o2mr28315989wru.364.1596017923835;
        Wed, 29 Jul 2020 03:18:43 -0700 (PDT)
Received: from ziggy.stardust ([213.195.122.158])
        by smtp.gmail.com with ESMTPSA id z12sm4182465wrp.20.2020.07.29.03.18.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2020 03:18:43 -0700 (PDT)
Subject: Re: [v2,1/3] dt-binding: mediatek: mt8192: update mtk-wdt document
To:     Crystal Guo <crystal.guo@mediatek.com>, linux@roeck-us.net,
        robh+dt@kernel.org
Cc:     srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org, seiya.wang@mediatek.com,
        erin.lo@mediatek.com
References: <1596016922-13184-1-git-send-email-crystal.guo@mediatek.com>
 <1596016922-13184-2-git-send-email-crystal.guo@mediatek.com>
From:   Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <c6ea8852-0381-0924-185e-083ea167f8fa@gmail.com>
Date:   Wed, 29 Jul 2020 12:18:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1596016922-13184-2-git-send-email-crystal.guo@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org



On 29/07/2020 12:02, Crystal Guo wrote:
> update mtk-wdt document for MT8192 platform


should be two patches. one fixing the compatibles and second adding new board.

> 
> Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
> ---
>   Documentation/devicetree/bindings/watchdog/mtk-wdt.txt | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> index 4dd36bd..e36ba60 100644
> --- a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> +++ b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> @@ -4,14 +4,15 @@ Required properties:
>   
>   - compatible should contain:
>   	"mediatek,mt2701-wdt", "mediatek,mt6589-wdt": for MT2701
> -	"mediatek,mt2712-wdt", "mediatek,mt6589-wdt": for MT2712
> +	"mediatek,mt2712-wdt": for MT2712
>   	"mediatek,mt6589-wdt": for MT6589
>   	"mediatek,mt6797-wdt", "mediatek,mt6589-wdt": for MT6797
>   	"mediatek,mt7622-wdt", "mediatek,mt6589-wdt": for MT7622
>   	"mediatek,mt7623-wdt", "mediatek,mt6589-wdt": for MT7623
>   	"mediatek,mt7629-wdt", "mediatek,mt6589-wdt": for MT7629
> -	"mediatek,mt8183-wdt", "mediatek,mt6589-wdt": for MT8183
> +	"mediatek,mt8183-wdt": for MT8183

We will need to update the DTSI in a seperate patch as well.

>   	"mediatek,mt8516-wdt", "mediatek,mt6589-wdt": for MT8516
> +	"mediatek,mt8192-wdt": for MT8192
>   
>   - reg : Specifies base physical address and size of the registers.
>   
> 
