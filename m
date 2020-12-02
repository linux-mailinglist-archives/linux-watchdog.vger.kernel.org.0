Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 593D72CBD94
	for <lists+linux-watchdog@lfdr.de>; Wed,  2 Dec 2020 13:58:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727531AbgLBM6O (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 2 Dec 2020 07:58:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727513AbgLBM6N (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 2 Dec 2020 07:58:13 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DD3EC0613D4
        for <linux-watchdog@vger.kernel.org>; Wed,  2 Dec 2020 04:57:27 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id g14so3775444wrm.13
        for <linux-watchdog@vger.kernel.org>; Wed, 02 Dec 2020 04:57:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=fUNJABfkVHPy4crD1mIRk8atZYm1MSll5dowagyi0KE=;
        b=hR2a848MDCPa9lyCpzVgBc+9u0Sm1pugkHDQqndvUGWf+oTLodfFuOZdPSf8IggsF+
         rzmZPtqlTW8EOGOHUkD2mAIaAlqyjTrRLC3J3S/sAU4l90WS+YYLq6jXwavM0x2hOawQ
         LTCWcc1Ufol7AEZ5G0GTjQ7MIeGVIyCdEM/CMmQtpNTXwBajnChkKomG9TcT5B+JZ/uD
         h6EC2C4LjT6cS7XZc0+UsZhNKTiw4JmachYSforKYLzDKoBM9m1QDRkYkQF2Julf2rXe
         xHe9DGNFBkfZ5q/iMkN2Yr4v2Af5BarJg3mMaoZDQohXIfYHSnGsmAi6fZkQJ7gXkkLv
         Bwbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=fUNJABfkVHPy4crD1mIRk8atZYm1MSll5dowagyi0KE=;
        b=rs3MkkjulIn0l1XALYMdFOOx8BSDlkmyi5Mot5hL/RmMN1FXEl9dEZfMZDKPs/1Ht9
         MeKXJFsycLF08QHzQnV4CEXxxsU6Ks5enZBq8UlMsJjylHJ+62H2BMDBjvqkhaESiGkU
         EwR8ZFxbgcj8zN2olTxJ7zEyTM/6rVQ5DwQTDyFtxi1icE5MhfYzjojEh+MF0tgM/+07
         JeMEf+Dh+kZJAqlB4yuT03XG5E92vt1/gKNf3uMcjzyBMVfI8gR+eABN/nqD92mwOUj3
         PaG6h50sef6trWBxmwhwDy32iXH2wDfQvEcVY7U/VfUdFDC1P3Kfmb36/n+1eOJ+Lwkm
         k8Zg==
X-Gm-Message-State: AOAM530xVVF+R1Nzj6C8N+rv6kucTpl6WqhGxFzvn+wT7HdX0gWQMWY2
        J24dMz5Rd9YdAaV95H4JtrDyVQ==
X-Google-Smtp-Source: ABdhPJyTDOl+qd8DppZaifDoh+DnC5wCZyO8mgHKqBIIwlAIfMxOYS67jtCelXQ+yyfF9HqvHrHZMw==
X-Received: by 2002:adf:cf0b:: with SMTP id o11mr3418263wrj.162.1606913845628;
        Wed, 02 Dec 2020 04:57:25 -0800 (PST)
Received: from dell ([91.110.221.235])
        by smtp.gmail.com with ESMTPSA id b18sm2161476wrt.54.2020.12.02.04.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Dec 2020 04:57:24 -0800 (PST)
Date:   Wed, 2 Dec 2020 12:57:23 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Cc:     "linux@roeck-us.net" <linux@roeck-us.net>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        linux-power <linux-power@fi.rohmeurope.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
Subject: Re: [PATCH RESEND v6 2/4] mfd: Support ROHM BD9576MUF and BD9573MUF
Message-ID: <20201202125723.GK4801@dell>
References: <cover.1605882179.git.matti.vaittinen@fi.rohmeurope.com>
 <cc46e329efa30c66f000ab7c97f9bbf0bc31f0f7.1605882179.git.matti.vaittinen@fi.rohmeurope.com>
 <20201127083242.GK2455276@dell>
 <6bd4abcb340bdf764fd23b685684d3f984319ed7.camel@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6bd4abcb340bdf764fd23b685684d3f984319ed7.camel@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, 27 Nov 2020, Vaittinen, Matti wrote:

> Hello Lee,
> 
> On Fri, 2020-11-27 at 08:32 +0000, Lee Jones wrote:
> > On Mon, 23 Nov 2020, Matti Vaittinen wrote:
> > 
> > > Add core support for ROHM BD9576MUF and BD9573MUF PMICs which are
> > > mainly used to power the R-Car series processors.
> > > 
> > > Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> > > ---
> > >  drivers/mfd/Kconfig              |  11 ++++
> > >  drivers/mfd/Makefile             |   1 +
> > >  drivers/mfd/rohm-bd9576.c        | 108
> > > +++++++++++++++++++++++++++++++
> > >  include/linux/mfd/rohm-bd957x.h  |  59 +++++++++++++++++
> > >  include/linux/mfd/rohm-generic.h |   2 +
> > >  5 files changed, 181 insertions(+)
> > >  create mode 100644 drivers/mfd/rohm-bd9576.c
> > >  create mode 100644 include/linux/mfd/rohm-bd957x.h
> > 
> > Looks like a possible candidate for "simple-mfd-i2c".
> > 
> > Could you look into that please?
> > 
> I must admit I didn't know about "simple-mfd-i2c". Good thing to know
> when working with simple devices :) Is this a new thing?

Yes, it's new.

> I am unsure I understand the idea fully. Should users put all the
> different regamp configs in this file and just add the device IDs with
> pointer to correct config? (BD9576 and BD9573 need volatile ranges).
> Also, does this mean each sub-device should have own node and own
> compatible in DT to get correctly load and probed? I guess this would
> need a buy-in from Rob too then.

You should describe the H/W in DT.

> By the way - for uneducated eyes like mine this does not look like it
> has much to do with MFD as a device - here MFD reminds me of a simple-
> bus on top of I2C.

This is for MFD devices where the parent does little more than create
a shared address space for child devices to operate on - like yours.

> Anyways, the BD9576 and BD9573 both have a few interrupts for OVD/UVD
> conditions and I am expecting that I will be asked to provide the
> regulator notifiers for those. Reason why I omitted the IRQs for now is
> that the HW is designed to keep the IRQ asserted for whole error
> duration so some delayed ack mechanism would be needed. I would like to
> keep the door open for adding IRQs to MFD core.

You mean to add an IRQ Domain?

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
