Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9581046D73F
	for <lists+linux-watchdog@lfdr.de>; Wed,  8 Dec 2021 16:44:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233907AbhLHPrl (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 8 Dec 2021 10:47:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233650AbhLHPri (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 8 Dec 2021 10:47:38 -0500
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com [IPv6:2607:f8b0:4864:20::c2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3047C061746
        for <linux-watchdog@vger.kernel.org>; Wed,  8 Dec 2021 07:44:06 -0800 (PST)
Received: by mail-oo1-xc2a.google.com with SMTP id b1-20020a4a8101000000b002c659ab1342so940544oog.1
        for <linux-watchdog@vger.kernel.org>; Wed, 08 Dec 2021 07:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=IRArnEbMOztmbyOTj+MWlwJucegmDvjTF1PfafI2nU8=;
        b=YjKPpH556mUnunfWLwQX9k7x4QLylXJZUiVkVxzIvM1nLMRBmqHT+7XobjEuYaJccG
         FLJqKrYQeq2j/yDmJRtUkkNHwrs8eMjriypPB5VrvwC52PNKPIpe+Wbt9ME+hG5RFMrt
         srbmJh8pbtr3KRDCdr5QRikqx3Z9rbdalS7bEa1kRyIYb/SEvyfwNnqj1nbV3h4VLiwE
         42Fk+LHPQuWvkjBCRYB0CCMdw9sNkFviwR9eupqUtIjPL165syYlDzpQgq95xqspDNJl
         apwDzIWZv5v2VsKwl9XLag6afOs8noYn19YHYizLPEv2Ts+ovVaM3l0VoYb6Uy/Pg2lw
         3AeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=IRArnEbMOztmbyOTj+MWlwJucegmDvjTF1PfafI2nU8=;
        b=k2PebrsNmYjbYTz5mqqvADK3kPudi//ffTCGbdfh6fgj68RHpBYQOGd0oRRtf4pxmj
         3FR/NnYZrXkFFdzpHniwlhOODBrACvYBoNKTg4Foh8rUtaWNSnIDh91AbZuaVKff9gia
         2a2cevJ4XQTziH2pJ4NMhT9bDvdD3Q40agBVmnOlXUOMkKlJ4qcZRr/zJnUwRgSeUVc1
         X/c2vd4DYm/ZMHbZyJV6Hl6HLyPFx/jgL08gMqznq9OQEbM65WiBj3rIEb4UG+miuN1F
         lqd1nTXhmu0RQfXoLYCemO667XV5ANl3NfXc1FwXRRFpxYJxwilQ5XMcV1WXU83nlu5Q
         ah7g==
X-Gm-Message-State: AOAM530qyFfprZX2L1lHSYQF+UuCcuDFt6WCinbssdRaFrzVoYrV4FAJ
        U8/RkoznBukijgr2on75kw93aXIZ03o=
X-Google-Smtp-Source: ABdhPJx1XEhf8O9VtJfXTVdjxdZSEDndjFeVobBKh/ztIW6ZBlvGLRlnbr7rkZAxxlLe2yLbeLhSsA==
X-Received: by 2002:a4a:9292:: with SMTP id i18mr190335ooh.90.1638978246227;
        Wed, 08 Dec 2021 07:44:06 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i29sm543824ots.49.2021.12.08.07.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 07:44:05 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 8 Dec 2021 07:44:03 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Tzung-Bi Shih <tzungbi@google.com>
Cc:     wim@linux-watchdog.org, matthias.bgg@gmail.com,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, wangqing@vivo.com
Subject: Re: [PATCH] watchdog: mtk_wdt: use platform_get_irq_optional
Message-ID: <20211208154403.GA1031331@roeck-us.net>
References: <20211208095555.4099551-1-tzungbi@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211208095555.4099551-1-tzungbi@google.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Dec 08, 2021 at 05:55:55PM +0800, Tzung-Bi Shih wrote:
> The watchdog pre-timeout (bark) interrupt is optional.  Use
> platform_get_irq_optional() to avoid seeing such following
> error message:
> >>> mtk-wdt 10007000.watchdog: IRQ index 0 not found
> 
> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> The patch bases on linux-next next-20211208.
> 
>  drivers/watchdog/mtk_wdt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
> index 543cf38bd04e..4577a76dd464 100644
> --- a/drivers/watchdog/mtk_wdt.c
> +++ b/drivers/watchdog/mtk_wdt.c
> @@ -339,7 +339,7 @@ static int mtk_wdt_probe(struct platform_device *pdev)
>  	if (IS_ERR(mtk_wdt->wdt_base))
>  		return PTR_ERR(mtk_wdt->wdt_base);
>  
> -	irq = platform_get_irq(pdev, 0);
> +	irq = platform_get_irq_optional(pdev, 0);
>  	if (irq > 0) {
>  		err = devm_request_irq(&pdev->dev, irq, mtk_wdt_isr, 0, "wdt_bark",
>  				       &mtk_wdt->wdt_dev);
> -- 
> 2.34.1.173.g76aa8bc2d0-goog
> 
