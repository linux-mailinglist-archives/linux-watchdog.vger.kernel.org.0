Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1F96A3C99
	for <lists+linux-watchdog@lfdr.de>; Fri, 30 Aug 2019 18:51:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727979AbfH3Qvg (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 30 Aug 2019 12:51:36 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:40641 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727883AbfH3Qvg (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 30 Aug 2019 12:51:36 -0400
Received: by mail-pg1-f196.google.com with SMTP id w10so3821894pgj.7;
        Fri, 30 Aug 2019 09:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=5UvLflpx3EFUk8awi6+Qwa1WTYo8pN5eMoyD4pclgbg=;
        b=N8EPn+vzOA+GhoEEs5XiLil81WPdHoR6+pX9z/KFtoYZR4fJeaPy0QBXjVjhdMtEyo
         T+RjsDLMHBtjdmy51QZpEbvs6Ipn0F0G77vytFQ3qC/poan6IW2Zylf3Qk/fAoBJ9aVV
         5v6qHxktKW2/4lcSvNgHYp+4/NcrsPttgQrr/X+7JjSKjk2qqpl4IKPhWxe2wJt0Dheu
         gwi50GDZJHDuoNQQOgI1G7T31N3eqtoNBADvaLcFdaaGH1QJujok7wWVhNPXeiaBbI/D
         yIVS0LwuQc60MvCtTSjedFncywoPSvFDDSQ1m6XY/CIBPI8fRoWQaGO+YwCbSmC3OCLq
         5O1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=5UvLflpx3EFUk8awi6+Qwa1WTYo8pN5eMoyD4pclgbg=;
        b=pvQY6DgLNUaq/N6Mp6GBfubeVZmVTKNwft1/ur6vbUzMQ9XUORprI4LDd0hpJSeA7u
         Jv9rWi8Eef1O3E8SGKiOV14OCrzo2cYgEjCCMLNR0xIn3QuWs7yZPxD5rfCfT4AlqCig
         PM4bIC9SC4mosNKuBX36SPAJyKZZro0cVTwhOhX0FILTixEh4ZUTArX/UJSffjv5fS0S
         PfFZc8uX2FX2u863X/pnR3CC9KYC79uMB9mtWyXfvfNbWWIio3UrSn815JOzUcVK7wSW
         YqUe1SRCXsDbr1bksWMCOozZOEkkJrCt13los4I2lGV0QENfCzziHaFAUAJLCN2kQpzt
         11pA==
X-Gm-Message-State: APjAAAVgdL1HO4jKlJoSGfdA94krBhAvu3sEUCMczSzsq3tcZCmQNtEj
        K0plEyRlpWYyfqlJ43kbtwk=
X-Google-Smtp-Source: APXvYqzebjfyVF+OCeCIs9yCVw/y2P3l9c1XT+KftFbAz5C4IjOMQK1TgqXTqZNOTQpKxRFuNgXKiA==
X-Received: by 2002:aa7:96ee:: with SMTP id i14mr19347137pfq.217.1567183895693;
        Fri, 30 Aug 2019 09:51:35 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g14sm6946317pfo.41.2019.08.30.09.51.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Aug 2019 09:51:35 -0700 (PDT)
Date:   Fri, 30 Aug 2019 09:51:34 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     wim@linux-watchdog.org, robh+dt@kernel.org, mark.rutland@arm.com,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux@armlinux.org.uk, otavio@ossystems.com.br,
        leonard.crestez@nxp.com, u.kleine-koenig@pengutronix.de,
        schnitzeltony@gmail.com, jan.tuerk@emtrion.com,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Linux-imx@nxp.com
Subject: Re: [PATCH V5 1/4] dt-bindings: watchdog: Add i.MX7ULP bindings
Message-ID: <20190830165134.GG7911@roeck-us.net>
References: <1566999303-18795-1-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1566999303-18795-1-git-send-email-Anson.Huang@nxp.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Aug 28, 2019 at 09:35:00AM -0400, Anson Huang wrote:
> Add the watchdog bindings for Freescale i.MX7ULP.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> Reviewed-by: Rob Herring <rohb@kernel.org>

Missed this version. For the record:

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> Changes since V4:
> 	- improve watchdog node name.
> ---
>  .../bindings/watchdog/fsl-imx7ulp-wdt.txt          | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.txt
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.txt b/Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.txt
> new file mode 100644
> index 0000000..f902508
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
> +wdog1: watchdog@403d0000 {
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
