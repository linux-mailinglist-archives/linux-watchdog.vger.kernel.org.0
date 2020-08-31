Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BDF125734C
	for <lists+linux-watchdog@lfdr.de>; Mon, 31 Aug 2020 07:28:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726518AbgHaF2f (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 31 Aug 2020 01:28:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725810AbgHaF2b (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 31 Aug 2020 01:28:31 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 645B3C061575
        for <linux-watchdog@vger.kernel.org>; Sun, 30 Aug 2020 22:28:30 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id np15so800352pjb.0
        for <linux-watchdog@vger.kernel.org>; Sun, 30 Aug 2020 22:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=tLWtD+wuuRp1aiLM/sqC5p8ibdIf7AwldZEs7jvXZcs=;
        b=TlUIzJjHY6Dpk8b4Z6uQnnJJ9OyqXy/dw2h3ICbORzJRb6N1o+WsM1rStNZ54u47uB
         a+QAu1F7BzxZGEVH2WIhwQrxRHmUATMtNmNwKv7cL2lsS7s3nPXoSFRknkoEwgZ4m4nO
         y4qORtJKEjyP+DDhw0ewws1uOZbaGo8s0GVzk7rO3hq6rsmO3tJ/1m6a/VoB3Ikn2Iqu
         G46scuvw/Sj1FNZwUN0fQZsJlm8kZnaND9Njja/9bP8NirCe2PWAxmOVbr/DWv2+8MuT
         inlrSUnmwiBgYL3n+GEWM8MO0IDU/pAvU+EtbNv0vtm7edZuO9u1N0/zgWx0QzYTHUFZ
         D4Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=tLWtD+wuuRp1aiLM/sqC5p8ibdIf7AwldZEs7jvXZcs=;
        b=n13ocGhou9Lh4Nu64rupF4oKcDu8v6BkO/nHHjgtYeYROnDB3u8nctG0SGED55gAHU
         HOmAAnlu5ttz+i008SeMzfwE0XkQz8RKDLWPXgwaEi5w5D6uu3dEvDLci1ehqej/OsnD
         KNpFxP6hsUrDLDh9OX8220XYwmIPh6gAd31YyadTCgjNrvw2pUGwP9J/Ua1iJe+Com5r
         yImt7n9/kl1GD1Ger19UozgE1wqMNRg3MVfVrVuyvTPBCEaORLVPjK7yJQAlqBFjc/pu
         D0iZjq4jgGiuE2dByL2S60XpF9LCXRTRo/1yPTpmb4bYtfoUK6DN/LwF/plXlrqPHOfD
         /2jA==
X-Gm-Message-State: AOAM533ROJ+ive67V4MjryKADc5toAs9/qaZhM/pmghvjyruAV763edP
        1rQVVMlPtoaUn9NYM8mTek9Krg==
X-Google-Smtp-Source: ABdhPJz9JcfzTlWfMFwenjNQr2tWTTmECGqopiTNS9/UzC5fEVmndWK+6vQb2WWep2RtbJ6/401k/w==
X-Received: by 2002:a17:90a:2d82:: with SMTP id p2mr97869pjd.166.1598851709756;
        Sun, 30 Aug 2020 22:28:29 -0700 (PDT)
Received: from localhost ([122.167.135.199])
        by smtp.gmail.com with ESMTPSA id n67sm2075913pgn.14.2020.08.30.22.28.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 30 Aug 2020 22:28:28 -0700 (PDT)
Date:   Mon, 31 Aug 2020 10:58:17 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Andre Przywara <andre.przywara@arm.com>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Viresh Kumar <vireshk@kernel.org>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chanho Min <chanho.min@lge.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Li Yang <leoyang.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Sudeep Holla <sudeep.holla@arm.com>,
        Wei Xu <xuwei5@hisilicon.com>
Subject: Re: [PATCH 01/10] dt-bindings: watchdog: sp-805: Convert to
 Json-schema
Message-ID: <20200831052817.azrovfs2khm4yitj@vireshk-i7>
References: <20200828130602.42203-1-andre.przywara@arm.com>
 <20200828130602.42203-2-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200828130602.42203-2-andre.przywara@arm.com>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 28-08-20, 14:05, Andre Przywara wrote:
> Convert the ARM SP-805 watchdog IP DT binding over to Json-schema.
> 
> A straight-forward conversion, but the requirement for providing two
> clocks got strengthened from "should" to "must".
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  .../bindings/watchdog/arm,sp805.txt           | 32 --------
>  .../bindings/watchdog/arm,sp805.yaml          | 75 +++++++++++++++++++
>  2 files changed, 75 insertions(+), 32 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/watchdog/arm,sp805.txt
>  create mode 100644 Documentation/devicetree/bindings/watchdog/arm,sp805.yaml

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
