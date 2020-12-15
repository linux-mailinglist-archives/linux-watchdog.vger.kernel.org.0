Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B79EE2DB169
	for <lists+linux-watchdog@lfdr.de>; Tue, 15 Dec 2020 17:30:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730696AbgLOQ2X (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 15 Dec 2020 11:28:23 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:39546 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730667AbgLOQ14 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 15 Dec 2020 11:27:56 -0500
Received: by mail-ot1-f67.google.com with SMTP id d8so19935793otq.6;
        Tue, 15 Dec 2020 08:27:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0wE9xxwceDsZ28zByo+4tEOtDOwFOo+Prr+3q9/hj2o=;
        b=rtcEwb7Fk597grcApcass3vXbTbl+YbA8tmjPRJQEGfzA5ZEz9fAC8doJn2/GK2xEL
         zSNDbyO+5qm/QbRzMtbZAdOYXFSyW2rcTrOq4y65v9kLqURtlbHijFPufBPvhm8nsGOK
         Fr3rdCVgkMdrcMdt1NM9oAMgg030UG310D3MIdDfZFgivEVzH3w8EFOxLt5ntbea33zh
         +av2G+WTmXBYItU7P6PDW9HtPtuhus8Nkq1Ll+W6p/zsxZ0nlpOb1U0bD8b+2VJHLHiT
         MebhPcOZWtdufR5FuX0Nb49PjkmmEM1ojuX58bs11J1xOSrLyCSCKygVTQjXR6veLfkJ
         VIpA==
X-Gm-Message-State: AOAM530oGsCvOhc+o5IbncS1/cAdMqoInaz6g+1Nwo3hmMd18oOOmq6C
        dPiVmqP5q1aDyMFi7/wyTZ+whNaZ1g==
X-Google-Smtp-Source: ABdhPJy1abSIEoMit2agW50JmubPYDwJhEqtAqTA8omppWigtJGNrpVDmK82Ox8qoB4eAbF+QfcVFQ==
X-Received: by 2002:a9d:64da:: with SMTP id n26mr23393499otl.64.1608049635151;
        Tue, 15 Dec 2020 08:27:15 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id k3sm4745446oor.19.2020.12.15.08.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Dec 2020 08:27:14 -0800 (PST)
Received: (nullmailer pid 3972401 invoked by uid 1000);
        Tue, 15 Dec 2020 16:27:13 -0000
Date:   Tue, 15 Dec 2020 10:27:13 -0600
From:   Rob Herring <robh@kernel.org>
To:     Icenowy Zheng <icenowy@aosc.io>
Cc:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-watchdog@vger.kernel.org
Subject: Re: [RFC PATCH 09/12] dt-bindings: watchdog: sunxi: add compatible
 string for V831/V833 WDT
Message-ID: <20201215162713.GA3970789@robh.at.kernel.org>
References: <20201212040157.3639864-1-icenowy@aosc.io>
 <20201212050519.3644837-1-icenowy@aosc.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201212050519.3644837-1-icenowy@aosc.io>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Sat, Dec 12, 2020 at 01:05:16PM +0800, Icenowy Zheng wrote:
> V831/V833 has a watchdog similar to the ones on previous Allwinner SoCs
> after sun6i.
> 
> Add a compatible string for it.
> 
> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: linux-watchdog@vger.kernel.org
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
>  .../devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml  | 3 +++
>  1 file changed, 3 insertions(+)

This is going to conflict with Andre's series for H616.

> 
> diff --git a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> index e8f226376108..2f3c350b0057 100644
> --- a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> @@ -18,6 +18,9 @@ properties:
>      oneOf:
>        - const: allwinner,sun4i-a10-wdt
>        - const: allwinner,sun6i-a31-wdt
> +      - items:
> +          - const: allwinner,sun8i-v831-wdt
> +          - const: allwinner,sun6i-a31-wdt
>        - items:
>            - const: allwinner,sun50i-a64-wdt
>            - const: allwinner,sun6i-a31-wdt
> -- 
> 2.28.0
