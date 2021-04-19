Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B73EE363AD5
	for <lists+linux-watchdog@lfdr.de>; Mon, 19 Apr 2021 07:03:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230038AbhDSFDc (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 19 Apr 2021 01:03:32 -0400
Received: from gw.atmark-techno.com ([13.115.124.170]:56418 "EHLO
        gw.atmark-techno.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230111AbhDSFDb (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 19 Apr 2021 01:03:31 -0400
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
        by gw.atmark-techno.com (Postfix) with ESMTPS id 8E1C5804A3
        for <linux-watchdog@vger.kernel.org>; Mon, 19 Apr 2021 14:03:00 +0900 (JST)
Received: by mail-pl1-f199.google.com with SMTP id y6-20020a170902d646b02900e7147eee6eso13408237plh.13
        for <linux-watchdog@vger.kernel.org>; Sun, 18 Apr 2021 22:03:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bLr973ENjFZQNNz5/z+BmoCFuTDVovYaAYguOO0YOc4=;
        b=R6DBK8L5aztgz/lHhwABb7+qGAUJF/caMOnOG5n1tPSa6tSAFwimwC45NTGPp5C0VO
         ERpaYbwV91qNTveYaaL8cEZckaFKPyDZkgEuD1Bw+zKBR7Jt54xZ/DVTS41+lW2H720C
         SRq9sr+RFowkXqJK7joTIG3f4znKUed9akpVlN9Qal/MdJrRQBijKsg/4z7zEoPYnUPr
         sirfDIHWJZS9QQ0EJTp6y9Yu7XGlt5FvE8u+EeNZzn+yz+6HCVtk56gcGTy9QyH3QnsG
         HmxJVf6yDj85mIo/va9nGOuPLCokXWfPuae8ptTVAYd7w8LS6+TPoVkieFKuQuENFwrO
         M2pA==
X-Gm-Message-State: AOAM531iEuKSxv6bl1wooS1Gis2/XaBQczOIlknJAQpIgdaqZggo0dIk
        BA1Ob+nktM8buXraqRqBrjYcBgqIZY/Xo+2z00glCeGiv/dCgt1C5KidaaP5OS0zbCT8QkBuzY7
        wek+PuvrwgWLj7BpMLivHVD88//qe78A=
X-Received: by 2002:a17:902:d645:b029:e8:ec90:d097 with SMTP id y5-20020a170902d645b02900e8ec90d097mr21074838plh.47.1618808579512;
        Sun, 18 Apr 2021 22:02:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyI1MeNQhpXnytM5xmVsw3ZCkrTxMPyrxhKroAVtmGUaPe01xpWL31HOX4hl1pxmvtORo+KDQ==
X-Received: by 2002:a17:902:d645:b029:e8:ec90:d097 with SMTP id y5-20020a170902d645b02900e8ec90d097mr21074765plh.47.1618808579243;
        Sun, 18 Apr 2021 22:02:59 -0700 (PDT)
Received: from pc-0115 (103.131.189.35.bc.googleusercontent.com. [35.189.131.103])
        by smtp.gmail.com with ESMTPSA id ga21sm2553351pjb.5.2021.04.18.22.02.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 18 Apr 2021 22:02:58 -0700 (PDT)
Received: from martinet by pc-0115 with local (Exim 4.94)
        (envelope-from <martinet@pc-0115>)
        id 1lYM3l-0016Ra-6N; Mon, 19 Apr 2021 14:02:57 +0900
Date:   Mon, 19 Apr 2021 14:02:47 +0900
From:   Dominique MARTINET <dominique.martinet@atmark-techno.com>
To:     "Alice Guo (OSS)" <alice.guo@oss.nxp.com>
Cc:     gregkh@linuxfoundation.org, rafael@kernel.org,
        horia.geanta@nxp.com, aymen.sghaier@nxp.com,
        herbert@gondor.apana.org.au, davem@davemloft.net, tony@atomide.com,
        geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org,
        vkoul@kernel.org, peter.ujfalusi@gmail.com, a.hajda@samsung.com,
        narmstrong@baylibre.com, robert.foss@linaro.org, airlied@linux.ie,
        daniel@ffwll.ch, khilman@baylibre.com, tomba@kernel.org,
        jyri.sarha@iki.fi, joro@8bytes.org, will@kernel.org,
        mchehab@kernel.org, ulf.hansson@linaro.org,
        adrian.hunter@intel.com, kishon@ti.com, kuba@kernel.org,
        linus.walleij@linaro.org, Roy.Pledge@nxp.com, leoyang.li@nxp.com,
        ssantosh@kernel.org, matthias.bgg@gmail.com, edubezval@gmail.com,
        j-keerthy@ti.com, balbi@kernel.org, linux@prisktech.co.nz,
        stern@rowland.harvard.edu, wim@linux-watchdog.org,
        linux@roeck-us.net, linux-kernel@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org, linux-media@vger.kernel.org,
        linux-mmc@vger.kernel.org, netdev@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-staging@lists.linux.dev,
        linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [RFC v1 PATCH 3/3] driver: update all the code that use
 soc_device_match
Message-ID: <YH0O907dfGY9jQRZ@atmark-techno.com>
References: <20210419042722.27554-1-alice.guo@oss.nxp.com>
 <20210419042722.27554-4-alice.guo@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210419042722.27554-4-alice.guo@oss.nxp.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Alice Guo (OSS) wrote on Mon, Apr 19, 2021 at 12:27:22PM +0800:
> From: Alice Guo <alice.guo@nxp.com>
> 
> Update all the code that use soc_device_match

A single patch might be difficult to accept for all components, a each
maintainer will probably want to have a say on their subsystem?

I would suggest to split these for a non-RFC version; a this will really
need to be case-by-case handling.

> because add support for soc_device_match returning -EPROBE_DEFER.

(English does not parse here for me)

I've only commented a couple of places in the code itself, but this
doesn't seem to add much support for errors, just sweep the problem
under the rug.

> Signed-off-by: Alice Guo <alice.guo@nxp.com>
> ---
> 
> diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
> index 5fae60f8c135..00c59aa217c1 100644
> --- a/drivers/bus/ti-sysc.c
> +++ b/drivers/bus/ti-sysc.c
> @@ -2909,7 +2909,7 @@ static int sysc_init_soc(struct sysc *ddata)
>  	}
>  
>  	match = soc_device_match(sysc_soc_feat_match);
> -	if (!match)
> +	if (!match || IS_ERR(match))
>  		return 0;

This function handles errors, I would recommend returning the error as
is if soc_device_match returned one so the probe can be retried later.

>  
>  	if (match->data)
> diff --git a/drivers/clk/renesas/r8a7795-cpg-mssr.c b/drivers/clk/renesas/r8a7795-cpg-mssr.c
> index c32d2c678046..90a18336a4c3 100644
> --- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
> @@ -439,6 +439,7 @@ static const unsigned int r8a7795es2_mod_nullify[] __initconst = {
>  
>  static int __init r8a7795_cpg_mssr_init(struct device *dev)
>  {
> +	const struct soc_device_attribute *match;
>  	const struct rcar_gen3_cpg_pll_config *cpg_pll_config;
>  	u32 cpg_mode;
>  	int error;
> @@ -453,7 +454,8 @@ static int __init r8a7795_cpg_mssr_init(struct device *dev)
>  		return -EINVAL;
>  	}
>  
> -	if (soc_device_match(r8a7795es1)) {
> +	match = soc_device_match(r8a7795es1);
> +	if (!IS_ERR(match) && match) {

Same, return the error.
Assuming an error means no match will just lead to hard to debug
problems because the driver potentially assumed the wrong device when
it's just not ready yet.

>  		cpg_core_nullify_range(r8a7795_core_clks,
>  				       ARRAY_SIZE(r8a7795_core_clks),
>  				       R8A7795_CLK_S0D2, R8A7795_CLK_S0D12);
> [...]
> diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
> index eaaec0a55cc6..13a06b613379 100644
> --- a/drivers/iommu/ipmmu-vmsa.c
> +++ b/drivers/iommu/ipmmu-vmsa.c
> @@ -757,17 +757,20 @@ static const char * const devices_allowlist[] = {
>  
>  static bool ipmmu_device_is_allowed(struct device *dev)
>  {
> +	const struct soc_device_attribute *match1, *match2;
>  	unsigned int i;
>  
>  	/*
>  	 * R-Car Gen3 and RZ/G2 use the allow list to opt-in devices.
>  	 * For Other SoCs, this returns true anyway.
>  	 */
> -	if (!soc_device_match(soc_needs_opt_in))
> +	match1 = soc_device_match(soc_needs_opt_in);
> +	if (!IS_ERR(match1) && !match1)

I'm not sure what you intended to do, but !match1 already means there is
no error so the original code is identical.

In this case ipmmu_device_is_allowed does not allow errors so this is
one of the "difficult" drivers that require slightly more thinking.
It is only called in ipmmu_of_xlate which does return errors properly,
so in this case the most straightforward approach would be to make
ipmmu_device_is_allowed return an int and forward errors as well.



...
This is going to need quite some more work to be acceptable, in my
opinion, but I think it should be possible.

Thanks,
-- 
Dominique
