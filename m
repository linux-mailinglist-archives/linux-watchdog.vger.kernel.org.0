Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74EF8A3C92
	for <lists+linux-watchdog@lfdr.de>; Fri, 30 Aug 2019 18:50:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728086AbfH3Qul (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 30 Aug 2019 12:50:41 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:36582 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727883AbfH3Qul (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 30 Aug 2019 12:50:41 -0400
Received: by mail-pf1-f194.google.com with SMTP id w2so4999316pfi.3;
        Fri, 30 Aug 2019 09:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=nqfT7eZ0CXpXVrfmG81oa7a8nZF6Zf13T/nqKKsF2O0=;
        b=MF9HamXAu6O6AeDyFP7lWY51cLBOJ4eQqFrA1lSaje1yy/pdsf6D/L0xVOHkdzasaj
         1CHEn9YW4h9sYmMdYiq05gloGwL9se4oMZFFu8Jlg90fkE37QXDVDGGFyl7XyslEIn5a
         K8gIFU1v4pBVBzNxE9fMy8x1oUG3317bGu0Y9s1NaYlc8ObEd7KLXkiJC8O2M5CwYdoc
         z/rBJNGDc7fHWpgnQpsBJfP/7/lcBulXY/pnSnBodFbZwD5qFeXF7pG0xN+kXj7Jan4H
         WIwkjKcO5j+oC4qZcM8d0f9XhyuSHry8sJ9S0Jzoi0kRNfpy9eFWvBmr3IKLQXiN7E3u
         M1bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=nqfT7eZ0CXpXVrfmG81oa7a8nZF6Zf13T/nqKKsF2O0=;
        b=BZ19SwHCOfQPb0YiPCUc7MEEr+bzKSLdvtuvgyZmtgn6F9B7EwVL+j4HpSOHwuKAlY
         ykZ05VpCMTq05UgtLS8Hr+KsvE7FbwB9vDLWWSu2qc4KTE4q5AYNkl6JbtQYhixURWEw
         2Vtj5kL/yQfFs8tVVxDdHPSSgAIbsTB5/8XmtgBxvGXcIBckm41a4M3MGJabbPcUHel9
         7BR0S43Zx+OBWdG4x2+5grO2+kpSwdN9F/CgKRDwkHomp0PrTpbDfCHcVjrPkEOPE/PI
         /F3is2y3GfjB2i0MC5ac8JiRwG35I7XIo7rB9hX+x9G1r5RqVQPJY/uBNGrAJI/L6j2T
         TtHw==
X-Gm-Message-State: APjAAAVy5/TQgAP4LiRMMIRXgRDzaG0/1Sli9IBVYc+qIvpWyzZek+63
        g3L3TLAVpnSYnWsXfo/MlIN9vlM/
X-Google-Smtp-Source: APXvYqwNDY3snOtA/jlKXRD/VBDeAWTcnjqNQA/GCd/SbuM3PPO9MCKET8gJON/LCe4Awj6GhOMQkg==
X-Received: by 2002:a63:d23:: with SMTP id c35mr13719466pgl.376.1567183840533;
        Fri, 30 Aug 2019 09:50:40 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w20sm9788175pfn.72.2019.08.30.09.50.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Aug 2019 09:50:40 -0700 (PDT)
Date:   Fri, 30 Aug 2019 09:50:39 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     wim@linux-watchdog.org, robh+dt@kernel.org, mark.rutland@arm.com,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux@armlinux.org.uk, otavio@ossystems.com.br,
        leonard.crestez@nxp.com, schnitzeltony@gmail.com,
        u.kleine-koenig@pengutronix.de, jan.tuerk@emtrion.com,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Linux-imx@nxp.com
Subject: Re: [PATCH V4 1/4] dt-bindings: watchdog: Add i.MX7ULP bindings
Message-ID: <20190830165039.GF7911@roeck-us.net>
References: <1566441463-11911-1-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1566441463-11911-1-git-send-email-Anson.Huang@nxp.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Aug 21, 2019 at 10:37:40PM -0400, Anson Huang wrote:
> Add the watchdog bindings for Freescale i.MX7ULP.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

With the change requested by Rob:

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

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
