Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D68CE2330C2
	for <lists+linux-watchdog@lfdr.de>; Thu, 30 Jul 2020 13:11:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726873AbgG3LLj (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 30 Jul 2020 07:11:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726367AbgG3LLi (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 30 Jul 2020 07:11:38 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24199C061794;
        Thu, 30 Jul 2020 04:11:37 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id z18so20945418wrm.12;
        Thu, 30 Jul 2020 04:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+0iowu5xEfPH7yjXvVBsR1zC3LFBJmoKMH8nuby/sFI=;
        b=GnWpPtrtvLFQrIvPWKQ3x+hLmZQOnsGb2mOxnHtZf+3PKUEyAfUB5sGJImtjtbm6zr
         6U7vMKvKE8VRMhaUPT21A8bglTvJzmBmah7MqtoF++11LRRhCoBBb5x34ABeYLAMKzZ/
         OigG88mHCVRGTHXayDVGS9o/pj9cJ2lAIwo07rR5IKKqA4VngkOVFIF10/p8Cqacdqkr
         IpPvHvvn9RQw5Tsa9iWA4HmvopcWpjmM78H1r6/YC4xXCoz81udYkQez3cJyW71F/2Cs
         JsS9s+UcdTmDDXnmvtlDzykh+mw+4DO06ELW/mExH6HTUqulWglC73UdJvjMY+ui9Hfn
         nsUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+0iowu5xEfPH7yjXvVBsR1zC3LFBJmoKMH8nuby/sFI=;
        b=bZP5aJzltBooiok9oT4jsa0MU1vfIef0j6ZNTeSSEWEBnr0QSiT31iQPXutxe61MTP
         TXNDVDaGJUtF8visFEpMJH23xPT+dXUnB7Mpt5aJgeXuRUKjUWN3UyJjT698+jFI05fb
         iJ6cdAKs/zG+61stiDiNeDEfVdo5zcooj+tJJzXp1AXJ49k9D9CGF7ecytumPd7NAHvB
         2a0QU6M5uy3w158kytzESN0+JS5KyD7PtL//S+ld2ZQANKj97/mcHLQU4bpBS+XqtXsb
         /TbcDIXAJojlsXHnJlgtxa2HEBNahwFaLtkMSMYRc7m7sWImodcQV75DVeKiQ8kKdi19
         uXcg==
X-Gm-Message-State: AOAM5324gLfKY+aAQlkh+5nF3kGe3SjoMwNaDlrCtLgyphCdLDYeDfwi
        PUBS8+XHmMaOgVoxxJDeIaBcb6/FoHw=
X-Google-Smtp-Source: ABdhPJyzrCbW0TufxlUf4YkPb0Dtc3clPloAllLT6W6ASv6ufOJZ4JIRJvQHLXGZ3Q5JjOxz3dalBg==
X-Received: by 2002:a5d:48c8:: with SMTP id p8mr2265618wrs.84.1596107495864;
        Thu, 30 Jul 2020 04:11:35 -0700 (PDT)
Received: from ziggy.stardust (81.172.57.81.dyn.user.ono.com. [81.172.57.81])
        by smtp.gmail.com with ESMTPSA id z8sm8387862wmf.42.2020.07.30.04.11.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2020 04:11:35 -0700 (PDT)
Subject: Re: [v3,1/5] dt-binding: mediatek: watchdog: fix the description of
 compatible
To:     Crystal Guo <crystal.guo@mediatek.com>, linux@roeck-us.net,
        robh+dt@kernel.org
Cc:     srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org, seiya.wang@mediatek.com
References: <1596104510-11113-1-git-send-email-crystal.guo@mediatek.com>
 <1596104510-11113-2-git-send-email-crystal.guo@mediatek.com>
From:   Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <2fca091d-4889-2564-0fe0-927093929f10@gmail.com>
Date:   Thu, 30 Jul 2020 13:11:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1596104510-11113-2-git-send-email-crystal.guo@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org



On 30/07/2020 12:21, Crystal Guo wrote:
> Besides watchdog, mt2712 and nt8183 also provide sub-system software
> reset features. But mt6589 not support this feature
> 
> Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>

My proposal for the commit message:

"The watchdog driver for MT2712 and MT8183 relies on DT data, so the fallback 
compatible MT6589 won't work."

With that or anything like that:

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   Documentation/devicetree/bindings/watchdog/mtk-wdt.txt | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> index 4dd36bd..45eedc2 100644
> --- a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> +++ b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> @@ -4,13 +4,13 @@ Required properties:
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
>   	"mediatek,mt8516-wdt", "mediatek,mt6589-wdt": for MT8516
>   
>   - reg : Specifies base physical address and size of the registers.
> 
