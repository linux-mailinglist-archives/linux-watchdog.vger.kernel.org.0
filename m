Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A51919F3C7
	for <lists+linux-watchdog@lfdr.de>; Tue, 27 Aug 2019 22:08:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730621AbfH0UI6 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 27 Aug 2019 16:08:58 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:35410 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727484AbfH0UI5 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 27 Aug 2019 16:08:57 -0400
Received: by mail-oi1-f195.google.com with SMTP id a127so272523oii.2;
        Tue, 27 Aug 2019 13:08:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Ng/ondwrrnfBxKPNMtYoFquttD4noee2/m3ndHQDx/0=;
        b=Ib0+i8CMaAbtL7/7qIyHGy4Ferr4vHLU0YpAYTrdWf5gzpQy6TdLnJ1CYOpQ+U3X8e
         zQRAo7Lnbe6KNhW8Iu6LahuZD2lcBVIzAY/7scmnGyG05Y0Xg30wPUPTMZ3iiuYti1WS
         5UYn+6vvNxxYmQxqZm4YjOBoDi1jA7EHadn1JmI4OzmvYdq7TxqkElpXjNNkgPFf83au
         lNo3bSh0zrcoUZOzewiaVFgSCXt1hEeGfp30f/0KLqIxsWOCTNuo8LGRSLq+TJvEKhUp
         pttukgkE7opZtSEZAy6B8/CkCqGvPf8aAN2SF64jPM+Mf1K7+9oJHmsNJIdF6Bex2oRW
         GUJw==
X-Gm-Message-State: APjAAAXPXh0x97zhAhKoMLqFLB9+RMtkxYpen9sSTTpFDPJgj2957EHK
        fFKQgaVUPPdaIVAaiv7DMA==
X-Google-Smtp-Source: APXvYqzzs9eWBhou0aG3BlVhbCRM/HDy6khsII/8Kx06DMoap2M/MFjtTc2tykVoa1mrUGNt8UVn6A==
X-Received: by 2002:aca:3388:: with SMTP id z130mr329140oiz.81.1566936536648;
        Tue, 27 Aug 2019 13:08:56 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id l16sm135580otq.42.2019.08.27.13.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2019 13:08:56 -0700 (PDT)
Date:   Tue, 27 Aug 2019 15:08:55 -0500
From:   Rob Herring <robh@kernel.org>
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     wim@linux-watchdog.org, linux@roeck-us.net, mark.rutland@arm.com,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux@armlinux.org.uk, otavio@ossystems.com.br,
        leonard.crestez@nxp.com, schnitzeltony@gmail.com,
        u.kleine-koenig@pengutronix.de, jan.tuerk@emtrion.com,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Linux-imx@nxp.com
Subject: Re: [PATCH V4 1/4] dt-bindings: watchdog: Add i.MX7ULP bindings
Message-ID: <20190827200855.GA5260@bogus>
References: <1566441463-11911-1-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1566441463-11911-1-git-send-email-Anson.Huang@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Aug 21, 2019 at 10:37:40PM -0400, Anson Huang wrote:
> Add the watchdog bindings for Freescale i.MX7ULP.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
> No changes.
> ---
>  .../bindings/watchdog/fsl-imx7ulp-wdt.txt          | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.txt
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.txt b/Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.txt
> new file mode 100644
> index 0000000..d83fc5c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.txt
> @@ -0,0 +1,22 @@
> +* Freescale i.MX7ULP Watchdog Timer (WDT) Controller
> +
> +Required properties:
> +- compatible : Should be "fsl,imx7ulp-wdt"
> +- reg : Should contain WDT registers location and length
> +- interrupts : Should contain WDT interrupt
> +- clocks: Should contain a phandle pointing to the gated peripheral clock.
> +
> +Optional properties:
> +- timeout-sec : Contains the watchdog timeout in seconds
> +
> +Examples:
> +
> +wdog1: wdog@403d0000 {

watchdog@...

With that,

Reviewed-by: Rob Herring <rohb@kernel.org>

> +	compatible = "fsl,imx7ulp-wdt";
> +	reg = <0x403d0000 0x10000>;
> +	interrupts = <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
> +	clocks = <&pcc2 IMX7ULP_CLK_WDG1>;
> +	assigned-clocks = <&pcc2 IMX7ULP_CLK_WDG1>;
> +	assigned-clocks-parents = <&scg1 IMX7ULP_CLK_FIRC_BUS_CLK>;
> +	timeout-sec = <40>;
> +};
> -- 
> 2.7.4
> 
