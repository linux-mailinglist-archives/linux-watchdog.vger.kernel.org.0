Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C95C73FEEDE
	for <lists+linux-watchdog@lfdr.de>; Thu,  2 Sep 2021 15:43:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234516AbhIBNon (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 2 Sep 2021 09:44:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234188AbhIBNon (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 2 Sep 2021 09:44:43 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7187C061575;
        Thu,  2 Sep 2021 06:43:44 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id c42-20020a05683034aa00b0051f4b99c40cso2579287otu.0;
        Thu, 02 Sep 2021 06:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=HE235/mk/bT/zxikKcuwhXM6G64fh6+hmbGzpNdUjKk=;
        b=ivdbizEGV4wUWpUSChSsswSUp1vDcIzdNH51EL1xTFsqgMvjN06Z53ZUte0lZipv2H
         HY/EXq4DZvSqEGxjZu0VxoqF5DGtJEY6CEIIDF54r6GX+T9jSYo3vMRKSZ3+EKaj0tTh
         j7LEwuDV91aJJJztofZZJgyXDfEwffga72yTysYx5e7AiQjiVgt+m0uSM6LnTpuSAX7/
         ARAwjfz/yfxjAb75yhxyomktUso3zseD+aFCSjhTEPMJggF7nF81vThVx3KNdBHdNA21
         2+qnm7gTotuifhGSqeWScp8SNTBdtYJuv+xKzWBZhk/YO5hK9j2YkEo19awMN7LPAdIV
         ml8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HE235/mk/bT/zxikKcuwhXM6G64fh6+hmbGzpNdUjKk=;
        b=YHCUKLh4Ctxiy1UHdtaK0BV3FNUOzTL9G+hIKRl7qYiaf7iEt2C+jXY1Z4Mp28t+xG
         5Zlbh3pnRxQBDU24ZXaatpeHcMCfvx0EOO+0aZ50IrdTQi2Rl+0BduAw7AG3JLHOsAR6
         u04OmsFUiHo0dM3ZtHQrd2OigSVY1xjkw6xHhw7Dv0MdMKa5osyNhth3e4N8e305/0HK
         yyjf1JpRRpOBlDuf7TMVy3gyhIGLS/zHuamLFRBdcZBE1w7y8lJ4zq7WBfIuUXKTp/fm
         L88ePE1/2MGKnQ4sDq5ODwVA0cehdkNDKzufikAmHfcSRun8w7Fze2h4SJ+GQc1ugqe2
         9/Fw==
X-Gm-Message-State: AOAM530VfSwhwJKVZGI4kdLSnXGbhJ14hCyJxQwJS7jGVsNC4ipS9QsY
        y7/5PSNPMtunqwiYLhNS4Uo=
X-Google-Smtp-Source: ABdhPJzvT9pgA/VoTeJa1wp735xrELEdJoBuboxjZ3tM94W9m/5OuIAGxdBFRadPLGFIQ1Jmqq3WfA==
X-Received: by 2002:a05:6830:124b:: with SMTP id s11mr2657581otp.90.1630590224195;
        Thu, 02 Sep 2021 06:43:44 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f5sm387641oij.6.2021.09.02.06.43.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Sep 2021 06:43:43 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH] watchdog: mtk: add disable_wdt_extrst support
To:     Fengquan Chen <Fengquan.Chen@mediatek.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     tinghan.shen@mediatek.com, randy.wu@mediatek.com,
        rex-bc.chen@mediatek.com, christine.zhu@mediatek.com,
        joe.yang@mediatek.com, zhishuang.zhang@mediatek.com
References: <1630569881-6032-1-git-send-email-Fengquan.Chen@mediatek.com>
 <1630569881-6032-2-git-send-email-Fengquan.Chen@mediatek.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <5fe9c774-c619-604e-1f74-12ff6bfe826f@roeck-us.net>
Date:   Thu, 2 Sep 2021 06:43:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1630569881-6032-2-git-send-email-Fengquan.Chen@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 9/2/21 1:04 AM, Fengquan Chen wrote:
> From: "fengquan.chen" <fengquan.chen@mediatek.com>

There should not be such From: line.

> 
> In some cases, we may need watchdog just to trigger an
> internal soc reset without sending any output signal.
> 
> Provide a disable_wdt_extrst parameter for configuration.
> We can disable or enable it just by configuring dts.
> 
> igned-off-by: Fengquan Chen <fengquan.chen@mediatek.com>

Missing "S".

> ---
>   drivers/watchdog/mtk_wdt.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
> index 97ca993..4824c07 100644
> --- a/drivers/watchdog/mtk_wdt.c
> +++ b/drivers/watchdog/mtk_wdt.c
> @@ -63,6 +63,7 @@ struct mtk_wdt_dev {
>   	void __iomem *wdt_base;
>   	spinlock_t lock; /* protects WDT_SWSYSRST reg */
>   	struct reset_controller_dev rcdev;
> +	bool disable_wdt_extrst;
>   };
>   
>   struct mtk_wdt_data {
> @@ -240,6 +241,8 @@ static int mtk_wdt_start(struct watchdog_device *wdt_dev)
>   
>   	reg = ioread32(wdt_base + WDT_MODE);
>   	reg &= ~(WDT_MODE_IRQ_EN | WDT_MODE_DUAL_EN);
> +	if (mtk_wdt->disable_wdt_extrst)
> +		reg &= ~WDT_MODE_EXRST_EN;
>   	reg |= (WDT_MODE_EN | WDT_MODE_KEY);
>   	iowrite32(reg, wdt_base + WDT_MODE);
>   
> @@ -309,6 +312,10 @@ static int mtk_wdt_probe(struct platform_device *pdev)
>   		if (err)
>   			return err;
>   	}
> +
> +	mtk_wdt->disable_wdt_extrst =
> +		of_property_read_bool(dev->of_node, "disable_extrst");
> +

The new property needs to be documented and approved by a DT maintainer
(separate patch). Something like "mtk,disable-extrst" would probably be
a better property name.

Guenter
