Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 497652AF559
	for <lists+linux-watchdog@lfdr.de>; Wed, 11 Nov 2020 16:47:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726830AbgKKPrM (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 11 Nov 2020 10:47:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726274AbgKKPrL (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 11 Nov 2020 10:47:11 -0500
Received: from mail-oo1-xc42.google.com (mail-oo1-xc42.google.com [IPv6:2607:f8b0:4864:20::c42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52E12C0613D1;
        Wed, 11 Nov 2020 07:47:11 -0800 (PST)
Received: by mail-oo1-xc42.google.com with SMTP id g4so534187oom.9;
        Wed, 11 Nov 2020 07:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ai2w0Vvb3+GWtypmuXQ+UOVqSkheh81Q8SRV/4YN/gc=;
        b=G45syko75rJBOdVLt5QXR0I702QZ+XuyD0TX5nRgoNH0daBlvqu+xD8JZ06zYWgm4a
         6vzDpw8Ui4Fuzkl1K1YQzYLvStHsumgldWp3BGRLakeqVxhhUgDgk2BGH9sPqLqEEa7K
         t4NGnew21VFzZ/5QkuAnswZ0TB5LRRX0kp19cKz+u+ihodhFEvE8i05JxkvhLnPhVaLf
         dfNtPqCtC5wMaflHVZpxI/sgpxW7UopPunuhKI+xqJqy7vRjMO0hbmCxdvjPCb9sbfY6
         IcECOv/Nq/7iXkyEqt8ZP0mY6SmSVhZBGyaVZ25L5qoH2ZsoEpDtfXqwxBEwijHIS5MW
         jVlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=ai2w0Vvb3+GWtypmuXQ+UOVqSkheh81Q8SRV/4YN/gc=;
        b=PoosjCWyDVyYey23blPmUYe+sb9dYbwBetBzJNEcHCP04dta6cPWbFTfkVDhKcS80Y
         Eu4HnFBl1hub5AvWRKKh8I/GU2or7x8elVlJ54XV09ri+ReXuWqoVlmYyQ2voDmAZ3xS
         8lkG1yZx54mtyv2UqPNkTl9vWcQybXnoAUKvtEbVFbI1/0lhyjWPm1cRbgf1ZaXhsKif
         EHBwWoXbn6AvGt6mmpY6rUZ18lgc29YdgfTZMCjWzhoxl4fvxef2AIMkx6iL71zZUoIz
         CuvhadASj5nd39sxwh1LE/ULYZeszu1i0VniSSoLwi3gu2Ti884A8wgKWRe8PpQF0QR3
         2Mrw==
X-Gm-Message-State: AOAM532+HgRql5vD032Oo+fuN5TN+uDwxWtpoO0x/FT0o3L3meGCbh7c
        Pc3h+uxZW0jJRKcKz8MJz8I=
X-Google-Smtp-Source: ABdhPJwOwyqIu/9ZXtkU1qi7bZOeosRXEuSTE3WErLDOMm24tma3+cTem5o8AQR/mMDgSZxukXkb0Q==
X-Received: by 2002:a4a:1e43:: with SMTP id 64mr17474234ooq.57.1605109630796;
        Wed, 11 Nov 2020 07:47:10 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z7sm471501oib.57.2020.11.11.07.47.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Nov 2020 07:47:10 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 11 Nov 2020 07:47:09 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Cc:     "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        linux-power <linux-power@fi.rohmeurope.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>
Subject: Re: [PATCH v5 3/4] wdt: Support wdt on ROHM BD9576MUF and BD9573MUF
Message-ID: <20201111154709.GB151426@roeck-us.net>
References: <cover.1604574431.git.matti.vaittinen@fi.rohmeurope.com>
 <1a454defaf65ecc22deb0fe42a1384a5f9d5a771.1604574431.git.matti.vaittinen@fi.rohmeurope.com>
 <7d912f9a9c1aa2be3d73287401fd2088a63b899c.camel@fi.rohmeurope.com>
 <2f455295-9c48-c9a7-8d70-90339833eb94@roeck-us.net>
 <38cca1630a12f8b6c6a9f1e7a8669714957b0d01.camel@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <38cca1630a12f8b6c6a9f1e7a8669714957b0d01.camel@fi.rohmeurope.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Nov 11, 2020 at 03:15:17PM +0000, Vaittinen, Matti wrote:
[ ... ]
> > > > +
> > > > +	priv->wdd.info			= &bd957x_wdt_ident;
> > > > +	priv->wdd.ops			= &bd957x_wdt_ops;
> > > > +	priv->wdd.min_hw_heartbeat_ms	= hw_margin_min;
> > > > +	priv->wdd.max_hw_heartbeat_ms	= hw_margin_max;
> > > > +	priv->wdd.parent		= dev;
> > > > +	priv->wdd.timeout		= (hw_margin_max / 2) * 1000;
> > > 
> > > Hmm. Just noticed this value does not make sense, right?
> > > Maximum hw_margin is 4416 ms. If I read this correctly timeout
> > > should
> > > be in seconds -  so result is around 2 000 000 seconds here. I
> > > think it
> > > is useless value...
> > > 
> > > Perhaps
> > > 	priv->wdd.timeout		= (hw_margin_max / 2) / 1000;
> > > 	if (!priv->wdd.timeout)
> > > 		priv->wdd.timeout = 1;
> > > would be more appropriate.
> > > 
> > 
> > Yes. Good catch. Actually, since max_hw_heartbeat_ms is specified,
> > it can and should be a reasonable constant (like the usual 30
> > seconds).
> > It does not and should not be bound by max_hw_heartbeat_ms.
> 
> Thanks for confirming this Guenter. I'd better admit I didn't
> understand how the max_hw_heartbeat_ms works.
> 
> If I now read the code correctly, the "watchdog worker" takes care of
> feeding for shorter periods than the "timeout" - and only stops
> feeding max_hw_heartbeat_ms before timeout expires if userland has not
> been feedin wdg. This is really cool approach for short(ish)
> max_hw_heartbeat_ms configurations as user-space does not need to meet
> "RT requirements". WDG framework is much more advanced that I knew :)

Yes, exactly, that is the idea. Various drivers used to implement this
within the driver, so it just made sense to pull the functionality into
the watchdog core.

Thanks,
Guenter
