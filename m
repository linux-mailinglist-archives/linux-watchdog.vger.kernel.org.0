Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 906B322328E
	for <lists+linux-watchdog@lfdr.de>; Fri, 17 Jul 2020 06:44:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725936AbgGQEof (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 17 Jul 2020 00:44:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726333AbgGQEoe (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 17 Jul 2020 00:44:34 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F25C4C08C5DB
        for <linux-watchdog@vger.kernel.org>; Thu, 16 Jul 2020 21:44:33 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id l2so15309968wmf.0
        for <linux-watchdog@vger.kernel.org>; Thu, 16 Jul 2020 21:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=S9S68y6b2mPbKuzgaCo1jN4A32wueiis4gs7MPkym/M=;
        b=YBTRlAxQNCrp0VWtdAoz7HX1TcMxgP8c+pztXkm9DckROsrCs8s1wiHI5Ty0T6SgrK
         x1LT/2APXM2vMzv8oPhbWLw0GHTyp4WhkivO6gKr6Fyodd1U8eGi9prToTvyCdvhjwuu
         D/2FUpr4dbooLhpYGT4dm3UwB8hQ0iuvNDR5WtKOUPmAO1XOPM9iqBTmOIE3rIhpejZD
         UuV0PnY40TbCaLn4R1LYeLSHKHkJ1uEJRN1YQ2eDSc8zlbJWvqUCqi2RbB/AK2Bmot/z
         bai/MmFwyt17VnEi9eZU4lF9z9MMd+wSlLUM9q4lUfSN/7KO5Q5X5N7DH8omfftLoyew
         HClw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=S9S68y6b2mPbKuzgaCo1jN4A32wueiis4gs7MPkym/M=;
        b=k/wb5kD1qx46zWjXtMXMWpTcwxXRLNj7Ls2xnU4pH0/GAcTArDlt3rCdAT27KxUdXg
         N4DwwGXZxt1RJLf7VkNl3DR3oWaa0Ex5Qb+o3vGddN7YxriEsL9a4HvwtghVV+y3jJUe
         W6VZsndzzWx6R0iFzGH8UDJGHCLupPFRtLNjkZFtRYvtUK0zpdAObWqNDuqGXx+io5Q4
         xvgZbMOAmbzzhQK265iueKvHTzNG5ZqpjlQoUrJ0Qy9YiBUo0CYUTLZ4rZkQ9Mex9Mn+
         82iOuYalXcXnW4iz26cMK3gTjCVmwPIkCVXqu/NkX5xb1FuZB2AfbsAEY5osbx9fH8N0
         5/8A==
X-Gm-Message-State: AOAM533iWaDLl8vg5NDWvrndJRnLljignNMCj9bf2E9gu/OiFpv6x4aN
        JTVBj58McPzkNGPFFm2/IehRjg==
X-Google-Smtp-Source: ABdhPJyEBG67fJXokeAElVWPCoMwiGiAI/9HSCWG+w7OI40KZczqAmqnOUUNQcrS+TOsyYDFflbNaQ==
X-Received: by 2002:a7b:ce83:: with SMTP id q3mr7184668wmj.5.1594961072462;
        Thu, 16 Jul 2020 21:44:32 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:9880:a643:3e69:6393? ([2a01:e34:ed2f:f020:9880:a643:3e69:6393])
        by smtp.googlemail.com with ESMTPSA id o21sm11356388wmh.18.2020.07.16.21.44.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2020 21:44:31 -0700 (PDT)
Subject: Re: [PATCH 03/20] thermal: rcar_gen3_thermal: Add r8a774e1 support
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Rob Herring <robh+dt@kernel.org>,
        Wolfgang Grandegger <wg@grandegger.com>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Niklas <niklas.soderlund@ragnatech.se>,
        Zhang Rui <rui.zhang@intel.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     Amit Kucheria <amit.kucheria@verdurent.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-can@vger.kernel.org,
        netdev@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-watchdog@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>
References: <1594811350-14066-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594811350-14066-4-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <bcda3aae-a276-173f-71e2-381736481ab2@linaro.org>
Date:   Fri, 17 Jul 2020 06:44:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1594811350-14066-4-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 15/07/2020 13:08, Lad Prabhakar wrote:
> From: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> 
> Add r8a774e1 specific compatible string.
> 
> Signed-off-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com> ---

Applied, thanks



-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
