Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F1224B5558
	for <lists+linux-watchdog@lfdr.de>; Mon, 14 Feb 2022 16:52:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346218AbiBNPwO (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 14 Feb 2022 10:52:14 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:43876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229718AbiBNPwN (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 14 Feb 2022 10:52:13 -0500
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E1C849261;
        Mon, 14 Feb 2022 07:52:06 -0800 (PST)
Received: by mail-oi1-x231.google.com with SMTP id i5so17852724oih.1;
        Mon, 14 Feb 2022 07:52:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=bjs/DRHhbJtcD694Lc3CcZWCJJoxgGl0YedjWhf+rY4=;
        b=qhAGg3lYSM6bqItJzoZt2Zstn6mYVXjsXyLzn8PPbKaM7yLz9MtX01/W5B0qbvSbqf
         MM4JDcjul0cFnQVqfd8g2e1BWfLVkxsQNnyhFELWzeKulHtjSesmA2yKGnRgY3T6syGg
         SfXk5WjRANrnodDnTtoaPTK9RaBa6XXYc65EnPAkXbl32z8q/+HcS0S8TT/d2tgTyLz8
         mGpBAAASrAKDib3gw5ey25TqpKlIPD2PKmpzPWRETcENs4UXXVQ5fToNV56RxmTHnIfb
         rcVKDp2nTSqHgQ6Kle2/tMgcT9tDMmCJg6LEa20BZK1LnqtNWHyTTn/KxpJ3lTLeTlL2
         h6Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=bjs/DRHhbJtcD694Lc3CcZWCJJoxgGl0YedjWhf+rY4=;
        b=2ix0PLJWvKZsjokX1g4knbQFUb18LotmC4hlCEWhNZLfM9rM6rllIs19DaptFutylQ
         oe/9dOEz0iSe4C63KdYD1mcE9EtgICEOHBJQ6iNm71Z5S7PQtQfB69TLLYA4Aicr/425
         4lKfsYdN9eBWEOYUgrAxJZj4CnQCIa++TPcyOXiO+xEecg3m+cQIQ5O44koQFvgri9oI
         +/5PXwWxBD6BSy282JU+BmeS1VftaVgbukrqPwrOAIWr1inTaHszrgFU6wVqVTpMJeei
         TXOlfMl7BHztAbXgxJQ43BbENbp8p9J1+bnjPhrRmGn2X6f385XyZRUaCdv1KJXV2dFJ
         Ze7g==
X-Gm-Message-State: AOAM533If+DMk//RWcz6wci0SeSfmGc2lrECCWLC+vN23mMAmJCPJEGi
        qiJO7zyy+KRmsa3ei08zGsg=
X-Google-Smtp-Source: ABdhPJxv0mCvpmC4WS/NiQ/O1XKg5rvWguZ5EHDY8sreXgHU1ABp+FIam1zT1OCPFvix8Wdh7grOZg==
X-Received: by 2002:aca:4bcf:: with SMTP id y198mr13082oia.144.1644853925563;
        Mon, 14 Feb 2022 07:52:05 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d65sm12354635otb.17.2022.02.14.07.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 07:52:05 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 14 Feb 2022 07:52:03 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        LUU HOAI <hoai.luu.ub@renesas.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 5/5] arm64: dts: renesas: spider-cpu: Enable watchdog
 timer
Message-ID: <20220214155203.GA121693@roeck-us.net>
References: <cover.1642525158.git.geert+renesas@glider.be>
 <b36b2bb5770e10d906571721a3d73ca205b6f56e.1642525158.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b36b2bb5770e10d906571721a3d73ca205b6f56e.1642525158.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Jan 18, 2022 at 06:09:05PM +0100, Geert Uytterhoeven wrote:
> Enable the watchdog timer on the Spider board.
> 
> Extracted from a larger patch in the BSP by LUU HOAI.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Acked-by: Guenter Roeck <linux@roeck-us.net>

> ---
> For the watchdog to be able to actually reboot the system, this depends
> on proper configuration of the Watchdog Timer Reset Control Register
> (WDTRSTCR) in the Reset (RST) module, either by Linux[1], or by the
> firmware.
> 
> [1] "[PATCH LOCAL v2] soc: renesas: rcar-rst: Allow WDT reset on R-Car
>      Gen4"
>     https://lore.kernel.org/r/39005cf749a99afc6d3ba96ff155fd2a231418a8.1642524743.git.geert+renesas@glider.be
> ---
>  arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi b/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi
> index 156586532c844c41..3a90932fe85c8243 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi
> @@ -31,6 +31,11 @@ &extalr_clk {
>  	clock-frequency = <32768>;
>  };
>  
> +&rwdt {
> +	timeout-sec = <60>;
> +	status = "okay";
> +};
> +
>  &scif3 {
>  	status = "okay";
>  };
