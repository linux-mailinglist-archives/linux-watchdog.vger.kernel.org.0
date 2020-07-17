Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDA4E223C5E
	for <lists+linux-watchdog@lfdr.de>; Fri, 17 Jul 2020 15:24:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726649AbgGQNXR (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 17 Jul 2020 09:23:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726546AbgGQNXQ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 17 Jul 2020 09:23:16 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D0DDC061755
        for <linux-watchdog@vger.kernel.org>; Fri, 17 Jul 2020 06:23:16 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id e4so12617697ljn.4
        for <linux-watchdog@vger.kernel.org>; Fri, 17 Jul 2020 06:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=r5HS07ICf7E3a3QJxXXjTIF72wcfgMRIm+vhJsEtkcw=;
        b=G/PDUzaIqdp1Gjj31VxhrrYLJsacpjKxAAeitpvz2KCk8yGUDLzVXlJ3q8zbAFP57j
         r9tjyIvZkl67/BTM0oesxWME9XtuWS+46jAX+1t27JSS56lOyCbBDij7xZXHOa0dVyuh
         7FiV92akZrkKRS6MZXvmgsB0stALd/vxBZU13pULuaIUK+0sVBzOXorHxtl227Nbmq6v
         1uiigkmHl8tttEMfHoQVrbPXVQprxr/JmOjBIyTwAbPoVSPNRu9dqL2MOJAWM0bUcge0
         RXWVCIoq2wClrs/UG/zsTqBNKGO7IieNNdBfsIyJSyiMRaT3pkmAj24448EPmt1d+j9I
         m6tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=r5HS07ICf7E3a3QJxXXjTIF72wcfgMRIm+vhJsEtkcw=;
        b=SpXVfiMMyHYofzvlnyOHcwkn3Pkxq27ScLneVv9VR3A2UZc1VOnpT4m868M+XtF5cO
         NzrIbAK7mSwoP/LeXgyymlgSWvJOp4mVJVR9Wr3f/PEM/JYefkMR6eml1UP1o4pkPqwL
         NC9bBoDhWdWyA057cycdTAsDOF6BcnbswHH7+dKkVNb2UiLMEJbS7ywjbYxWQGkf2C07
         775ZIiqNZ2lztwSqySPrNKoXu73t4A2jdGiBzgPhVa1uWOflWWG14g5dCC10TSjSuTjD
         2Y5iSFQ6l3wc5bb1YTifgjszwOi6BtWClbMvQ8s1E0pp/JPtFXZaSDFnL73nNxgi3pdY
         PdDw==
X-Gm-Message-State: AOAM53029ci+3wfQmW5CRfrpEUDhV5uwF+v2oVzlDokI909a0G7Gw69k
        cy2dI/T6PqUxSkCHnHfjK0rJVQ==
X-Google-Smtp-Source: ABdhPJzUBTptxuJTLZ8lzud6Q9kGgaD4DEmyeJiAqkYBb3btArneE3fHcpaQCMg8v1lLUysLkIvUDg==
X-Received: by 2002:a2e:1441:: with SMTP id 1mr4364600lju.93.1594992194884;
        Fri, 17 Jul 2020 06:23:14 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id w5sm1648620lji.49.2020.07.17.06.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 06:23:14 -0700 (PDT)
Date:   Fri, 17 Jul 2020 15:23:13 +0200
From:   Niklas <niklas.soderlund@ragnatech.se>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Rob Herring <robh+dt@kernel.org>,
        Wolfgang Grandegger <wg@grandegger.com>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Magnus Damm <magnus.damm@gmail.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-can@vger.kernel.org,
        netdev@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-watchdog@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH 03/20] thermal: rcar_gen3_thermal: Add r8a774e1 support
Message-ID: <20200717132313.GB177462@oden.dyn.berto.se>
References: <1594811350-14066-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594811350-14066-4-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1594811350-14066-4-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Lad,

Thanks for your work.

On 2020-07-15 12:08:53 +0100, Lad Prabhakar wrote:
> From: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> 
> Add r8a774e1 specific compatible string.
> 
> Signed-off-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/thermal/rcar_gen3_thermal.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/thermal/rcar_gen3_thermal.c b/drivers/thermal/rcar_gen3_thermal.c
> index c48c5e9b8f20..3f129ce4adc0 100644
> --- a/drivers/thermal/rcar_gen3_thermal.c
> +++ b/drivers/thermal/rcar_gen3_thermal.c
> @@ -314,6 +314,10 @@ static const struct of_device_id rcar_gen3_thermal_dt_ids[] = {
>  		.compatible = "renesas,r8a774b1-thermal",
>  		.data = &rcar_gen3_ths_tj_1,
>  	},
> +	{
> +		.compatible = "renesas,r8a774e1-thermal",
> +		.data = &rcar_gen3_ths_tj_1,
> +	},
>  	{
>  		.compatible = "renesas,r8a7795-thermal",
>  		.data = &rcar_gen3_ths_tj_1,
> -- 
> 2.17.1
> 

-- 
Regards,
Niklas Söderlund
