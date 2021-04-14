Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A784035F42C
	for <lists+linux-watchdog@lfdr.de>; Wed, 14 Apr 2021 14:46:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233746AbhDNMnX (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 14 Apr 2021 08:43:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233602AbhDNMnX (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 14 Apr 2021 08:43:23 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94B8AC061574
        for <linux-watchdog@vger.kernel.org>; Wed, 14 Apr 2021 05:43:01 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id v6so29896949ejo.6
        for <linux-watchdog@vger.kernel.org>; Wed, 14 Apr 2021 05:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Bf1Sz47eyG3HV2N25IGhXia0U6TPXjcHXQy5VwYx9Yk=;
        b=Q6Otxj272rJCH4I+nhg5lhZdwIW1+BhXM/BUUMjMLrr5a+pk4VI/3N7LTgCvWCCF2w
         LxcA8uLZKlcfYiPsw3l1qbHT5+GBmWcQdLMafzLl2KpAsTMZ6n2CHHrBtp9E+m6uco+p
         x1AMsSmE397pfQclLL5jE+erHQRss1pd4Jwv8l1D+QCb1FjU+CqzCaFDaFWZ4cGFWM99
         R19e2pp1AVljvqerixhUiJS9oBdOg5MQqxwMFKJm+FM41PempgZnBlL6rDK9IwvhvV5B
         lNGo/je+hILC/i+8NjwtWjKhKFnMtYNOB64Z75JCWUDhuk5OcXFzJUD+xsjV22Ym/YvC
         CvSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Bf1Sz47eyG3HV2N25IGhXia0U6TPXjcHXQy5VwYx9Yk=;
        b=L3i13TRds99+Cw17DBT+GUtQyJ91PA3evEkYw4tksds026XpgHDnYOQRoZeKn4qdm+
         ab7mWPrgKbOgO9SHHJX15J0QeGJRLChSZrQQgW2JR9zgI05TM18PgU81bxSE9FL/TTro
         ppfkPABkGr5kVAu6b+2skp481AbHUvH+aviDFnL7/lPBVtiMcMFUSzkYaNzKKHEJ/Azv
         hB40VBftyOWBOlJMyZ0LLKhrYuUrkaAFFEVxp28QGtumnmKXJAJWGLoLvVq7b4Mu4YKX
         lSpwwLor4LlhEPKsjb6XC5RCLAC5gb0F1sct5o/cfDhFNyvcZWk81h6QUm2Vzz3GqJQn
         fFJw==
X-Gm-Message-State: AOAM531afTjssJts0HiD6miKKqW7Cy/Q1pVpEZ/E069DkPEeP/6YFBtO
        ktWL68+DLMPIf98An1UwGLk=
X-Google-Smtp-Source: ABdhPJz9/3hNackrfQU65H3kRsoOvvJBoLXdKXiST9FDeS650eLGo7Bqm5L03BTPnMabjn4GWwO31g==
X-Received: by 2002:a17:906:6ce:: with SMTP id v14mr17347199ejb.296.1618404180310;
        Wed, 14 Apr 2021 05:43:00 -0700 (PDT)
Received: from eichest-laptop (77-57-203-148.dclient.hispeed.ch. [77.57.203.148])
        by smtp.gmail.com with ESMTPSA id s3sm1934678edw.66.2021.04.14.05.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 05:42:59 -0700 (PDT)
Date:   Wed, 14 Apr 2021 14:42:58 +0200
From:   Stefan Eichenberger <eichest@gmail.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Subject: Re: [RFC] watchdog: pretimeout: add a notifier call chain governor
Message-ID: <20210414124258.GA7161@eichest-laptop>
References: <20210413154553.1968039-1-eichest@gmail.com>
 <41ec7802-e637-1177-9d16-d8fb3ff6bc3a@roeck-us.net>
 <20210413165615.GA2942421@eichest-laptop>
 <6000fb30-6feb-cf4a-a379-8ee5b3acb0de@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6000fb30-6feb-cf4a-a379-8ee5b3acb0de@roeck-us.net>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Apr 14, 2021 at 04:50:38AM -0700, Guenter Roeck wrote:
> On 4/13/21 9:56 AM, Stefan Eichenberger wrote:
> > Hi Guenter,
> > 
> > Thanks a lot for the fast feedback!
> > 
> > On Tue, Apr 13, 2021 at 09:15:35AM -0700, Guenter Roeck wrote:
> >> On 4/13/21 8:45 AM, Stefan Eichenberger wrote:
> >>> Add a governor which calls a notifier call chain. This allows the
> >>> registration of custom functions to the watchdog pretimeout. This is
> >>> useful when writing out-of-tree kernel modules and it is more similar to
> >>> the register_reboot_notifier or register_oom_notifier API.
> >>>
> >>> Signed-off-by: Stefan Eichenberger <eichest@gmail.com>
> >>
> >> It seems questionable to implement such a notification as governor.
> >> A governor is configurable, and letting userspace override notifications
> >> seems very odd and unusual. Please provide a use case.
> > 
> > What I would like to do is to have an out-of-tree module which will
> > write a pattern into a reserved memory region when a watchdog occurs.
> > After a reboot the module then read this reserved memory region and can
> > differentiate between different reset reasons. Here the example kernel
> > module:
> > https://github.com/embear-engineering/sample-kernel-modules/blob/use-watchdog-register/reset-reason/reset-reason.c
> > 
> > Registering to the watchdog happens on line 180.
> > 
> > I think I could just implement a governor in the module but it is not
> > really flexible because then I would have to compile the kernel with
> > e.g. the noop governor and then switch to my governor after the module
> > loaded. Then I thought why not using a notifier chain similar to reboot,
> > panic, or oom.
> > 
> 
> I have two problems with this: First, we do not support in-kernel code purely
> for out-of-tree drivers. Second, the idea of using a configurable notifier
> (ie one that can be disabled by userspace action) seems odd. If anything,
> that would have to be an unconditional notifier. However, again, that would
> require a use case in the upstream kernel.

I see your point. Thanks for checking anyways.

Regards,
Stefan
