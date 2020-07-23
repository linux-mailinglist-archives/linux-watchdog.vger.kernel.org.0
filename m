Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11B6322B8A8
	for <lists+linux-watchdog@lfdr.de>; Thu, 23 Jul 2020 23:29:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726411AbgGWV3j (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 23 Jul 2020 17:29:39 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:38836 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726029AbgGWV3j (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 23 Jul 2020 17:29:39 -0400
Received: by mail-io1-f66.google.com with SMTP id l1so7791379ioh.5;
        Thu, 23 Jul 2020 14:29:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PKjiq4T6ylU+ZE/im6S7vQ1AiFBJDWu+p5nUwbAC36I=;
        b=gtRa/InpV1DwshIfI3QgYhZzQ+x0TsJu/dVeYEHNWFmFt4GUuApVSareqXwDaI9F0z
         tvUOip4ObaweBt68tM98HVR9hzVgrweKZFk0bJifJn/NGlVPa0AxWgbzj/iGHxvgyVyq
         oxFgP0Dij8RjNFTixzY7IqyO6qAkxqe7Zq0cH4fjmJrSGv7xx2qYlQ8q2Fhazfv7mIrw
         0CgnPmDORjpLKuiDxTzRZZiTgl7UcCYV7E3DqU1mSU6QOj8nFj5VUReHyn6GPhd9qP5Y
         VjGeJRRI8WdMfZ5WxsfJjunS2iuUpSkb+tCzDwqpWuUIJTQmMnMMiwPIa9BPeA0/eAuH
         1Nyw==
X-Gm-Message-State: AOAM530HoH6kWVBglYup8gzf3BRtDRFAfqvtiUWOhE0f2etk0iUPvLAN
        O6DqjL3ZFkR0jbAsGgu3Pg==
X-Google-Smtp-Source: ABdhPJwktoQrHUMPZb4LfKcFpGKWCTBn3uvkuMoKW0CGw3OW5bX4yYqjPO82L6bs2oZ16Kkzw7x4Kg==
X-Received: by 2002:a6b:fb01:: with SMTP id h1mr7090450iog.18.1595539778239;
        Thu, 23 Jul 2020 14:29:38 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id n7sm2032759iob.44.2020.07.23.14.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2020 14:29:37 -0700 (PDT)
Received: (nullmailer pid 891483 invoked by uid 1000);
        Thu, 23 Jul 2020 21:29:35 -0000
Date:   Thu, 23 Jul 2020 15:29:35 -0600
From:   Rob Herring <robh@kernel.org>
To:     Seiya Wang <seiya.wang@mediatek.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org, srv_heupstream@mediatek.com,
        Crystal Guo <crystal.guo@mediatek.com>
Subject: Re: [PATCH 4/4] dt-binding: mediatek: mt8192: update mtk-wdt document
Message-ID: <20200723212935.GA889594@bogus>
References: <20200723090731.4482-1-seiya.wang@mediatek.com>
 <20200723090731.4482-5-seiya.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200723090731.4482-5-seiya.wang@mediatek.com>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Jul 23, 2020 at 05:07:31PM +0800, Seiya Wang wrote:
> From: Crystal Guo <crystal.guo@mediatek.com>
> 
> update mtk-wdt document for MT8192 platform
> 
> Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
> ---
>  Documentation/devicetree/bindings/watchdog/mtk-wdt.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> index 4dd36bd3f1ad..d760ca8a630e 100644
> --- a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> +++ b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> @@ -12,6 +12,8 @@ Required properties:
>  	"mediatek,mt7629-wdt", "mediatek,mt6589-wdt": for MT7629
>  	"mediatek,mt8183-wdt", "mediatek,mt6589-wdt": for MT8183
>  	"mediatek,mt8516-wdt", "mediatek,mt6589-wdt": for MT8516
> +	"mediatek,mt8192-wdt": for MT8192
> +

So, not compatible with "mediatek,mt6589-wdt"? Is so, perhaps summarize 
what the differences are.

>  
>  - reg : Specifies base physical address and size of the registers.
>  
> -- 
> 2.14.1
