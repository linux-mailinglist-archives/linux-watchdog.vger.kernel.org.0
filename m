Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DFE94691B2
	for <lists+linux-watchdog@lfdr.de>; Mon,  6 Dec 2021 09:44:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239590AbhLFIr6 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 6 Dec 2021 03:47:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236377AbhLFIr4 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 6 Dec 2021 03:47:56 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45B6DC0613F8
        for <linux-watchdog@vger.kernel.org>; Mon,  6 Dec 2021 00:44:28 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id l16so20771116wrp.11
        for <linux-watchdog@vger.kernel.org>; Mon, 06 Dec 2021 00:44:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=c71WbK2hWipjWDhnoEstjaZn6DeXwY8N97KpaOA+PN8=;
        b=ciTIHiE1pZGCwWvFT+xHOFeN/6SXNBUuEIOnvM1gF9eOgSFghMrj6Zf6DUraxNpQYg
         /IUJGi7EiuDbtzZNPSldYNhPoGZ6egcVtXFIhHJj05eqEltOPverfJ3irExAHdZ3OHjv
         boXLhZZze6HPlNMCJoKmViO/Ns9jpNftAeLCCQZi1gYLBW3tlj6BCPgRKOaxGVCIfzUH
         SCqDAaqWqcKcTqx1FHqbPalE2jWYHkH4FGMsjUay8ACiSpRttM+Kk8OV0veGnRCa0BH6
         7vnHCyofuB1vrPcZGD8xePjckuyuXMSVekuYteywPVjHn9Aq8SerY5nZK5pkkoHh+7Zs
         rZKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=c71WbK2hWipjWDhnoEstjaZn6DeXwY8N97KpaOA+PN8=;
        b=ZGgthiKURUGW7BrzswLWJyD7C5fb5VIs+s0VcaqAmR/56zN9+EtzcAn25eBxguAf8C
         RcU0zrgxTtCHdkI6ZUgbX4BDn7q/AE6np61zw+Jl1FeYfAO5IW2SQojvX4MussW9vBSR
         IWU0J2jCVSOprXwuXO1maLrT1Rn8qaVXbWrvpue8kcdLFnlQ+N1n7cj1Q6pJjFCnVr9s
         jC1QIHosWFG7IIqQY7tKnYpDUx4maqHz30YgKPtfqsandswvy1vXZZWl5jVH31Gw9mGK
         SrSmVnp6/Uo95AA+a7LEKhM7y/JmZ1Ufk4sIHpcBCu6Mt0svCpkR5Z3Of/G8LCelFaQb
         Rnjw==
X-Gm-Message-State: AOAM530DI/jXlgMUq+rT76mJvU44Yv5ZDG6Ys17X5BT5RwTHAAqlhgQF
        d/UovilLETJjP7QMGVPIL1aBzg==
X-Google-Smtp-Source: ABdhPJyVE/CBg2F0sAj/Kdj4ixBjfohQLT0uodADbk46M95pL7rkpEChYS3q8alJ6mc/P2HuMr1KrA==
X-Received: by 2002:a5d:618f:: with SMTP id j15mr41190354wru.506.1638780266880;
        Mon, 06 Dec 2021 00:44:26 -0800 (PST)
Received: from google.com ([2.31.167.18])
        by smtp.gmail.com with ESMTPSA id m20sm13985538wmq.11.2021.12.06.00.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 00:44:26 -0800 (PST)
Date:   Mon, 6 Dec 2021 08:44:25 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Justin Chen <justinpopo6@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V4 RESEND 1/2] dt-bindings: watchdog: convert Broadcom's
 WDT to the json-schema
Message-ID: <Ya3NaVKf1NRc8rrx@google.com>
References: <20211115055354.6089-1-zajec5@gmail.com>
 <78eba629-b0cf-e1db-df73-2b33fb0b4929@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <78eba629-b0cf-e1db-df73-2b33fb0b4929@gmail.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, 06 Dec 2021, Rafał Miłecki wrote:

> Wim, Lee,
> 
> On 15.11.2021 06:53, Rafał Miłecki wrote:
> > From: Rafał Miłecki <rafal@milecki.pl>
> > 
> > This helps validating DTS files.
> > 
> > Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> > Acked-by: Florian Fainelli <f.fainelli@gmail.com>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> 
> I'm not familiar with handling multi-subsystem patchsets (here: watchdog
> & MFD).
> 
> Please kindly let me know: how to proceed with this patchset now to get
> it queued for Linus?

What is the requirement for these to be merged together?

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
