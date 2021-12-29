Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03B54481162
	for <lists+linux-watchdog@lfdr.de>; Wed, 29 Dec 2021 10:45:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235344AbhL2JpI (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 29 Dec 2021 04:45:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235333AbhL2JpH (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 29 Dec 2021 04:45:07 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8329BC06173F
        for <linux-watchdog@vger.kernel.org>; Wed, 29 Dec 2021 01:45:07 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id j18so43352952wrd.2
        for <linux-watchdog@vger.kernel.org>; Wed, 29 Dec 2021 01:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=F5hLhwE+UU94IcLuo1agQhCW+8dMcyUFbhKonw1Ucwk=;
        b=zE5XYpxZ0bPeEWY7cgd6y5KzLBnlwEVy7Wv7OKMhNaVwYpaq5eYTiuINUZ3xh9vl+K
         4q1GUx0gpNAiYZefFb++psP0mhjHNmiSId7/CLf560k1XmbE6+fK8AbHMXKLqUC7orDU
         0/OIYZSEgOrdwU6kzMC3UZtLHsxWMtcwyLdJshSTCsocg5XIa6fPAqmqQVOxKf3mrgQO
         6+ZiqTKfVP7hrQEwxgi890r/suEruLCNRurYGu3g1jl1hCVsIEqbLf21IoLnD4kZWXJs
         aFqpiPr450RvK9cMPcLYvJK8XOaZQcs7ncbMIoCsXjmZW0ZfGqLTdyGA1jT7hv5MnIr9
         Cw8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=F5hLhwE+UU94IcLuo1agQhCW+8dMcyUFbhKonw1Ucwk=;
        b=48kQGMdCA4UPvd9jld2SfSQzjRIuJG+wUTPp24EGH8+X8le79ZRxmyXBD0gjYn2WnE
         3AEvc9rMX29Ux7gJgMqS4SIPEaT8mWaB+tdgfp7KQwWPOifdiHvMLJ6W2BgJFMmczEAQ
         /tjLOGmvzNH3q9TDGh144lDqTjmjrJA7+Owp+ImxspS/5QYneufrZGFNFkLQ/QzGUyH9
         Ea78eA1LOA6W4uznJH/VSLBHEOWCYa3Rsd84GusPv2XXvsLZEJjw6H8ldK0KPewAXUuD
         M88Ju3VuJHw8I+HC67SI2C+mcLISA5GH6VwOl7twyBETjOdgrVodvaD+MRp5wen4Pgzj
         RRBA==
X-Gm-Message-State: AOAM532DkI/U2T5G7iqnBLBY8iWIGhtx4z7pGfCdrMEYRO5q3ZWLYqos
        kB8yZHPGYVMll8Zfq7or0rrTGQ==
X-Google-Smtp-Source: ABdhPJzhZZghhYqWrqB+uDruMdOeh2UV7K4tAyZAPQXId5vBCn+1+woXAs3xtmU9d+Kjp/8JIz1J7g==
X-Received: by 2002:a05:6000:186a:: with SMTP id d10mr20195785wri.347.1640771106104;
        Wed, 29 Dec 2021 01:45:06 -0800 (PST)
Received: from google.com ([2.31.167.18])
        by smtp.gmail.com with ESMTPSA id e1sm21035556wrc.74.2021.12.29.01.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Dec 2021 01:45:05 -0800 (PST)
Date:   Wed, 29 Dec 2021 09:45:03 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Justin Chen <justinpopo6@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V4 RESEND 1/2] dt-bindings: watchdog: convert Broadcom's
 WDT to the json-schema
Message-ID: <YcwuH0GTWK4soAsu@google.com>
References: <Ya5ctkIU+jNzDfBc@google.com>
 <f4af4971-7047-80c9-69ae-e6587979ecd5@roeck-us.net>
 <e1fa1683-a0a6-8ee0-9da5-8e97dd9c820a@gmail.com>
 <432664af-5660-aaad-bf75-81e4d61cb078@roeck-us.net>
 <46a88b40-6d92-727c-7adc-5723921d08e3@gmail.com>
 <20211206195115.GC3759192@roeck-us.net>
 <Ya8xhUR5GbTxVE8w@google.com>
 <a86d5998-8d84-7afe-e34e-a632aa890683@roeck-us.net>
 <Ya+BX1X7/YqmfCU8@google.com>
 <20211228092140.GA26632@www.linux-watchdog.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211228092140.GA26632@www.linux-watchdog.org>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, 28 Dec 2021, Wim Van Sebroeck wrote:

> Hi Lee,
> 
> > On Tue, 07 Dec 2021, Guenter Roeck wrote:
> > 
> > > On 12/7/21 2:03 AM, Lee Jones wrote:
> > > [ ... ]
> > > > > It sounded to me like Lee wanted an immutable branch for that
> > > > 
> > > > Not exactly, I said:
> > > > 
> > > >    "> Suppose we should take patch #2 via [Watchdog] as well.
> > > > 
> > > >     If that happens, I would like a PR to an immutable branch."
> > > > 
> > > > The alternative is that I take the patch and provide an immutable
> > > > branch to you, which I am in a position to do.
> > > > 
> > > 
> > > I understand, only I am not in a position to take it since my tree
> > > isn't the official watchdog-next tree, and it doesn't show up in -next.
> > > If Wim takes it into the official watchdog-next tree or not would be
> > > completely up to him.
> > > 
> > > I personally don't care if the bindings check is clean in my inofficial
> > > tree, so maybe this is a non-issue.
> > 
> > That doesn't help, sadly.
> > 
> > I think the best course of action is for Wim to let me know when this
> > patch makes it into his tree.  I'll take the MFD one at the same time
> > and the two shall meet in -next.
> > 
> > Honestly, this is all such a faff.
> > 
> > Just to keep a script happy that 3 people care about.
> 
> It's going in today.

Also applied.

Thanks Wim.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
