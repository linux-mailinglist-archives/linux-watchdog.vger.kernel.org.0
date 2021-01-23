Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DB6D301791
	for <lists+linux-watchdog@lfdr.de>; Sat, 23 Jan 2021 19:22:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725899AbhAWSWL (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 23 Jan 2021 13:22:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725883AbhAWSWK (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 23 Jan 2021 13:22:10 -0500
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BA0EC0613D6;
        Sat, 23 Jan 2021 10:21:29 -0800 (PST)
Received: by mail-oi1-x22b.google.com with SMTP id g69so9245307oib.12;
        Sat, 23 Jan 2021 10:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=o1+l2WKjyhScHlobbmNQ1HDWRupu0a6RVtPaX1gSBpg=;
        b=IfmEv41K+pi+CNr+TFYMIP5c1eBl6UT4z4hLUTnjb/GVVONj/KLgzrUEoVIU8IuetP
         h6oimYL3XgcypPBRiIoqZvdlAHfXklESQBfgQH2L5ca/eQbpjGOzh8amtaqaBr0t7MUQ
         6ixB8LUXID2xZACWmMt7Zu3WULJ1lZWMY3bI/JxoH/uo06O1VfTNdcKfwZy0WUCwVdbl
         sDe9bk6MqGbE0vGUa295Pcog/SQ8Ot0VhYBHa83LSCEjjhkZzhrvK7aKKvowxgCJjWmV
         GMZhovc5uAj1vSXyFjYfGYa3k7cVTP6yN0a1OgAfRkfw2haknrm+EpLvdkZkKmf9a8A3
         NuDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=o1+l2WKjyhScHlobbmNQ1HDWRupu0a6RVtPaX1gSBpg=;
        b=F0+LjwXVw6Emvnw1J7uGQx0KSAIrloLpJ06hfnJ0Z8ITtnKJTwMpIUfkMbiKmqQY7S
         YrOuMAM9oaHaJ7bUW8q9zJsq6XnMRQJVqPMw6iSbSSYqpjhp5A/pb8opUyX4n03UJYbM
         IVetSWAzYhyR6b7tlVCtzZVAI8TrD7zWZenNDgfi18pTeqIxwZkDLVNY4i4d3wy5r9gc
         LuvXC3aQDyt2238Xk5cZc/kgkOOlb7LguWxx7GU2jTX4e2mDBjcq9OvXhpTkjyLE2PkV
         U6zf6zLqUEUoUrnz6yupQwHo+6DBn2dgYPrGqRP5dS5ddg/tME3dV2yBinjd8fIoOxFm
         fdZw==
X-Gm-Message-State: AOAM531Z2BkfeGtKmUgm6oA86o6C0P0hM/KamEs1mXeKY7oKB1TF2bEm
        vQpYXN2V3Art90lRWGYD0lQ=
X-Google-Smtp-Source: ABdhPJzw8ZOextXm1YqCpQ+WwltMu8MNbaK9AYoUy78SsHB3yI8dVebPuHxvjgXUxyKhNeyveX7+Ng==
X-Received: by 2002:aca:ded4:: with SMTP id v203mr6782580oig.148.1611426088150;
        Sat, 23 Jan 2021 10:21:28 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j17sm2420316otj.52.2021.01.23.10.21.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 23 Jan 2021 10:21:27 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 23 Jan 2021 10:21:26 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Crystal Guo <crystal.guo@mediatek.com>
Cc:     wim@linux-watchdog.org, robh+dt@kernel.org, matthias.bgg@gmail.com,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org, seiya.wang@mediatek.com
Subject: Re: [v6,2/4] dt-binding: mediatek: mt8192: update mtk-wdt document
Message-ID: <20210123182126.GA59405@roeck-us.net>
References: <20201014131936.20584-1-crystal.guo@mediatek.com>
 <20201014131936.20584-3-crystal.guo@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201014131936.20584-3-crystal.guo@mediatek.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Oct 14, 2020 at 09:19:34PM +0800, Crystal Guo wrote:
> update mtk-wdt document for MT8192 platform
> 
> Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  Documentation/devicetree/bindings/watchdog/mtk-wdt.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> index 45eedc2c3141..e36ba60de829 100644
> --- a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> +++ b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> @@ -12,6 +12,7 @@ Required properties:
>  	"mediatek,mt7629-wdt", "mediatek,mt6589-wdt": for MT7629
>  	"mediatek,mt8183-wdt": for MT8183
>  	"mediatek,mt8516-wdt", "mediatek,mt6589-wdt": for MT8516
> +	"mediatek,mt8192-wdt": for MT8192
>  
>  - reg : Specifies base physical address and size of the registers.
>  
