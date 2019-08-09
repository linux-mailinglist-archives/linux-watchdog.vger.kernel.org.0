Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B78388061
	for <lists+linux-watchdog@lfdr.de>; Fri,  9 Aug 2019 18:42:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406474AbfHIQms (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 9 Aug 2019 12:42:48 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:39192 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726157AbfHIQms (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 9 Aug 2019 12:42:48 -0400
Received: by mail-pf1-f195.google.com with SMTP id f17so42350345pfn.6;
        Fri, 09 Aug 2019 09:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=lQR64lsM2F4GHE16CB+rGeKc+DaWwGBd1G+dV7Mx9vQ=;
        b=KyVK5awF6Kfdm70TtcKte/vbR/UqeyC/LQEtp6sXplFv36hDRFUfnjY/dUtHRt4SGI
         /HoG6wzxkF3lILfFeMSfqggAhIRHHaenBEWEC1z1bGxyUknckb8djkEOc1tMURDE17g6
         ih9F4hpbuqn31LdRl49mXJZI6O7jT6uW/F8BVxQMioRqLROdfNpTtpk+r1FjfFvIvBud
         Yy4wxLPzgcfVx+S8Jk2dmdWAa72kPMmiQfVTZD+uvI8IVRjfzhj7lXesnncnSSCbJfA+
         PU75xc5L+I0WP1cI7q/nCIQyywurDQSTBknAbd2qd7VNxtCI7ggKxcmuh/r8FKa2wzfF
         1hJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=lQR64lsM2F4GHE16CB+rGeKc+DaWwGBd1G+dV7Mx9vQ=;
        b=Oy4cZHy+Vj0j6Mdb7NooYiOIq/Ww0DBmQSdKNHgzZs2lQzsMUDhnCHGeq882vj3IEO
         E3RO2h70PTyZmToc95yKMEh60KNBEv4jGGAcOeF67WqAhKZHQqubaFg9oDxK1LAMf2Fh
         eqtCuPG0HoI3TpsaEFBVUUfqF0kodUmLvH6heHYJTC90pOBsyzumpz02VsvkOXKYW/8p
         d5is5VVJAsQC1fZpD0YRcVhCB/3xBj32VCSVzz1ZNXqcRQLaxzH2iXMQsjWYs11T5F/H
         fNLMttGzl7J5XX5QH7olLVfvoUU5pONhTCdw/eady6J+WFPO66I5IL0A439hWzTTOW9h
         i79g==
X-Gm-Message-State: APjAAAVeAk8MVUhsKF9K9nvKrUTT0BVL7yK3gqGkhW6Xqy9VXf0me2gW
        unqcPDXgUyDlUS3NRXfI8oI=
X-Google-Smtp-Source: APXvYqzikkhASYL+yHYO3qlFUUkyWSKcPxDKgLjky1s0KPej6LcMb0qkFFsxJEXHw1pDKKiVJJ0u9w==
X-Received: by 2002:a65:448a:: with SMTP id l10mr17950446pgq.327.1565368967690;
        Fri, 09 Aug 2019 09:42:47 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f12sm82607856pgq.52.2019.08.09.09.42.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 09 Aug 2019 09:42:46 -0700 (PDT)
Date:   Fri, 9 Aug 2019 09:42:45 -0700
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
Subject: Re: [PATCH 1/4] dt-bindings: watchdog: Add i.MX7ULP bindings
Message-ID: <20190809164245.GA17136@roeck-us.net>
References: <1565334842-28161-1-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1565334842-28161-1-git-send-email-Anson.Huang@nxp.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Aug 09, 2019 at 03:13:59PM +0800, Anson Huang wrote:
> Add the watchdog bindings for Freescale i.MX7ULP.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
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

The driver as submitted does not include clock or interrupt handling.
Why are those properties listed as mandatory if they are not really
needed (nor used) ?

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
