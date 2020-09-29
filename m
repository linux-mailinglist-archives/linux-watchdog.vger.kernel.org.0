Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8351F27D691
	for <lists+linux-watchdog@lfdr.de>; Tue, 29 Sep 2020 21:13:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728276AbgI2TNm (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 29 Sep 2020 15:13:42 -0400
Received: from mail-oo1-f66.google.com ([209.85.161.66]:35265 "EHLO
        mail-oo1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728166AbgI2TNm (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 29 Sep 2020 15:13:42 -0400
Received: by mail-oo1-f66.google.com with SMTP id k13so1566817oor.2;
        Tue, 29 Sep 2020 12:13:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3apJKDWcvWz74zAbbD3N/FA15x9Q19lWsHwIKOQmjrM=;
        b=FYaObX4g1RQPSZHn/XtFWiLc4dZNgRRSVOCP8+d9KNBcitNfHTQb8VY2BLjnwl1D97
         rsWjNBoMdy8raK7reS4D2LfCMFMcV6tJ1cMn3BqD5xjnAH/qkAFjZLwarJQvINyDv8pb
         MnjJvgfgA3qctyfFUevIIs8CucyGwicsXFv8LEN9GQFvupPIwhxEtQk7MOXH7cf8+lM+
         xd85dFSwq7jodUkwXYQBb/I4u7/lovZiPaExDSxzv/M+etUVZB3Xj/QaAgqKoQN77MHE
         lJxJHz4OdH2Bqqo2c5mgeBKya38XrS/7jJrSGkHuk99OVLcT9Zop36I/S7CYSD3Kluqq
         e2xg==
X-Gm-Message-State: AOAM530ozh7KrXHPvd2t2rN/5RQerEYC1AbrHNQgYFqLRdJqHQt/pTJe
        3/ILS/rGypNH/2XizxzQBrHGeHq4hze0th8=
X-Google-Smtp-Source: ABdhPJyE7Q4zF24KtPjpoKMGqaGZg0/XYC6UygVr0CttuA24Hlv5xYif6jjMM0Xw0ZrdNlSIdF1DUg==
X-Received: by 2002:a4a:dc06:: with SMTP id p6mr5794364oov.10.1601406819987;
        Tue, 29 Sep 2020 12:13:39 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id c124sm1203355oib.22.2020.09.29.12.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 12:13:39 -0700 (PDT)
Received: (nullmailer pid 989018 invoked by uid 1000);
        Tue, 29 Sep 2020 19:13:38 -0000
Date:   Tue, 29 Sep 2020 14:13:38 -0500
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     devicetree@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>,
        Stefan Agner <stefan@agner.ch>,
        Anson Huang <Anson.Huang@nxp.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        linux-arm-kernel@lists.infradead.org,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: watchdog: fsl-imx: document i.MX
 compatibles
Message-ID: <20200929191338.GA988964@bogus>
References: <20200926162302.32525-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200926162302.32525-1-krzk@kernel.org>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Sat, 26 Sep 2020 18:23:00 +0200, Krzysztof Kozlowski wrote:
> Document all ARMv5, ARMv6 and ARMv7 i.MX compatibles used in DTSes (even
> though driver binds only to fsl,imx21-wdt) to fix dtbs_check warnings
> like:
> 
>   arch/arm/boot/dts/imx53-qsb.dt.yaml: gpio@53fe0000: compatible:
>     ['fsl,imx53-gpio', 'fsl,imx35-gpio'] is not valid under any of the given schemas
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  .../devicetree/bindings/watchdog/fsl-imx-wdt.yaml  | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
