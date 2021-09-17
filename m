Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 012BD40FAE8
	for <lists+linux-watchdog@lfdr.de>; Fri, 17 Sep 2021 16:57:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238586AbhIQO6z (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 17 Sep 2021 10:58:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238372AbhIQO6y (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 17 Sep 2021 10:58:54 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4180C061574;
        Fri, 17 Sep 2021 07:57:32 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id c42-20020a05683034aa00b0051f4b99c40cso13260743otu.0;
        Fri, 17 Sep 2021 07:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=HommjSZU0AKAIbij2iHpVnnWLtjGW54TVbe+ijcsoYw=;
        b=lPb2rV/oAhgrjCYBZIlVrsCzk27usUH6Yr7w+t8cGylQD0VOR3/Pmsxbq2fEGwfNdQ
         z1+MqIDv0+bW4yGCjhbK+oF3cvoQzQAu8pU3I6btsvwt/XTDQuqnLeD+47FEHtN1Ir2H
         wuUHXMXmWcjN36cLM7T6OJzFRy/EeVjWxX2U2kQh+bX/sPCuqXNxgKWQagLcIITkn/ao
         +BLA46DoNiQ48YYZqUrEL4S16gS0dTqTZ00gIPrrGy14Fy5D2n+i8gS8/NfnzBZTq18r
         zvLlU8QRVQ/aLyyygpq4qIZ9hq2VLdSJy78JjqlQ677wJmq8q4PJZSDPxh7i5AjEp6IW
         x5Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=HommjSZU0AKAIbij2iHpVnnWLtjGW54TVbe+ijcsoYw=;
        b=iYIxaa09YJVVMy/Gu5S4gqyTkSaYTT6Abknsyjx4m55B+rVVyy6G9Xt9mXund/RH6r
         ceByruqRlwanMenc/RQxtGFWTd3q5OjJWJiqeMtCx90tfAhffP0GqaoodLmQqJtD6qct
         dP5Aa3qQgSy3x/zQJFRZp7v+yopsjedYywi29nFUjxxw51k0Ij3bQELk6Pxoj38zDqPI
         CkDjrdi4fdwXdh7TemrCYNTHjx0lLnw/zwv0z9xesWUMJ/hZiwZHp+4jXPmwxFXGbXyb
         F2QzxQeN2O7cS3pwvp+J9q8NSx8AwN095aZXPlx6h1iQs5HgKSz6QMkJcRpTzTe0ovAv
         oNew==
X-Gm-Message-State: AOAM531WBXkOrPJnvHxKBvGmDz0BxN8PPkZqemkl2AL1aDIfEW/ZshI+
        k0NsUrcd1J2nqW4WD78Wt9c=
X-Google-Smtp-Source: ABdhPJw0nznUgbbF88p8qquwhDmGqe5hPv4Kaux6JWVLLmnsuidDV0EnAGbUS1FS3wxGLB4XdBXpzg==
X-Received: by 2002:a9d:4a88:: with SMTP id i8mr9347177otf.290.1631890652285;
        Fri, 17 Sep 2021 07:57:32 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v11sm1571613oto.22.2021.09.17.07.57.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Sep 2021 07:57:31 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 17 Sep 2021 07:57:29 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Fengquan Chen <Fengquan.Chen@mediatek.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        tinghan.shen@mediatek.com, randy.wu@mediatek.com,
        rex-bc.chen@mediatek.com, christine.zhu@mediatek.com,
        joe.yang@mediatek.com, zhishuang.zhang@mediatek.com,
        Rob Herring <robh@kernel.org>
Subject: Re: [v3,1/2] dt-bindings: watchdog: mtk-wdt: add disable_wdt_extrst
 support
Message-ID: <20210917145729.GA1426468@roeck-us.net>
References: <20210914123454.32603-1-Fengquan.Chen@mediatek.com>
 <20210914123454.32603-2-Fengquan.Chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210914123454.32603-2-Fengquan.Chen@mediatek.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Sep 14, 2021 at 08:34:53PM +0800, Fengquan Chen wrote:
> This patch add a description and example of disable_wdt_extrst
> element for watchdog on MTK Socs
> 
> Signed-off-by: Fengquan Chen <fengquan.chen@mediatek.com>
> Acked-by: Rob Herring <robh@kernel.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  Documentation/devicetree/bindings/watchdog/mtk-wdt.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> index a4e31ce96e0e..0114871f887a 100644
> --- a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> +++ b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> @@ -22,6 +22,7 @@ Required properties:
>  - reg : Specifies base physical address and size of the registers.
>  
>  Optional properties:
> +- mediatek,disable-extrst: disable send output reset signal
>  - interrupts: Watchdog pre-timeout (bark) interrupt.
>  - timeout-sec: contains the watchdog timeout in seconds.
>  - #reset-cells: Should be 1.
> @@ -31,6 +32,7 @@ Example:
>  watchdog: watchdog@10007000 {
>  	compatible = "mediatek,mt8183-wdt",
>  		     "mediatek,mt6589-wdt";
> +	mediatek,disable-extrst;
>  	reg = <0 0x10007000 0 0x100>;
>  	interrupts = <GIC_SPI 139 IRQ_TYPE_NONE>;
>  	timeout-sec = <10>;
